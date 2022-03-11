package com.vms.app.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {

  private String ID;

  // private String password;

  private String name;

  // private String identityNum; // 주민번호

  private String phoneNum;

  private String email_front;

  private String email_back;

  // private String role;

  // private int isCheckLogin; // 로그인 승인 여부

  private String refreshToken;

  private CompanyDto company;

  // @OneToMany는 표기X;
}
