package com.vms.app.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.vms.app.jwt.JwtAthorizationFilter;
import com.vms.app.jwt.JwtAuthenticationFilter;
import com.vms.app.jwt.JwtProvider;
import com.vms.app.repository.UserRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired
  JwtProvider jwtProvider;

  @Autowired
  private UserRepository userRepository;

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {

    // JWT Version
    http.csrf().disable();
    http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS) // Session 사용 X
        .and()
        .formLogin().disable()
        .httpBasic().disable()
        // 기존 코드
        // .addFilter(new JwtAuthenticationFilter(authenticationManager()))
        // .addFilter(new JwtAthorizationFilter(authenticationManager(),
        // userRepository))

        /* JwtProvider를 사용하기 위해 새로 만든 constructor */
        /*********************************************************************************************/
        .addFilter(new JwtAuthenticationFilter(authenticationManager(), jwtProvider))
        .addFilter(new JwtAthorizationFilter(authenticationManager(), jwtProvider))
        /********************************************************************************************** */
        .authorizeRequests()
        .antMatchers("/user/**")
        .access("hasRole('ROLE_USER') or hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')")
        .antMatchers("/manager/**")
        .access("hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')")
        .antMatchers("/admin/**")
        .access("hasRole('ROLE_ADMIN')")
        .anyRequest().permitAll();
  }

  /* Swagger3를 이용하기 위해 관련 url을 ignore */
  @Override
  public void configure(WebSecurity web) {
    web.ignoring()
        .antMatchers("/favicon.ico", "/error", "/swagger-ui/**", "/swagger-resources/**", "/v3/api-docs");
  }

  @Bean
  public SessionRegistry sessionRegistry() {
    return new SessionRegistryImpl();
  }

}
