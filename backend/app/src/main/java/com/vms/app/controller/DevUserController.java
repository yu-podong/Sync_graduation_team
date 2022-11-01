package com.vms.app.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vms.app.entity.User;
import com.vms.app.service.UserService;

import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/dev/user")
public class DevUserController {

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

  @ApiOperation(value = "<상단 네비게이션>[MyInfo.dart]", notes = "- 유저와 회사정보를 가져옵니다. \n")
  @GetMapping("/getUserInfo")
  public Map<String, Object> getUserInfo(String ID) {
    return userService.getUserInfo(ID);
  }

}
