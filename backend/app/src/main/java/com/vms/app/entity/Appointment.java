package com.vms.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "appointment")
public class Appointment {

  @Id()
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(length = 45, name = "appointmentID")
  private int appointmentID;

  // *************** 관계 매핑 부분 ***************
  // ***************************************************
  @Column(length = 100, nullable = false)
  private String host;

  @Column(length = 45)
  private String host_company;

  @Column(length = 45, nullable = false)
  private String guest;

  @Column(length = 45)
  private String guest_company;

  // ***************************************************
  // ***************************************************

  @Column(length = 100)
  private String date; // 방문 날짜

  @Column(length = 20)
  private String visit_place; // 방문 장소

  @Column(length = 100)
  private String visit_purpose; // 방문 목적

  @Column
  private int accompanyingPerson; // 동반인원

  @Column
  private int isArrival; // 도착 여부

  @Column(length = 1048)
  private String invite_link; // 초대 링크

  @Column(length = 100)
  private String remark; // 비고

  // @OneToMany
  // List<T> appointmentRequestResultList = new .....

}
