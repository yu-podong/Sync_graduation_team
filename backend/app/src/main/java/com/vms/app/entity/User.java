package com.vms.app.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedAttributeNode;
import javax.persistence.NamedEntityGraph;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@JsonIgnoreProperties(ignoreUnknown = true) // JwtAuthenticationFilter.java 에서 jackson ObejctMapper null값이 들어가는것을 무시
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@NamedEntityGraph(name = "User.All", attributeNodes = {
    @NamedAttributeNode("company")
})
@Entity(name = "user")
public class User {

  @Id
  @Column(length = 45)
  @JsonProperty("ID") // JwtAuthenticationFilter.java 에서 jackson ObejctMapper 대문자가 소문자로 출력되는 오류
  private String ID; // 사원번호

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

  @Column(length = 20)
  private int userType; // 1. 접견자, 2.방문자(직장인), 3.방문자(학생), 4.관리자

  @Column
  private int isCheckLogin; // 로그인 승인 여부

  @Column(length = 2048)
  private String refreshToken;

  // User - Company (N:1) [Onwer]
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "company")
  private Company company;

  // User - Appointment (1:N)
  @OneToMany(mappedBy = "host", fetch = FetchType.LAZY)
  private List<Appointment> appointments = new ArrayList<Appointment>();

  @OneToMany(mappedBy = "guest", fetch = FetchType.LAZY)
  private List<Appointment> _appointments = new ArrayList<Appointment>();

  @OneToMany(mappedBy = "guest", fetch = FetchType.LAZY)
  private List<AccompanyPerson> accompanyingPerson_list = new ArrayList<AccompanyPerson>();
  // Setting은 1:1매핑이지만 @oneToOne은 지양함으로 1:N 양방향 매핑
  // User - Setting (1:N)
  // @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
  // private List<Setting> settings = new ArrayList<Setting>();

}
