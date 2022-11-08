package com.vms.app.service;

import java.util.Map;

import com.vms.app.entity.Appointment;

public interface AppointmentService_guest {

  /***
   * [Guest] 내 약속 보기
   * 
   * @param tempRole
   ***/
  public Map<String, Object> getMyAppointment(String ID, String tempRole);

  /*** [Guest] 신청내역 확인하기 ***/
  public Map<String, Object> getMyHistory(String ID);

  /*** [GUEST] 도착 알림 보내기 ***/
  public int sendArrived(long appointmentID);

  public Map<String, Object> getMyAppointment(String ID);

  public Map<String, Object> getApprovalResult(String name);

  public Map<String, Object> getTodayList(String iD);

  public int createAppointment(String ID, String hostID, int placeID, Appointment appointment, String checkIn,
      String checkOut);

  public int agreeAccompany(String ID, long appointmentID);
}
