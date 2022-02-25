package com.vms.app.dto;

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
public class AppointmentRequestResultDto {

  private long Ap_reqResultID;

  private int isApproval; // 승인여부

  private String approvalTime; // 승인시간

  private String rejectReason; // 거절 사유

  // private AppointmentDto appointment;
}
