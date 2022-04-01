package com.vms.app.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.vms.app.service.AppointmentService_guest;
import com.vms.app.service.AppointmentService_host;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class CommonAppointmentController {

  @ModelAttribute("cp")
  public String getContextPath(HttpServletRequest request) {
    return request.getContextPath();
  }

  @Autowired
  AppointmentService_guest appointmentService_guest;

  @Autowired
  AppointmentService_host appointmentService_host;

  /*** [HOST & GUEST] 약속 거절 ***/
  @GetMapping("/getMyAppointment")
  public Map<String, Object> getMyAppointment(String ID, String tempRole) {
    /*
     * 1. 로그인 체크 (security나 interceptor에서)
     */

    // guestService에서 분기
    Map<String, Object> results = appointmentService_guest.getMyAppointment(ID, tempRole);

    return results;
  }
}
