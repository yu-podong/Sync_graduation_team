package com.vms.app.service;

import java.util.Map;

public interface AppointmentService_host {

  /*** [Host] 요청된 약속 관리 ***/
  public Map<String, Object> getRequestedAppointment(String ID);

  /*** [Host] 내 약속 보기 ***/
  public Map<String, Object> getMyAppointment(String ID);

  /** [Host] 약속 승인하기 **/
  public int approvalAppointment(long appointmentID);

  /** [Host] 약속 거절하기 **/
  public int rejectAppointment(long appointmentID, String rejectReason);

  public Map<String, Object> getApprovalResult(String name);
}
