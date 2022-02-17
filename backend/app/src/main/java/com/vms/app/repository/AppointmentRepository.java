package com.vms.app.repository;

import java.util.List;
import java.util.Optional;

import com.vms.app.entity.Appointment;
import com.vms.app.entity.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {

  public List<Appointment> findByGuestOrderByAppointmentIDDesc(User user);

  public List<Appointment> findByHostOrderByAppointmentIDDesc(User user);

  // 호스트의 승인된 것만
  // @Query("select a from appointment a where a.host = ?1 and a.is")
  // public List<Appointment> findByHostIsApprovalTrue();

  // 게스트의 승인된 것만
  // public List<Appointment> findByGuestIsApprovalTrue();

  // // 임시 코드
  // public List<Appointment> findByUserIsApprovalTrue();

}
