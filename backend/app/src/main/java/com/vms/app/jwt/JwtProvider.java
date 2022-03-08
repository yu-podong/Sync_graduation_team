package com.vms.app.jwt;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.vms.app.auth.PrincipalDetails;
import com.vms.app.auth.PrincipalDetailsService;
import com.vms.app.entity.User;
import com.vms.app.repository.UserRepository;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
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

  private final long ACCESS_EXPIRE_TIME = 1000L * 60 * 10; // 10분
  private final long REFRESH_ECPIRE_TIME = (1000L * 60 * 60 * 24) * 60; // 60일
  private final String BEARER_TYPE = "Bearer ";
  private final String SECRET_KEY = "vms";

  private final PrincipalDetailsService principalDetailsService;

  public String createAccessToken(PrincipalDetails principalDetails) {
    String JwtToken = JWT.create()
        .withSubject("VMS JWT TOKEN")
        .withExpiresAt(new Date(System.currentTimeMillis() + ACCESS_EXPIRE_TIME)) // 10분
        .withClaim("ID", principalDetails.getUsername()) // 비공개 클레임
        .withClaim("phoneNum",
            principalDetails.getUser().getPhoneNum()) // 비공개 클레임
        .sign(Algorithm.HMAC512(SECRET_KEY));

    return BEARER_TYPE + JwtToken;
  }

  public String createRefreshToken(PrincipalDetails principalDetails) {
    String JwtToken = JWT.create()
        .withSubject("VMS JWT TOKEN")
        .withExpiresAt(new Date(System.currentTimeMillis() + REFRESH_ECPIRE_TIME)) // 60일
        .withClaim("ID", principalDetails.getUsername()) // 비공개 클레임
        .withClaim("phoneNum",
            principalDetails.getUser().getPhoneNum()) // 비공개 클레임
        .sign(Algorithm.HMAC512(SECRET_KEY));

    return BEARER_TYPE + JwtToken;
  }

  public String verifyJwtToken(String jwtToken) {
    String result = null;
    try {
      result = JWT.require(Algorithm.HMAC512(SECRET_KEY)).build().verify(jwtToken).getClaim("ID").asString();
      return result;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public String resolveToken(HttpServletRequest request) {
    String jwtHeader = request.getHeader("Authorization");
    // log.warn("Authorization : " + jwtHeader);

    /* Header가 있는지 확인 */
    if (jwtHeader == null || !jwtHeader.startsWith("Bearer")) {
      // chain.doFilter(request, response);
      return null;
    }

    /* JWT토큰을 검증해서 정상적인 사용자 인지 확인 */
    String jwtToken = jwtHeader.replace("Bearer ", "");
    return jwtToken;

  }

  public UsernamePasswordAuthenticationToken getAuthentication(String ID) {

    User user = userRepository.findById(ID).orElse(null);
    PrincipalDetails principalDetails = new PrincipalDetails(user);

    /* JWT 토큰 서명을 통해서 서명이 정상이면 Authentication 객체생성 */
    return new UsernamePasswordAuthenticationToken(principalDetails, null, principalDetails.getAuthorities());
  }
}
