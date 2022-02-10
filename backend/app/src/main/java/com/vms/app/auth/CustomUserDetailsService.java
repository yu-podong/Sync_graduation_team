// package com.finaltest.lins.auth;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.security.core.userdetails.UserDetailsService;
// import
// org.springframework.security.core.userdetails.UsernameNotFoundException;
// import org.springframework.stereotype.Service;

// import com.finaltest.lins.domain.User;
// import com.finaltest.lins.repository.UserRepository;

// @Service
// public class CustomUserDetailsService implements UserDetailsService {

// @Autowired
// private UserRepository userRepository;

// @Override
// public UserDetails loadUserByUsername(String username) throws
// UsernameNotFoundException {
// User user = userRepository.findByID(username);
// if (user != null) {
// return new CustomUserDetails(user);
// }
// return null;
// }

// }
