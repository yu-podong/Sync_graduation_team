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

import com.vms.app.service.AppointmentService_guest;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Api("방문자의 기능을 담당하는 Controller 입니다")
@RequestMapping("/guest")
@RestController
public class GuestAppointmentController {

  @ModelAttribute("cp")
  public String getContextPath(HttpServletRequest request) {
    return request.getContextPath();
  }

  @Autowired
  AppointmentService_guest appointmentService_guest;

  @ApiOperation(value = "[Button]신청내역", notes = "- 방문자의 신청내역 버튼을 클릭했을때의 기능입니다.\n - <Strong>JWT로 인증된 방문자</Strong>(로그인이 되어 있는 상태)만 호출가능합니다.\n - 프론트엔드에서는 요청시 Header에 발급받은 Token을 실어야지만 정상적으로 요청 가능합니다.\n- Parameter는 필요 없습니다.\n\n- Try out 실행 안될겁니다")
  /*** [GUEST] 신청내역 확인하기 ***/
  @GetMapping("/getMyHistory")
  public Map<String, Object> getMyHistory(Principal principal) {
    Map<String, Object> results = appointmentService_guest.getMyHistory(principal.getName());
    return results;
  }

  /*** [GUEST] 도착 알림 보내기 ***/
  @PostMapping("/sendArrived")
  public int sendArrived(long appointmentID) {
    return appointmentService_guest.sendArrived(appointmentID);
  }

  /*** [GUEST] 내 약속 가져오기 ***/
  // (guest 기능에는 없는 것 같은데 혹시 모르니 만들어 놓음)
  @GetMapping("/getMyAppointment")
  public Map<String, Object> getMyAppointment(Principal principal) {

    Map<String, Object> results = appointmentService_guest.getMyAppointment(principal.getName());

    return results;
  }
}
