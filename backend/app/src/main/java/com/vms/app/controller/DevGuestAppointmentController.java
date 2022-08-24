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
@RestController
@Api("방문자의 기능을 담당하는 Controller 입니다")
@RequestMapping("/dev/guest")
public class DevGuestAppointmentController {

  @ModelAttribute("cp")
  public String getContextPath(HttpServletRequest request) {
    return request.getContextPath();
  }

  @Autowired
  AppointmentService_guest appointmentService_guest;
  /* ================= Main Today Appointment List ================= */

  /*** [GUEST] 메인 Toady ***/
  @GetMapping(value = "/getTodayList")
  public Map<String, Object> getTodayList(String ID) {

    Map<String, Object> results = appointmentService_guest.getTodayList(ID);
    return results;
  }

  /* ================= THREE MENU ELEVATED BUTTON ================= */
  /* ============================================================== */
  /* ============================================================== */

  /*** [GUEST] 신청내역 확인하기 ***/
  @ApiOperation(value = "<Button>[신청내역]", notes = "- 방문자의 [신청내역] 버튼을 클릭했을때의 기능입니다.\n- 승인, 거절, 대기중인 모든 약속이 시간순으로 보여집니다.\n")
  @GetMapping("/getMyHistory")
  public Map<String, Object> getMyHistory(String ID) {
    Map<String, Object> results = appointmentService_guest.getMyHistory(ID);
    return results;
  }

  /*** [GUEST] 승인결과내역 ***/
  @ApiOperation(value = "<Button>[승인결과내역]", notes = "- 방문자의 [승인결과내역] 버튼을 클릭했을 때의 기능입니다.\n- 승인된 결과에 대해서 데이터를 가져옵니다.(isApproval = 1) \n")
  @GetMapping("/getApprovalResult")
  public Map<String, Object> getApprovalResult(String ID) {
    Map<String, Object> results = appointmentService_guest.getApprovalResult(ID);

    return results;

  }

  /*** [GUEST] 방문이력 ***/
  @ApiOperation(value = "<Button>[방문이력]", notes = "- 방문자의 [방문이력] 버튼을 클릭했을 때의 기능입니다.\n- 현재시간을 기준으로 checkout(방문종료시간)이 작은 값, 즉 이미 방문을 마친 약속만 보여집니다.\n\n")
  @GetMapping("/getMyAppointment")
  public Map<String, Object> getMyAppointment(String ID) {

    Map<String, Object> results = appointmentService_guest.getMyAppointment(ID);

    return results;
  }
  /* ============================================================== */
  /* ============================================================== */
  /* ============================================================== */

  /*** [GUEST] 도착 알림 보내기 ***/
  @ApiOperation(value = "<Button>[도착알림]", notes = "- 방문자가 [도착알림] 버튼을 눌렀을 때의 기능입니다.(figma에서 없어졌네요?!) \n- 방문자가 도착했을 때 해당 버튼을 누르면 접견자에게 도착알림이 전송됩니다.\n- 방문날짜/시각 1시간 전후로만 버튼이 눌립니다.<b>(구현예정)</b>\n- DB의 해당 약속이 isArrival = 1으로 저장됩니다.")
  @PostMapping("/sendArrived")
  public int sendArrived(long appointmentID) {
    return appointmentService_guest.sendArrived(appointmentID);
  }
}
