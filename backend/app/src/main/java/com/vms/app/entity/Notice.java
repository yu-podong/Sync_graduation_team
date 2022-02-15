package com.vms.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
@Entity(name = "notice")
public class Notice {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column()
  private long noticeID;

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
