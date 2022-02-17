package com.vms.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedAttributeNode;
import javax.persistence.NamedEntityGraph;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

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
@DynamicInsert
@DynamicUpdate
@Builder
@NamedEntityGraph(name = "Setting.All", attributeNodes = {
    @NamedAttributeNode("user")
})
@Entity(name = "setting")
public class Setting {

  // JPA에서 PK FK 동시 설정이 안되기 때문에 임의 PK값 추가
  @Id
  @Column(length = 45)
  private String userID;

  @Column
  @ColumnDefault("1")
  private int is_visit_request; // 방문요청 알림

  @Column
  @ColumnDefault("1")
  private int is_check_email; // 이메일 수신 여부

  @Column
  @ColumnDefault("1")
  private int is_push; // push 알림 동의 여부

  // Setting은 1:1매핑이지만 @oneToOne은 지양함으로 1:N 양방향 매핑
  // Setting - User (N:1) [Onwer]
  @JoinColumn(name = "user")
  @ManyToOne(fetch = FetchType.LAZY)
  private User user;
}
