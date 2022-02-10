// package com.finalTest.lins.auth;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.security.authentication.AuthenticationProvider;
// import org.springframework.security.authentication.BadCredentialsException;
// import org.springframework.security.core.Authentication;
// import org.springframework.security.core.AuthenticationException;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.stereotype.Component;

// import lombok.CustomLog;

// @Component
// public class CustomAuthenticationProvider implements AuthenticationProvider {

// @Autowired
// CustomUserDetailsService userDetailsService;

// @Autowired
// BCryptPasswordEncoder bCryptPasswordEncoder;

// @Override
// public Authentication authenticate(Authentication authentication) throws
// AuthenticationException {
// String userID = authentication.getName();
// String password = (String) authentication.getCredentials();

// UserDetails user = userDetailsService.loadUserByUsername(userID);

// if (user == null) {
// throw new BadCredentialsException("username is not found. username=" +
// username);
// }

// if (!this.bCryptPasswordEncoder.matches(password, user.getPassword())) {
// throw new BadCredentialsException("password is not matched");
// }

// return new CustomAuthenticationToken(username, password,
// user.getAuthorities());
// }

// @Override
// public boolean supports(Class<?> authentication) {
// // TODO Auto-generated method stub
// return false;
// }

// }
