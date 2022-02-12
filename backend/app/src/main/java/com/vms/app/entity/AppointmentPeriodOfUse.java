package com.vms.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
@Entity(name = "appointmentPeriodOfUse")
public class AppointmentPeriodOfUse {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column()
  private int Ap_periodID;

  @Column
  private int isApproval; // 승인여부

  @Column(length = 100)
  private String checkIn; // 일정 시작 시간

  @Column(length = 100)
  private String checkOut; // 일정 끝 시간

  // AppointmentPeriodOfUse - Appointment (N:1) [Onwer]
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "appointment")
  private Appointment appointment;
}
