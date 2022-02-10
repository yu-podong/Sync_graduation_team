package com.vms.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.ColumnTransformer;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity(name = "setting")
public class Setting {

  // @Id
  // @Column
  // private User user;

  @ColumnTransformer
  private int is_Visit_request; // 방문요청 알림

  @Column
  private int company_name; // 이메일 수신 여부

  @Column
  private int department; // push 알림 동의 여부

}
