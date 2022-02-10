package com.vms.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity(name = "appointmentPeriodOfUse")
public class AppointmentPeriodOfUse {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column()
  private int Ap_periodID;

  // appointment 매핑
  @Column(length = 100, nullable = false)
  private Appointment appointment;

  @Column
  private int isApproval; // 승인여부

  @Column(length = 100)
  private String checkIn; // 일정 시작 시간

  @Column(length = 100)
  private String checkOut; // 일정 끝 시간

}
