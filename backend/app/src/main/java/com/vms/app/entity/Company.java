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

import org.hibernate.annotations.Generated;

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
@Entity(name = "company")
public class Company {

  @Id
  @Column()
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long companyID; // 고유 pin 번호

  @Column(length = 45, nullable = false)
  private String company_name;

  @Column(length = 45, nullable = false)
  private String department;

  // Company - User (1:N)
  @OneToMany(mappedBy = "company", fetch = FetchType.LAZY)
  private List<User> users = new ArrayList<User>();

}
