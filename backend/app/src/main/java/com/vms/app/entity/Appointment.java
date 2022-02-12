package com.vms.app.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
  private long appointmentID;

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

  // --------- [Relation Mapping] -------------------------------------

  // Appointment - User (N:1) [Onwer]
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "user_host")
  private User host; // 접견자

  // Appointment - User (N:1) [Onwer]
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "user_guest")
  private User guest;

  // Appointment - AppointmentPeriodOfUse (1:N)
  @OneToMany(mappedBy = "appointment")
  private List<AppointmentPeriodOfUse> appointmentPeriodOfUse_list = new ArrayList<AppointmentPeriodOfUse>();

  // Appointment - AppointmentRequestResult (1:N)
  @OneToMany(mappedBy = "appointment")
  private List<AppointmentRequestResult> appointmentRequestResult_list = new ArrayList<AppointmentRequestResult>();

  // ------------------------------------------------------------------

  /**************************************************
   **************** <필요 시 추가 항목>*****************
   ***************************************************
   * 
   * Appointment - Company (N:1) [Onwer]
   * 
   * @ManyToOne(fetch = FetchType.LAZY)
   * @JoinColumn(name = "company")
   *                  private Company host_company; // 접견자 소속
   * 
   *                  Appointment - Company (N:1) [Onwer]
   * @ManyToOne(fetch = FetchType.LAZY)
   * @JoinColumn(name = "company")
   *                  private Company guest_company;
   * 
   ***************************************************/
}