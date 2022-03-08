package com.vms.app.controller;

import javax.servlet.http.HttpServletRequest;

import com.vms.app.entity.User;
import com.vms.app.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class UserController {

  @Autowired
  private UserService userService;

  @ModelAttribute("cp")
  public String getContextPath(HttpServletRequest request) {
    return request.getContextPath();
  }

  @PostMapping("/join")
  public String postMethodName(User user) {
    userService.join(user);

    return "JOIN SUCCESS";
  }

}
