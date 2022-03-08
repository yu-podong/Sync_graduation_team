package com.vms.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class JWTRestController {

  @GetMapping("/home")
  public String home() {
    return "<H1>hello</H1>";
  }

  @PostMapping("/jwt_send")
  public String JWTpost() {
    return "JWTpost";
  }
}
