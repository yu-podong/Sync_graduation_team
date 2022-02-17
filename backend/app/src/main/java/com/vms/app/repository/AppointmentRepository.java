package com.vms.app.repository;

import java.util.List;

import com.vms.app.entity.Appointment;
import com.vms.app.entity.User;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.EntityGraph.EntityGraphType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {

  @EntityGraph(value = "Appointment.all", type = EntityGraphType.LOAD)
  public List<Appointment> findByGuestOrderByAppointmentIDDesc(User user);

  @EntityGraph(value = "Appointment.all", type = EntityGraphType.LOAD)
  public List<Appointment> findByHostOrderByAppointmentIDDesc(User user);

  // 호스트의 승인된 것만
  // @Query("select a from appointment a where a.host = ?1 and a.is")
  // public List<Appointment> findByHostIsApprovalTrue();

  // 게스트의 승인된 것만
  // public List<Appointment> findByGuestIsApprovalTrue();

  // // 임시 코드
  // public List<Appointment> findByUserIsApprovalTrue();

}
