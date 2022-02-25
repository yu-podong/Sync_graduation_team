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
public class AppointmentPeriodOfUseDto {

  private long Ap_periodID;

  private String checkIn; // 일정 시작 시간

  private String checkOut; // 일정 끝 시간

  // private AppointmentDto appointment;
}
