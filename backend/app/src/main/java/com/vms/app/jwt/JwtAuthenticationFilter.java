package com.vms.app.jwt;

import java.io.IOException;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.vms.app.auth.PrincipalDetails;
import com.vms.app.entity.User;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

//스프링 시큐리티에서 UsernamePasswordAuthenticationFilter(로그인을 수행할때 실행되는 filter)를 상속받아 JwtAuthenticationFilter를 사용 
//세션 기반 인증방식을 사용할때의 formlogin("/login")을 사용하지 않기 때문에 직접 만들어 줌
// 만든 후 security filter에 등록해야 함
@Log4j2
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
  // filter 상속 클래스 @Autowired 안먹음
  private final AuthenticationManager authenticationManager;

  private JwtProvider jwtProvider;

  public JwtAuthenticationFilter(AuthenticationManager authenticationManager,
      JwtProvider jwtProvider) {
    this.authenticationManager = authenticationManager;
    this.jwtProvider = jwtProvider;
  }

  // login 시도를 위해서 실행되는 함수
  @Override
  public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
      throws org.springframework.security.core.AuthenticationException {
    log.info("[TRY LOGIN] --- [CLASS] UsernamePasswordAuthenticationFilter --- [METHOD] attemptAuthentication ---");

    User user = null;
    ObjectMapper om = new ObjectMapper();
    try {
      user = om.readValue(request.getInputStream(), User.class);
      // log.warn("[info] user is: " + user);

      /* 토큰생성 */
      UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user.getID(),
          user.getPassword());

      /*
       * authenticationManager.authenticate(token) 호출 시
       * PrincipalDetailsService의 loadUserbyUsername()이 실행
       * authentication이 정상적으로 return 되면 DB에 있는 ID와 password가 일치한 것 = 인증완료
       */
      Authentication authentication = authenticationManager.authenticate(token);

      return authentication; /* authentication객체를 session 영역에 저장하는 방법(권한처리를 위해)이 return하는 것 */
    } catch (IOException e) {
      e.printStackTrace();
    }

    return null;
  }

  /* attemptAuthentication() 실행 후 인증이 완료되었을 때 실행 되는 함수 */
  @Override
  protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
      Authentication authResult) throws IOException, ServletException {
    log.info("[LOGIN SUCCESS]---successfulAuthentication()---");
    PrincipalDetails principalDetails = (PrincipalDetails) authResult.getPrincipal();

    /* 로그인이 완료되었기 때문에 JWT 토큰 생성 */
    response.addHeader("Authorization-AccessToken", jwtProvider.createAccessToken(principalDetails));
    response.addHeader("Authorization-RefreshToken", jwtProvider.createRefreshToken(principalDetails));

  }
}
