package com.vms.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

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
@Entity(name = "user")
public class User {

  @Id
  @Column(length = 45)
  private String ID;

  @Column(length = 100, nullable = false)
  private String password;

  @Column(length = 45, nullable = false)
  private String name;

  @Column(length = 45, nullable = false, unique = true)
  private String identityNum; // 주민번호

  @Column(length = 15, nullable = false)
  private String phoneNum;

  @Column(length = 20)
  private String email_front;

  @Column(length = 20)
  private String email_back;

  @Column(length = 20)
  private String role;

  @Column
  private int isCheckLogin; // 로그인 승인 여부

  /*
   *
   * test 중에는 매핑을 하지 않음
   * 관계 매핑시 밑에 두개 바꿀 것
   *
   */

  @Column
  private String company;

  // 회사(관계 매핑 시 구현할 것)
  // @Column
  // private Company company;

}
