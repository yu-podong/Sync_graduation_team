package com.vms.app.service;

import java.util.Map;

public interface AppointmentService_host {

  /*** [Host] 요청된 약속 관리 ***/
  public Map<String, Object> getRequestedAppointment(String ID);

  /*** [Host] 내 약속 보기 ***/
  public Map<String, Object> getMyAppointment(String ID);
}