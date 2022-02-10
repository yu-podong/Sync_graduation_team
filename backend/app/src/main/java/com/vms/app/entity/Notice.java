package com.vms.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity(name = "notice")
public class Notice {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column()
  private int noticeID;

  @Column(length = 50, nullable = false)
  private String title;

  // user 매핑
  @Column(length = 100, nullable = false)
  private String writer;

  @Column(length = 100, nullable = false)
  private String write_date;

  @Column(length = 2000, nullable = false)
  private String content;

}
