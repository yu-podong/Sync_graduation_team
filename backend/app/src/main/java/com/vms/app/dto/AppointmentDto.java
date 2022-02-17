package com.vms.app.dto;

import java.util.ArrayList;
import java.util.List;

import com.vms.app.entity.AppointmentPeriodOfUse;
import com.vms.app.entity.AppointmentRequestResult;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AppointmentDto {
  private long appointmentID;

  private String date; // 방문 날짜

  private String visit_place; // 방문 장소

  private String visit_purpose; // 방문 목적

  private int accompanyingPerson; // 동반인원

  private int isArrival; // 도착 여부

  private String invite_link; // 초대 링크

  private String remark; // 비고

  private UserDto guest;

  private UserDto host;

  private List<AppointmentPeriodOfUseDto> appointmentPeriodOfUse_list = new ArrayList<AppointmentPeriodOfUseDto>();
  private List<AppointmentRequestResultDto> appointmentRequestResult_list = new ArrayList<AppointmentRequestResultDto>();

}
