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
@Entity(name = "appointmentRequestResult")
public class AppointmentRequestResult {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column()
  private int Ap_reqResultID;

  // appointment 매핑
  @Column(length = 100, nullable = false)
  private Appointment appointment;

  @Column
  private int isApproval; // 승인여부

  @Column(length = 100)
  private String approvalTime; // 승인시간

  @Column(length = 100)
  private String rejectReason; // 거절 사유

}
