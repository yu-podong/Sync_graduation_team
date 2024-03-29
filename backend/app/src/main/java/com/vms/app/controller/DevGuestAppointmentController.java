package com.vms.app.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
  @ApiOperation(value = "<List>[메인 Today]", notes = "- 방문자의 [Today] 부분.\n" +
      "- 오늘의 해당하는 약속만 가져옵니다.\n")
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
  public Map<String, Object> getMyHistory(String ID, HttpServletResponse res) {
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

  /*** [GUEST] 약속 생성 ***/
  @ApiOperation(value = "<Button>[약속 생성]", notes = "- 방문자가 [+] 버튼을 눌렀을 때의 기능입니다. \n- 약속을 생성하기 위한 기능입니다. \n")
  @PostMapping("/createAppointment")
  public int createAppointment(String ID, String hostID, int placeID, Appointment appointment, String checkIn,
      String checkOut, int check_accompany) {

    /*
     * <받아야 하는 항목>
     * - type(일반, 공사)
     * - visit_purpose (방문 목적)
     * - user (접견자, 방문자 정보 )
     * - 날짜 및 입, 퇴실 시간 (date, appointmentPeriodOfData)
     * - 방문 장소 (Place)
     * 
     * - 동행자 정보
     * 
     */

    return appointmentService_guest.createAppointment(ID, hostID, placeID, appointment, checkIn,
        checkOut);
  }

  /*** [GUEST] 동행여부 동의하기 ***/
  @ApiOperation(value = "동행인 여부 링크 클릭", notes = "- api요청시 데이터베이스에 해당 약속의 동행인으로 추가 됩니다.")
  @PostMapping("/agreeAccompany")
  public int agreeAccompany(String ID, long appointmentID) {
    return appointmentService_guest.agreeAccompany(ID, appointmentID);
  }

  // test용 직접 호출 X
  @GetMapping("/duplicateAppointment")
  public int duplicateAppointment(Place place, String checkIn, String checkOut) {

    return appointmentService_guest.duplicateCheckPlace(place, checkIn, checkOut);
  }
}
