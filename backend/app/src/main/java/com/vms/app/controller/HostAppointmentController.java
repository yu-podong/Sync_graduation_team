package com.vms.app.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.vms.app.service.AppointmentService_guest;
import com.vms.app.service.AppointmentService_host;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/host")
@RestController
public class HostAppointmentController {

  @ModelAttribute("cp")
  public String getContextPath(HttpServletRequest request) {
    return request.getContextPath();
  }

  @Autowired
  AppointmentService_host appointmentService_host;

  /*** [Host] 요청된 약속 관리 ***/
  @GetMapping("/getRequestedAppointment")
  public Map<String, Object> getRequestedAppointment(String ID) {
    /*
     * 1. 로그인 체크 (security나 interceptor에서)
     */

    Map<String, Object> results = appointmentService_host.getRequestedAppointment(ID);

    return results;
  }

  /*** [HOST] 약속 승인 ***/
  @PostMapping("/approvalAppointment")
  public int approvalAppointment(long appointmentID) {
    /*
     * 1. 로그인 체크 (security나 interceptor에서)
     * 2. 권한체크 (security나 interceptor에서)
     */

    return appointmentService_host.approvalAppointment(appointmentID);
  }

  /*** [HOST] 약속 거절 ***/
  @PostMapping("/rejectAppointment")
  public int rejectAppointment(long appointmentID, String rejectReason) {
    /*
     * 1. 로그인 체크 (security나 interceptor에서)
     * 2. 권한체크 (security나 interceptor에서)
     */

    return appointmentService_host.rejectAppointment(appointmentID, rejectReason);
  }

  /*** [HOST] 내 약속 가져오기 ***/
  @GetMapping("/getMyAppointment")
  public Map<String, Object> getMyAppointment(String ID) {
    /*
     * 1. 로그인 체크 (security나 interceptor에서)
     */

    Map<String, Object> results = appointmentService_host.getMyAppointment(ID);

    return results;
  }

}
