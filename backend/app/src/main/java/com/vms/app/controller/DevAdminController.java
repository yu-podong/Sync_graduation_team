package com.vms.app.controller;

import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vms.app.entity.User;
import com.vms.app.service.AppointmentService_admin;
import com.vms.app.service.UserService;

import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/dev/admin")
public class DevAdminController {

  @Autowired
  private AppointmentService_admin appointmentService_admin;

  @ModelAttribute("cp")
  public String getContextPath(HttpServletRequest request) {
    return request.getContextPath();
  }

  @ApiOperation(value = "[AdminMainPage.dart 모든 약속 정보 가져오기]", notes = "- 모든 약속에 대한 정보를 가져옵니다. \n- 관리자만 접근 가능합니다")
  @GetMapping("/getAllAppointment")
  public Map<String, Object> getAllAppointment() {

    return appointmentService_admin.getAllAppointment();
  }

}
