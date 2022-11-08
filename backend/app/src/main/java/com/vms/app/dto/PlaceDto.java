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
public class PlaceDto {
  private long placeID;

  private String roomNum; // 호수

  private String name; // 이름

  private int floor; // 층수

  private int isUse; // 사용가능 여부

}
