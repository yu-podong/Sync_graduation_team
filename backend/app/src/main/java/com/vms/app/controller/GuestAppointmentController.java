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

import com.vms.app.entity.Appointment;
import com.vms.app.entity.Place;
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

  /* ================= Main Today Appointment List ================= */

  /*** [Guest] 메인 Toady ***/
  @ApiOperation(value = "<List>[메인 Today]", notes = "- 방문자의 [Today] 부분.\n" +
      "- 오늘의 해당하는 약속만 가져옵니다.\n" +
      "- <Strong>JWT로 인증된 방문자</Strong>(로그인이 되어 있는 상태)만 호출가능합니다.\n" +
      "- 프론트엔드에서는 요청시 Header에 발급받은 Token을 실어야지만 정상적으로 요청 가능합니다.\n" +
      "- Parameter는 필요 없습니다.\n\n" +
      "- Try out 실행 안될겁니다")
  @GetMapping(value = "/getTodayList")
  public Map<String, Object> getTodayList(Principal principal) {

    Map<String, Object> results = appointmentService_guest.getTodayList(principal.getName());
    return results;
  }

  /* ================= THREE MENU ELEVATED BUTTON ================= */
  /* ============================================================== */
  /* ============================================================== */

  /*** [GUEST] 신청내역 확인하기 ***/
  @ApiOperation(value = "<Button>[신청내역]", notes = "- 방문자의 [신청내역] 버튼을 클릭했을때의 기능입니다.\n- 승인, 거절, 대기중인 모든 약속이 시간순으로 보여집니다.\n- <Strong>JWT로 인증된 방문자</Strong>(로그인이 되어 있는 상태)만 호출가능합니다.\n - 프론트엔드에서는 요청시 Header에 발급받은 Token을 실어야지만 정상적으로 요청 가능합니다.\n- Parameter는 필요 없습니다.\n\n- Try out 실행 안될겁니다")
  @GetMapping("/getMyHistory")
  public Map<String, Object> getMyHistory(Principal principal) {
    Map<String, Object> results = appointmentService_guest.getMyHistory(principal.getName());
    return results;
  }

  /*** [GUEST] 승인결과내역 ***/
  @ApiOperation(value = "<Button>[승인결과내역]", notes = "- 방문자의 [승인결과내역] 버튼을 클릭했을 때의 기능입니다.\n- 승인된 결과에 대해서 데이터를 가져옵니다.(isApproval = 1) \n"
      + "- Parameter는 필요 없습니다.\n\n- Try out 실행 안될겁니다")
  @GetMapping("/getApprovalResult")
  public Map<String, Object> getApprovalResult(Principal principal) {
    Map<String, Object> results = appointmentService_guest.getApprovalResult(principal.getName());

    return results;

  }

  /*** [GUEST] 방문이력 ***/
  @ApiOperation(value = "<Button>[방문이력]", notes = "- 방문자의 [방문이력] 버튼을 클릭했을 때의 기능입니다.\n- 현재시간을 기준으로 checkout(방문종료시간)이 작은 값, 즉 이미 방문을 마친 약속만 보여집니다.\n - <Strong>JWT로 인증된 방문자</Strong>(로그인이 되어 있는"
      +
      "상태)만 호출가능합니다.\n - 프론트엔드에서는 요청시 Header에 발급받은 Token을 실어야지만 정상적으로 요청 가능합니다.\n-" +
      "Parameter는 필요 없습니다.\n\n- Try out 실행 안될겁니다")
  @GetMapping("/getMyAppointment")
  public Map<String, Object> getMyAppointment(Principal principal) {

    Map<String, Object> results = appointmentService_guest.getMyAppointment(principal.getName());

    return results;
  }
  /* ============================================================== */
  /* ============================================================== */
  /* ============================================================== */

  /*** [GUEST] 도착 알림 보내기 ***/
  @ApiOperation(value = "<Button>[도착알림]", notes = "- 방문자가 [도착알림] 버튼을 눌렀을 때의 기능입니다. \n- 방문자가 도착했을 때 해당 버튼을 누르면 접견자에게 도착알림이 전송됩니다.\n- 방문날짜/시각 1시간 전후로만 버튼이 눌립니다.<b>(구현예정)</b>\n- DB의 해당 약속이 isArrival = 1으로 저장됩니다.")
  @PostMapping("/sendArrived")
  public int sendArrived(long appointmentID) {
    return appointmentService_guest.sendArrived(appointmentID);
  }

  /*** [GUEST] 약속 생성 ***/
  @ApiOperation(value = "<Button>[약속 생성]", notes = "- 방문자가 [+] 버튼을 눌렀을 때의 기능입니다. \n- 약속을 생성하기 위한 기능입니다. \n <Strong>JWT로 인증된 방문자</Strong>(로그인이 되어 있는 상태)만 호출가능합니다.\n- 프론트엔드에서는 요청시 Header에 발급받은 Token을 실어야지만 정상적으로 요청 가능합니다.\n\n- Try out 실행 안될겁니다")
  @PostMapping("/createAppointment")
  public int createAppointment(Principal principal, String hostID, int placeID, Appointment appointment, String checkIn,
      String checkOut) {

    log.info("**[VMS]** " + principal.getName() + " 방문자가 약속생성을 하였습니다.\n");

    return appointmentService_guest.createAppointment(principal.getName(), hostID, placeID, appointment, checkIn,
        checkOut);
  }

  /*** [GUEST] 동행여부 동의하기 ***/
  @ApiOperation(value = "동행인 여부 링크 클릭", notes = "- api요청시 데이터베이스에 해당 약속의 동행인으로 추가 됩니다.")
  @PostMapping("/agreeAccompany")
  public int agreeAccompany(Principal principal, long appointmentID) {
    return appointmentService_guest.agreeAccompany(principal.getName(), appointmentID);
  }

}
