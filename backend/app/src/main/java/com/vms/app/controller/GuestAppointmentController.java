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

  // public String commonJWTNote = "\n - <Strong>JWT로 인증된 방문자</Strong>(로그인이 되어 있는
  // 상태)만 호출가능합니다.\n - 프론트엔드에서는 요청시 Header에 발급받은 Token을 실어야지만 정상적으로 요청 가능합니다.\n-
  // Parameter는 필요 없습니다.\n\n- Try out 실행 안될겁니다";

  @Autowired
  AppointmentService_guest appointmentService_guest;

  @ApiOperation(value = "<Button>[신청내역]", notes = "- 방문자의 [신청내역] 버튼을 클릭했을때의 기능입니다.\n- 승인, 거절, 대기중인 모든 약속이 시간순으로 보여집니다.\n- <Strong>JWT로 인증된 방문자</Strong>(로그인이 되어 있는 상태)만 호출가능합니다.\n - 프론트엔드에서는 요청시 Header에 발급받은 Token을 실어야지만 정상적으로 요청 가능합니다.\n- Parameter는 필요 없습니다.\n\n- Try out 실행 안될겁니다")
  /*** [GUEST] 신청내역 확인하기 ***/
  @GetMapping("/getMyHistory")
  public Map<String, Object> getMyHistory(Principal principal) {
    Map<String, Object> results = appointmentService_guest.getMyHistory(principal.getName());
    return results;
  }

  /*** [GUEST] 도착 알림 보내기 ***/
  @ApiOperation(value = "<Button>[도착알림]", notes = "- 방문자가 [도착알림] 버튼을 눌렀을 때의 기능입니다.(figma에서 없어졌네요?!) \n- 방문자가 도착했을 때 해당 버튼을 누르면 접견자에게 도착알림이 전송됩니다.\n- 방문날짜/시각 1시간 전후로는 버튼이 눌리지 않습니다<b>(구현예정)</b>\n- DB의 해당 약속이 isArrival = 1으로 저장됩니다.")
  @PostMapping("/sendArrived")
  public int sendArrived(long appointmentID) {
    return appointmentService_guest.sendArrived(appointmentID);
  }

  /*** [GUEST] 방문이력 ***/
  @ApiOperation(value = "<Button>[방문이력]", notes = "- 방문자의 [방문이력] 버튼을 클릭했을 때의 기능입니다.\n- 현재시간을 기준으로 checkout(방문종료시간)이 작은 값, 즉 이미 방문을 마친 약속만 보여집니다.<b>(구현예정)</b>\n - <Strong>JWT로 인증된 방문자</Strong>(로그인이 되어 있는"
      +
      "상태)만 호출가능합니다.\n - 프론트엔드에서는 요청시 Header에 발급받은 Token을 실어야지만 정상적으로 요청 가능합니다.\n-" +
      "Parameter는 필요 없습니다.\n\n- Try out 실행 안될겁니다")
  @GetMapping("/getMyAppointment")
  public Map<String, Object> getMyAppointment(Principal principal) {

    Map<String, Object> results = appointmentService_guest.getMyAppointment(principal.getName());

    return results;
  }

  // [GUEST] 승인결과 내역 구현할 것 isApproval = 1, 방문이력이랑 다른점 :날짜 체크 하지 않고 전부 가져오기
}
