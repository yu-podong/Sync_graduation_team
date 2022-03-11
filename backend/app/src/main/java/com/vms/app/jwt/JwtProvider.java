package com.vms.app.jwt;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.vms.app.auth.PrincipalDetails;
import com.vms.app.entity.User;
import com.vms.app.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Component
@RequiredArgsConstructor
@Log4j2
public class JwtProvider {

  @Autowired
  UserRepository userRepository;

  private final String ACCESS_TOKEN_HEADER_NAME = "Authorization-AccessToken";
  private final String REFRESH_TOKEN_HEADER_NAME = "Authorization-RefreshToken";
  private final String BEARER_TYPE = "Bearer ";
  private final String ISSUER = "VMS SERVER";
  private final String FIRST_SUBJECT = "VMS JWT TOKEN";
  private final String SECOND_SUBJECT = "ID"; // DO NOT CHANGE!
  private final String THIRD_SUBJECT = "phoneNum";

  private final long ACCESS_EXPIRE_TIME = 1000L * 20; // 10초 (TEST CODE)
  private final long REFRESH_EXPIRE_TIME = (1000L * 60 * 60 * 24) * 60; // 60일
  // private final long ACCESS_EXPIRE_TIME = 1000L * 60 * 10; // 10분
  // private final long REFRESH_EXPIRE_TIME = (1000L * 60 * 60 * 24) * 60; // 60일
  private final String SECRET_KEY = "vms";

  /* Create Access Token */
  public String createAccessToken(PrincipalDetails principalDetails) {
    String JwtToken = JWT.create()
        .withSubject(this.FIRST_SUBJECT)
        .withIssuer(ISSUER)
        .withIssuedAt(new Date(System.currentTimeMillis()))
        .withExpiresAt(new Date(System.currentTimeMillis() + ACCESS_EXPIRE_TIME)) // 10분
        .withClaim(this.SECOND_SUBJECT, principalDetails.getUsername()) // 비공개 클레임
        .withClaim(this.THIRD_SUBJECT,
            principalDetails.getUser().getPhoneNum()) // 비공개 클레임
        .sign(Algorithm.HMAC512(SECRET_KEY));

    return BEARER_TYPE + JwtToken;
  }

  /* Create Refresh Token */
  @Transactional
  public String createRefreshToken(PrincipalDetails principalDetails) {
    String JwtToken = JWT.create()
        .withSubject(this.FIRST_SUBJECT)
        .withIssuer(ISSUER)
        .withIssuedAt(new Date(System.currentTimeMillis()))
        .withExpiresAt(new Date(System.currentTimeMillis() + REFRESH_EXPIRE_TIME)) // 60일
        .withClaim(this.SECOND_SUBJECT, principalDetails.getUsername()) // 비공개 클레임
        .withClaim(this.THIRD_SUBJECT,
            principalDetails.getUser().getPhoneNum()) // 비공개 클레임
        .sign(Algorithm.HMAC512(SECRET_KEY));

    String ID = principalDetails.getUser().getID();
    this.updateRefreshToken(ID, BEARER_TYPE + JwtToken);
    return BEARER_TYPE + JwtToken;
  }

  /* 토큰 재 발생 (A.T + R.T) */
  // public String reIssue(PrincipalDetails principalDetails, String refreshToken)
  // {
  // String JwtToken = JWT.create()
  // .withSubject(this.FIRST_SUBJECT)
  // .withIssuer(ISSUER)
  // .withIssuedAt(new Date(System.currentTimeMillis()))
  // .withExpiresAt(new Date(System.currentTimeMillis() + REFRESH_EXPIRE_TIME)) //
  // 60일
  // .withClaim(this.SECOND_SUBJECT, principalDetails.getUsername()) // 비공개 클레임
  // .withClaim(this.THIRD_SUBJECT,
  // principalDetails.getUser().getPhoneNum()) // 비공개 클레임
  // .sign(Algorithm.HMAC512(SECRET_KEY));

  // return BEARER_TYPE + JwtToken;
  // }

  /* Header에서 Access Token 가져오기 */
  public String resolveAccessToken(HttpServletRequest request) {
    String jwtHeader = request.getHeader(this.ACCESS_TOKEN_HEADER_NAME);

    // Header가 있는지 확인
    return (jwtHeader == null || !jwtHeader.startsWith(this.BEARER_TYPE)) ? null
        : jwtHeader.replace(this.BEARER_TYPE, "");

  }

  /* Header에서 Refresh Token 가져오기 */
  public String resolveRefreshToken(HttpServletRequest request) {
    String jwtHeader = request.getHeader(this.REFRESH_TOKEN_HEADER_NAME);

    // Header가 있는지 확인
    return (jwtHeader == null || !jwtHeader.startsWith(this.BEARER_TYPE)) ? null
        : jwtHeader.replace(this.BEARER_TYPE, "");

  }

  /* Access Token 만료되었는지 확인 */
  public boolean isVaildAccessToken(String jwtToken) {
    try {
      DecodedJWT decodedJWT = JWT.require(Algorithm.HMAC512(SECRET_KEY)).build().verify(jwtToken);
      Date currentTime = new Date(System.currentTimeMillis());
      Date expiresAt_AccessToken = decodedJWT.getExpiresAt();
      return expiresAt_AccessToken.compareTo(currentTime) > 0 ? true : false;
    } catch (TokenExpiredException tokenExpiredException) {
      log.error("[JwtProvider : isVaildAccessToken] Access Token 만료 됨");
    } catch (SignatureVerificationException signatureVerificationException) {
      log.error("[JwtProvider : isVaildAccessToken] ***서명이 되지 않음*** (서명 정상 X)");
    }
    return false;
  }

  /* Refresh Token 만료되었는지 확인 */
  public boolean isVaildRefreshToken(String jwtToken) {
    try {
      DecodedJWT decodedJWT = JWT.require(Algorithm.HMAC512(SECRET_KEY)).build().verify(jwtToken);
      Date currentTime = new Date(System.currentTimeMillis());
      Date expiresAt_RefreshToken = decodedJWT.getExpiresAt();
      return expiresAt_RefreshToken.compareTo(currentTime) > 0 ? true : false;
    } catch (TokenExpiredException tokenExpiredException) {
      log.error("[JwtProvider : isVaildRefreshToken] Access Token 만료 됨");
    } catch (SignatureVerificationException signatureVerificationException) {
      log.error("[JwtProvider : isVaildRefreshToken] ***서명이 되지 않음*** (서명 정상 X)");
    }
    return false;
  }

  /* 서명을 통해 Token 의 ID 가져오기 */
  public String getClaimID(String jwtToken) {
    String result = null;
    try {
      result = JWT.require(Algorithm.HMAC512(SECRET_KEY)).build().verify(jwtToken).getClaim("ID").asString();
      return result;
    } catch (TokenExpiredException tokenExpiredException) {
      log.error("[JwtProvider : getClaimID] Access Token 만료 됨");
    } catch (SignatureVerificationException signatureVerificationException) {
      log.error("[JwtProvider : getClaimID] ***서명이 되지 않음*** (서명 정상 X)");
    }
    return null;
  }

  /* 인증 정보 가져오기 */
  public UsernamePasswordAuthenticationToken getAuthentication(String ID) {

    User user = userRepository.findById(ID).orElse(null);
    PrincipalDetails principalDetails = new PrincipalDetails(user);

    /* JWT 토큰 서명을 통해서 서명이 정상이면 Authentication 객체생성 */
    return new UsernamePasswordAuthenticationToken(principalDetails, null, principalDetails.getAuthorities());
  }

  public PrincipalDetails createPrincipalDetails(String ID) {
    User user = userRepository.findById(ID).orElse(null);
    return new PrincipalDetails(user);
  }

  /* DB에 refreshToken 업데이트 */
  public void updateRefreshToken(String ID, String refreshToken) {
    try {
      User user = userRepository.findById(ID).orElse(null);
      user.setRefreshToken(refreshToken);
    } catch (Exception e) {
      log.warn("[JwtProvider : updateRefreshToken] : Maybe user is null");
      e.printStackTrace();
    }
  }

  /* DB에 refreshToken이 일치한지 확인 */
  public boolean isEqualsRefreshToken(String ID, String refreshToken) {
    User user = userRepository.findById(ID).orElse(null);
    return user.getRefreshToken().equals(refreshToken) ? true : false;
  }
}
