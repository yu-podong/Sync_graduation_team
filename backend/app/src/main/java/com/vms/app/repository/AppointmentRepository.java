package com.vms.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.EntityGraph.EntityGraphType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.vms.app.entity.Appointment;
import com.vms.app.entity.Place;
import com.vms.app.entity.User;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {

  // 동반인원 제외하고 약속 가져오기
  @EntityGraph(value = "Appointment.all", type = EntityGraphType.LOAD)
  public List<Appointment> findByGuestOrderByAppointmentIDDesc(User user);

  // 동반인원같이 약속 가져오기
  @Query(nativeQuery = true, value = "SELECT a.* FROM appointment a INNER JOIN accompanyPerson ap on a.appointmentID = ap.appointment WHERE ap.guest = ?1 UNION (SELECT a.* FROM appointment a WHERE a.user_guest = ?1) ORDER BY date DESC")
  public List<Appointment> findByGuestOrderByAppointmentIDDesc_withAccompanyPerson(User user);

  @EntityGraph(value = "Appointment.all", type = EntityGraphType.LOAD)
  public List<Appointment> findByHostOrderByAppointmentIDDesc(User user);

  @EntityGraph(value = "Appointment.all", type = EntityGraphType.LOAD)
  @Query("SELECT a FROM appointment a WHERE DATE(a.date) = DATE(NOW()) and a.host = ?1")
  public List<Appointment> getTodayList_host(User user);

  @EntityGraph(value = "Appointment.all", type = EntityGraphType.LOAD)
  @Query("SELECT a FROM appointment a WHERE DATE(a.date) = DATE(NOW()) and a.guest = ?1")
  public List<Appointment> getTodayList_guest(User user);

  // 동반인원 포함
  @Query(nativeQuery = true, value = "SELECT a.* FROM appointment a INNER JOIN accompanyPerson ap on a.appointmentID = ap.appointment WHERE ap.guest = ?1 AND DATE(a.date) = DATE(NOW()) UNION (SELECT a.* FROM appointment a WHERE a.user_guest = ?1 AND DATE(a.date) = DATE(NOW()))")
  public List<Appointment> getTodayList_guest_withAccompanyPerson(User user);

  // select * from appointmentPeriodOfUse ap inner join (select
  // MAX(ap.Ap_periodID) as id from appointmentPeriodOfUse ap inner join
  // appointment a on a.appointmentID = ap.appointment where a.visit_place = 221
  // group by ap.appointment) newT on newT.id = ap.Ap_periodID where (checkIn
  // between "2022-10-28 00:00:00" and "2022-10-28 14:00:00") or (checkOut between
  // "2022-10-28 00:00:00" and "2022-10-28 13:10:00");

  // 호스트의 승인된 것만
  // @Query("select a from appointment a where a.host = ?1 and a.is")
  // public List<Appointment> findByHostIsApprovalTrue();

  // 게스트의 승인된 것만
  // public List<Appointment> findByGuestIsApprovalTrue();

  // // 임시 코드
  // public List<Appointment> findByUserIsApprovalTrue();

}
