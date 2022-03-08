package com.vms.app.service;

import com.vms.app.entity.User;
import com.vms.app.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class UserServiceImpl implements UserService {

  @Autowired
  private PasswordEncoder bCryptPasswordEncoder;

  @Autowired
  private UserRepository userRepository;

  @Transactional
  @Override
  public String join(User user) {

    // 해당 아이디가 존재하는지 (중복확인할 것)

    log.info("ID : " + user.getID());
    log.info("password : " + user.getPassword());

    user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
    user.setRole("ROLE_USER");

    // not null 필드 임시 방지용
    user.setIdentityNum("updateEmail");
    user.setName("김승연1");
    user.setPhoneNum("01021111114");

    User usertemp = userRepository.save(user);

    return null;
  }

}
