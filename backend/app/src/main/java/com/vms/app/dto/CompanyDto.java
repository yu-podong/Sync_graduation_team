package com.vms.app.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CompanyDto {
  private long companyID; // 고유 pin 번호

  private String company_name;

  private String department;

  private String position;

  // @OneToMany는 표기X;
}
