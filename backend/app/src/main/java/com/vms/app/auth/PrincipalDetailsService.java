package com.vms.app.auth;

import com.vms.app.entity.User;
import com.vms.app.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class PrincipalDetailsService implements UserDetailsService {

  @Autowired
  private UserRepository userRepository;

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    log.info("[TRY LOGIN] --- [CLASS] PrincipalDetailsService --- [METHOD] loadUserByUsername ---");

    User user = userRepository.findById(username).get();
    if (user != null) {
      return new PrincipalDetails(user);
    }
    return null;
  }

}
