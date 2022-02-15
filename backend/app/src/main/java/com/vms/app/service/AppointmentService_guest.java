package com.vms.app.service;

import java.util.Map;

public interface AppointmentService_guest {

  /*** [Guest] 내 약속 보기 ***/
  public Map<String, Object> getMyAppointment(String ID);

  /*** [Guest] 신청내역 확인하기 ***/
  public Map<String, Object> getMyHistory(String ID);

  /*** [GUEST] 도착 알림 보내기 ***/
  public Map<String, Object> sendArrived(String ID);
}
