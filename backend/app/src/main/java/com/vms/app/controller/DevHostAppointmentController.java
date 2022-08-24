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
import com.vms.app.service.AppointmentService_host;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@Api("방문자의 기능을 담당하는 Controller 입니다")
@RequestMapping("/dev/host")
public class DevHostAppointmentController {

  @ModelAttribute("cp")
  public String getContextPath(HttpServletRequest request) {
    return request.getContextPath();
  }

  @Autowired
  AppointmentService_guest appointmentService_guest;

  @Autowired
  AppointmentService_host appointmentService_host;
  /* ================= THREE MENU ELEVATED BUTTON ================= */
  /* ============================================================== */
  /* ============================================================== */

  /*** [Host] 신규접수내역 ***/
  @ApiOperation(value = "<Button>[신규접수내역]", notes = "- 접견자의 [신규접수내역] 버튼을 눌렀을 때의 기능입니다.\n" +
      "- 접견자가 아직 처리하지 않은 대기중인 약속(isApproval = 0)인 값만 가져옵니다.\n")
  @GetMapping("/getRequestedAppointment")
  public Map<String, Object> getRequestedAppointment(String ID) {

    Map<String, Object> results = appointmentService_host.getRequestedAppointment(ID);
    return results;
  }

  /*** [HOST] 승인내역 ***/
  @ApiOperation(value = "<Button>[승인내역]", notes = "- 접견자의 [승인내역] 버튼을 클릭했을 때의 기능입니다.\n" +
      "- 승인된 내역만 가져옵니다(isApproval = 1)\n")
  @GetMapping("/getApprovalResult")
  public Map<String, Object> getApprovalResult(String ID) {
    Map<String, Object> results = appointmentService_host.getApprovalResult(ID);

    return results;
  }

  /*** [HOST] 방문기록조회 ***/
  @ApiOperation(value = "<Button>[방문기록조회]", notes = "- 접견자의 [방문기록조회] 버튼을 클릭했을 때의 기능입니다.\n" +
      "- 현재시간을 기준으로 checkout(방문종료시간)이 작은 값, 즉 이미 방문을 마친 약속만 보여집니다.\n")
  @GetMapping("/getMyAppointment")
  public Map<String, Object> getMyAppointment(String ID) {
    Map<String, Object> results = appointmentService_host.getMyAppointment(ID);

    return results;
  }

  /* ============================================================== */
  /* ============================================================== */
  /* ============================================================== */

  /*** [HOST] 약속 승인 ***/
  @ApiOperation(value = "<Button>[신규접수내역] > ListDetail의 [승인]버튼 클릭시", notes = "- 접견자에게 접수된 약속중 [승인] 버튼을 눌렀을 때의 기능입니다.\n"
      +
      "- DB의 isApproval값이 1(승인)로 바뀝니다.\n" +
      "- 승인 시, 접견자나 방문자의 일정이 중복되면 log를 띄우고 현재 일정을 처리하지 않습니다.<b>(구현예정)</b>")
  @PostMapping("/approvalAppointment")
  public int approvalAppointment(long appointmentID) {
    return appointmentService_host.approvalAppointment(appointmentID);
  }

  /*** [HOST] 약속 거절 ***/
  @ApiOperation(value = "<Button>[신규접수내역] > ListDetail의 [거절]버튼 클릭시", notes = "- 접견자에게 접수된 약속중 [거절] 버튼을 눌렀을 때의 기능입니다.\n"
      +
      "- DB의 isApproval값이 1(승인)로 바뀝니다.\n" +
      "- Parameters 탭의 거절 사유(rejectReason)는 Not Null = false 이기 때문에 굳이 안적어도 되도록 해놨습니다.(무조건 적게 하려면 말씀해주세요!)")
  @PostMapping("/rejectAppointment")
  public int rejectAppointment(long appointmentID, String rejectReason) {
    return appointmentService_host.rejectAppointment(appointmentID, rejectReason);
  }
}
