// package com.finaltest.lins.config;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;
// import
// org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
// import
// org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import
// org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
// import
// org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
// import org.springframework.security.core.session.SessionRegistry;
// import org.springframework.security.core.session.SessionRegistryImpl;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

// import com.finaltest.lins.auth.CustomUserDetailsService;

// @Configuration
// @EnableWebSecurity
// public class SecurityConfig extends WebSecurityConfigurerAdapter {

// @Bean
// public BCryptPasswordEncoder passwordEncoder() {
// return new BCryptPasswordEncoder();
// }

// @Autowired
// CustomUserDetailsService userDetailsService;

// @Autowired
// void configureAuthenticationManager(AuthenticationManagerBuilder auth)
// throws Exception {
// auth.userDetailsService(userDetailsService)
// .passwordEncoder(passwordEncoder());

// }

// @Override
// protected void configure(HttpSecurity http) throws Exception {
// http.csrf().disable();

// // setting authentication
// http.authorizeRequests()
// .antMatchers("/community/write/**").authenticated()
// .antMatchers("/calendar").authenticated()
// .antMatchers("/questions/write").authenticated()
// .antMatchers("/questionListAction").authenticated()
// .antMatchers("/commentWriteAction").authenticated()
// .antMatchers("/licenseScrapAction").authenticated()
// .antMatchers("/commuScrapAction").authenticated()
// // .antMatchers("/deleteAction").authenticated()
// // .antMatchers("/modify").authenticated()
// // .antMatchers("/modifyAction").authenticated()
// .antMatchers("/myPage").authenticated()
// .antMatchers("/my-page/scrapLicense").authenticated()
// .antMatchers("/my-page/scrapCommu").authenticated()
// .antMatchers("/my-page/user-writing-list").authenticated()
// .antMatchers("/myPage_checkPasswordAction").authenticated()
// .antMatchers("/myPage_changePasswordAction").authenticated()
// .antMatchers("/myPage_changeEmailAction").authenticated()
// .antMatchers("/withdrawalAction").authenticated()
// // example
// .antMatchers("/example1/**").access("hasRole('ROLE_ADMIN') or
// hasRole('ROLE_MANAGER')")
// .antMatchers("/example2/**").access("hasRole('ROLE_ADMIN')")
// .antMatchers("/example3/**").access("hasRole('ROLE_USER')")
// .anyRequest().permitAll()
// // .and()
// ;

// // login
// http.formLogin()
// .loginPage("/index") // 기본적으로 로그인이 필요할때 이동되는 로그인 페이지
// .usernameParameter("ID")
// .loginProcessingUrl("/loginAction") // loginAction 주소가 호출 되면 시큐리티가 낚아채서 대신
// 로그인을 진행해 준다
// .defaultSuccessUrl("/"); // 기본 로그인 페이지

// // logout
// http.logout()
// .logoutUrl("/logoutAction")
// .logoutSuccessUrl("/index")
// .invalidateHttpSession(true)
// .deleteCookies("JSESSIONID");

// // session management
// http.sessionManagement()
// .maximumSessions(1)
// .maxSessionsPreventsLogin(false)
// .expiredUrl("/index")
// .sessionRegistry(sessionRegistry());
// ;

// }

// @Bean
// public SessionRegistry sessionRegistry() {
// return new SessionRegistryImpl();
// }

// }
