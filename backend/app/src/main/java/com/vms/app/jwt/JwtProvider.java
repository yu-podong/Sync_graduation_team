package com.vms.app.jwt;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.vms.app.auth.PrincipalDetails;
import com.vms.app.entity.User;
import com.vms.app.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Component;

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
  private final String FIRST_SUBJECT = "VMS JWT TOKEN";
  private final String SECOND_SUBJECT = "ID"; // DO NOT CHANGE!
  private final String THIRD_SUBJECT = "phoneNum";

  private final long ACCESS_EXPIRE_TIME = 1000L * 10; // 10초 (TEST CODE)
  // private final long ACCESS_EXPIRE_TIME = 1000L * 60 * 10; // 10분
  private final long REFRESH_ECPIRE_TIME = (1000L * 60 * 60 * 24) * 60; // 60일
  private final String SECRET_KEY = "vms";

  /* Create Access Token */
  public String createAccessToken(PrincipalDetails principalDetails) {
    String JwtToken = JWT.create()
        .withSubject(this.FIRST_SUBJECT)
        .withExpiresAt(new Date(System.currentTimeMillis() + ACCESS_EXPIRE_TIME)) // 10분
        .withClaim(this.SECOND_SUBJECT, principalDetails.getUsername()) // 비공개 클레임
        .withClaim(this.THIRD_SUBJECT,
            principalDetails.getUser().getPhoneNum()) // 비공개 클레임
        .sign(Algorithm.HMAC512(SECRET_KEY));

    return BEARER_TYPE + JwtToken;
  }

  /* Create Refresh Token */
  public String createRefreshToken(PrincipalDetails principalDetails) {
    String JwtToken = JWT.create()
        .withSubject(this.FIRST_SUBJECT)
        .withExpiresAt(new Date(System.currentTimeMillis() + REFRESH_ECPIRE_TIME)) // 60일
        .withClaim(this.SECOND_SUBJECT, principalDetails.getUsername()) // 비공개 클레임
        .withClaim(this.THIRD_SUBJECT,
            principalDetails.getUser().getPhoneNum()) // 비공개 클레임
        .sign(Algorithm.HMAC512(SECRET_KEY));

    return BEARER_TYPE + JwtToken;
  }

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

  /* 서명을 통해 Token 의 ID 가져오기 */
  public String getClaimID(String jwtToken) {
    String result = null;
    try {
      result = JWT.require(Algorithm.HMAC512(SECRET_KEY)).build().verify(jwtToken).getClaim("ID").asString();
      return result;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public UsernamePasswordAuthenticationToken getAuthentication(String ID) {

    User user = userRepository.findById(ID).orElse(null);
    PrincipalDetails principalDetails = new PrincipalDetails(user);

    /* JWT 토큰 서명을 통해서 서명이 정상이면 Authentication 객체생성 */
    return new UsernamePasswordAuthenticationToken(principalDetails, null, principalDetails.getAuthorities());
  }
}
