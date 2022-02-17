package com.vms.app.entity;

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
@NamedEntityGraph(name = "AppointmentRequestResult.All", attributeNodes = {
    @NamedAttributeNode("appointment")
})
@Entity(name = "appointmentRequestResult")
public class AppointmentRequestResult {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column()
  private long Ap_reqResultID;

  @Column
  private int isApproval; // 승인여부

  @Column(length = 100)
  private String approvalTime; // 승인시간

  @Column(length = 100)
  private String rejectReason; // 거절 사유

  // AppointmentRequestResult - Appointment (N:1) [Onwer]
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "appointment")
  private Appointment appointment;

}
