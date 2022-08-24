package com.vms.app.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/* 메인페이지의 오늘 역속을 보여주기 위한 DTO (모든 정보를 가져오지 않고 약속,접견자,방문자의 정보만 가져온다) */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AppointmentDto_main {
  private long appointmentID;

  private String date; // 방문 날짜

  private String visit_place; // 방문 장소

  private String visit_purpose; // 방문 목적

  private int accompanyingPerson; // 동반인원

  private int isArrival; // 도착 여부

  private String invite_link; // 초대 링크

  private String remark; // 비고

  private int type; // 내방 종류(일반, 공사, 기타)

  private UserDto guest;

  private UserDto host;

  // private List<> isArrival; // 동행자 정보

}
