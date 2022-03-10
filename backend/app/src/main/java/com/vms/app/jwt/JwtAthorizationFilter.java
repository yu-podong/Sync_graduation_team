package com.vms.app.jwt;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import lombok.extern.log4j.Log4j2;

/* 권한이나 인증이 필요한 특정주소를 요청했을때 BasicAuthenticationFilter를 탐 권한이나 인증이 필요하지 않은 요청은 타지 않음 */
@Log4j2
public class JwtAthorizationFilter extends BasicAuthenticationFilter {

  // filter 상속 클래스 @Autowired 안먹음

  private JwtProvider jwtProvider;

  public JwtAthorizationFilter(AuthenticationManager authenticationManager) {
    super(authenticationManager);
  }

  public JwtAthorizationFilter(AuthenticationManager authenticationManager, JwtProvider jwtProvider) {

    super(authenticationManager);
    this.jwtProvider = jwtProvider;
  }

  @Override
  protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    log.warn("[ACCESS] JwtAthorizationFilter");

    String jwtToken = jwtProvider.resolveAccessToken(request);
    if (jwtToken == null)
      chain.doFilter(request, response);

    /* ID가져오기 */
    String ID = null;
    try {
      ID = jwtProvider.getClaimID(jwtToken);
    } catch (TokenExpiredException tokenExpiredException) {
      // tokenExpiredException.printStackTrace();
      log.error("Access Token 만료 됨 : " + tokenExpiredException.getMessage());
    } catch (SignatureVerificationException signatureVerificationException) {
      signatureVerificationException.printStackTrace();
      log.error("서명이 되지 않음 (서명 정상 X)");
    } finally {
      /* 서명 정상 확인 */
      if (ID != null) {
        /* JWT 토큰 서명을 통해서 서명이 정상이면 Authentication 객체생성 */
        Authentication authentication = jwtProvider.getAuthentication(ID);

        /* 강제로 시큐리티의 세션에 접근하여 Authentication 객체를 저장(권한 처리) */
        SecurityContextHolder.getContext().setAuthentication(authentication);

      }
      chain.doFilter(request, response);

    }

  }
}
