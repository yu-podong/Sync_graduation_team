package com.vms.app.jwt;

import java.io.IOException;
import java.net.http.HttpResponse;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vms.app.auth.PrincipalDetails;

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

    String JWT_ACCESS_TOKEN = jwtProvider.resolveAccessToken(request);
    String JWT_REFRESH_TOKEN = null;
    if (JWT_ACCESS_TOKEN == null) // header is unavailable
      chain.doFilter(request, response);

    /*
     * Access Token이 유효하지 않는 경우 RefreshToken을 들고 왔는지 확인
     * front에서 refreshToken을 들고 왔다면 refreshTokend이 유효한지 확인
     * 아닐 경우 로그아웃
     */
    if (!jwtProvider.isVaildAccessToken(JWT_ACCESS_TOKEN)) {
      JWT_REFRESH_TOKEN = jwtProvider.resolveRefreshToken(request);
      if (JWT_REFRESH_TOKEN == null) { // front에서 refreshToken을 들고 오지 않았을 때
        response.sendError(1, "Bring your REFRESH_TOKEN");
        log.info("[JwtAthorizationFilter] front단에서 REFRESH_TOEKN을 사용자의 개입 없이(별도의 처리 없이) 코드로 가져와야 합니다.");
        return;
      } else {
        if (jwtProvider.isVaildRefreshToken(JWT_REFRESH_TOKEN)) {
          // 토큰 재 발급
          String ID = jwtProvider.getClaimID(JWT_REFRESH_TOKEN);
          PrincipalDetails principalDetails = jwtProvider.createPrincipalDetails(ID);
          response.addHeader("Authorization-AccessToken", jwtProvider.createAccessToken(principalDetails));
          response.addHeader("Authorization-RefreshToken", jwtProvider.createRefreshToken(principalDetails));
          response.sendError(2,
              "Reissue your AccessToken & RefreshToken in [RESPONSE HEADER]. check your header and try again!");

          log.info(
              "[JwtAthorizationFilter] response로 ACCESS_TOKEN, REFRESH_TOKEN 을 재 발급했습니다. front단에서는 사용자의 개입 없이(별도의 처리 없이) 코드로 로그인을해야 합니다.");
          return;
        } else { // 로그 아웃(or 휴면 계정)
          log.info("[info] 로그아웃 페이지로 이동 시켜 주세요!");
          response.sendError(13, "LOGOUT");
          return;
        }
      }
    }
    /* ID가져오기 */
    String ID = null;
    ID = jwtProvider.getClaimID(JWT_ACCESS_TOKEN);

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
