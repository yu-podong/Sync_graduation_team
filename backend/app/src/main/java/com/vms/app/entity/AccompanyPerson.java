package com.vms.app.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedAttributeNode;
import javax.persistence.NamedEntityGraph;
import javax.persistence.NamedEntityGraphs;
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
@Entity(name = "accompanyPerson") // 엔티티 그래프 추가할 것
public class AccompanyPerson {

  @Id()
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(length = 45, name = "accompanyPersonID")
  private long accompanyPersonID;

  // --------- [Relation Mapping] -------------------------------------

  // AccompanyPerson - Appointment (N:1) [Onwer]
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "appointment")
  private Appointment appointment; // 접견자

  // AccompanyPerson - User (N:1) [Onwer]
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "guest")
  private User guest;

}
