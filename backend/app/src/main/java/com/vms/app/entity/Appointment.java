package com.vms.app.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedAttributeNode;
import javax.persistence.NamedEntityGraph;
import javax.persistence.NamedEntityGraphs;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@NamedEntityGraph(name = "Appointment.all", attributeNodes = {
    @NamedAttributeNode("host"),
    @NamedAttributeNode("guest"),
})
@Entity(name = "appointment")
public class Appointment {

  @Id()
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(length = 45, name = "appointmentID")
  private long appointmentID;

  @Column(length = 100)
  private String date; // 방문 날짜

  // @Column(length = 20)
  // private String visit_place; // 방문 장소

  @Column(length = 100)
  private String visit_purpose; // 방문 목적 or 작업 목적

  @Column
  private int accompanyingPerson; // 동반인원

  @Column
  private int isArrival; // 도착 여부

  @Column(length = 1048)
  private String invite_link; // 초대 링크

  @Column(length = 100)
  private String remark; // 비고

  @Column
  private int type; // 내방 종류(일반, 공사, 기타)

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
  @OneToMany(mappedBy = "appointment", fetch = FetchType.LAZY)
  private List<AppointmentPeriodOfUse> appointmentPeriodOfUse_list = new ArrayList<AppointmentPeriodOfUse>();

  // Appointment - AppointmentRequestResult (1:N)
  @OneToMany(mappedBy = "appointment", fetch = FetchType.LAZY)
  private List<AppointmentRequestResult> appointmentRequestResult_list = new ArrayList<AppointmentRequestResult>();

  // Appointment - AccompanyPerson (1:N)
  @OneToMany(mappedBy = "appointment", fetch = FetchType.LAZY)
  private List<AccompanyPerson> accompanyPerson_list = new ArrayList<AccompanyPerson>();

  // Appointment - Place (N:1)
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "visit_place")
  private Place visit_place; // 방문 장소

  // @Column
  // private List<> isArrival; // 동행자 정보
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
