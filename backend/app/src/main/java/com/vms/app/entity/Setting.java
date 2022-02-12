package com.vms.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ColumnTransformer;

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
@Entity(name = "setting")
public class Setting {

  // JPA에서 PK FK 동시 설정이 안되기 때문에 임의 PK값 추가
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column
  private int settingID;

  @ColumnTransformer
  private int is_Visit_request; // 방문요청 알림

  @Column
  private int company_name; // 이메일 수신 여부

  @Column
  private int department; // push 알림 동의 여부

  // Setting은 1:1매핑이지만 @oneToOne은 지양함으로 1:N 양방향 매핑
  // Setting - User (N:1) [Onwer]
  @JoinColumn(name = "user")
  @ManyToOne(fetch = FetchType.LAZY)
  private User user;
}
