package com.vms.app.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Entity(name = "place")
public class Place {

  @Id()
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(length = 45, name = "placeID")
  private long placeID;

  @Column(length = 100)
  private String roomNum; // 호수

  @Column(length = 100)
  private String name; // 이름

  @Column(length = 100)
  private int floor; // 층수

  @Column
  private int isUse; // 사용가능 여부

  // Place - Appointment (1:N)
  @OneToMany(mappedBy = "visit_place", fetch = FetchType.LAZY)
  private List<Appointment> appointmentList = new ArrayList<Appointment>();

}
