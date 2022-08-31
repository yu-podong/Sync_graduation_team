package com.vms.app.dto;

import java.util.ArrayList;
import java.util.List;

import com.vms.app.entity.Place;

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

  // private String visit_place; // 방문 장소

  private String visit_purpose; // 방문 목적

  private int accompanyingPerson; // 동반인원

  private int isArrival; // 도착 여부

  private String invite_link; // 초대 링크

  private String remark; // 비고

  private int type; // 내방 종류(일반, 공사, 기타)

  private UserDto guest;

  private UserDto host;

  private PlaceDto visit_place; // 방문 장소

  private List<AppointmentPeriodOfUseDto> appointmentPeriodOfUse_list = new ArrayList<AppointmentPeriodOfUseDto>();
  private List<AppointmentRequestResultDto> appointmentRequestResult_list = new ArrayList<AppointmentRequestResultDto>();

  // private List<> isArrival; // 동행자 정보

}
