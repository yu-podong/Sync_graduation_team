package com.vms.app.controller;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import com.vms.app.entity.Appointment;
import com.vms.app.service.AppointmentService_guest;
import com.vms.app.service.AppointmentService_guestImpl;
import com.vms.app.service.AppointmentService_host;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

/*
  0. Security로 해당 아이디 확인 후 url에 접속가능한 권한만 넘기기
  
  1. 회원가입 로그인 기능 구현이 되지않아 회원의 정보를 읽어 올 수 없으므로 id를 get요청으로 보내고
    실제 Controller에서는 session이나 JWT로 받아오기 (get요청으로 아이디 넘기지 말기) 
    
  2. Controller는 하나로 만들고 추가 확장 고려해 Service단만 host와 guest로 나누기 

  3. [Service 단] 구현
    3-1. [Host] 요청된 약속 관리 : 현재 처리 진행중인 약속들(호스트 Service)
         호스트 : 처리해야할 약속들만(isAprroval = 0)
         
    3-2. [Host][Guest] 내 약속 보기 : 여태 있었던 약속들 (★호스트 게스트 Service단 따로 Controller 요청은 같이★)
          - 승인된 약속들만 (isApproval = 1) 
          
    3-3. [Guest] 신청내역 확인하기
    
    
    <나중에 구현할 것>
    3-4.[Guest] 도착 알림 보내기 (isArrival = 1)
    [Host] 내 약속 보기 수정 : 호스트가 임의로 약속을 수정할 수 있는 ??? (호스트 Service)
*/

@Log4j2
@RestController
public class Prototype_AppointmentController {

  @ModelAttribute("cp")
  public String getContextPath(HttpServletRequest request) {
    return request.getContextPath();
  }

  @Autowired
  AppointmentService_guest appointmentService_guest;

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

  @GetMapping("/getMyAppointment")
  public Map<String, Object> getMyAppointment(String ID, String tempRole) {
    /*
     * 1. 로그인 체크 (security나 interceptor에서)
     */

    // guestService에서 분기
    Map<String, Object> results = appointmentService_guest.getMyAppointment(ID, tempRole);

    return results;
  }

  /*** [Guest] 신청내역 확인하기 ***/
  @GetMapping("/getMyHistory")
  public Map<String, Object> getMyHistory(String ID) {
    /*
     * 1. 로그인 체크 (security나 interceptor에서)
     */

    /*** [Host][Guest] 내 약속 보기 ***/
    Map<String, Object> results = appointmentService_guest.getMyHistory(ID);
    return results;
  }

  /*** [GUEST] 도착 알림 보내기 ***/
  @PostMapping("/sendArrived")
  public int sendArrived(long appointmentID) {
    /*
     * 1. 로그인 체크 (security나 interceptor에서)
     * 2. 권한체크 (security나 interceptor에서)
     */

    return appointmentService_guest.sendArrived(appointmentID);
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

}
