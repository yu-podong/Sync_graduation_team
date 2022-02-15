package com.vms.app.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

  // User - Company (N:1) [Onwer]
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "company")
  private Company company;

  // User - Appointment (1:N)
  @OneToMany(mappedBy = "host", fetch = FetchType.LAZY)
  private List<Appointment> appointments = new ArrayList<Appointment>();

  @OneToMany(mappedBy = "guest", fetch = FetchType.LAZY) // 양방향 관계를 맞추기 위해 (사용 X)
  private List<Appointment> _appointments = new ArrayList<Appointment>();

  // Setting은 1:1매핑이지만 @oneToOne은 지양함으로 1:N 양방향 매핑
  // User - Setting (1:N)
  // @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
  // private List<Setting> settings = new ArrayList<Setting>();

}
