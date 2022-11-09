package com.vms.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.vms.app.entity.AppointmentPeriodOfUse;
import com.vms.app.entity.Place;

@Repository
public interface AppointmentPeriodOfUseRepository extends JpaRepository<AppointmentPeriodOfUse, Long> {

  // 장소에 따른 중복확인
  // @Query("select * from appointmentPeriodOfUse ap inner join (select
  // MAX(ap.Ap_periodID) as id from appointmentPeriodOfUse ap inner join
  // appointment a on a.appointmentID = ap.appointment where a.visit_place = 221
  // group by ap.appointment) newT on newT.id = ap.Ap_periodID where (checkIn
  // between "2022-10-28 00:00:00" and "2022-10-28 14:00:00") or (checkOut between
  // "2022-10-28 00:00:00" and "2022-10-28 13:10:00");
  // ")

  // @Query("SELECT ap FROM appointmentPeriodOfUse ap INNER JOIN (SELECT MAX(ap)
  // AS id FROM appointmentPeriodOfUse ap INNER JOIN appointment a ON
  // a.appointmentID = ap.appointment WHERE a.visit_place = ?1 GROUP BY
  // ap.appointment) newT ON newT.id = ap.Ap_periodID WHERE (ap.checkIn BETWEEN ?2
  // and ?3) OR (ap.checkOut BETWEEN ?2 AND ?3)")
  // public List<AppointmentPeriodOfUse> duplicateAppointment2(long visit_place,
  // String nowCheckIn, String nowCheckOut);

  @Query(nativeQuery = true, value = "select ap.* from appointmentPeriodOfUse ap inner join (select MAX(ap.Ap_periodID) as id from appointmentPeriodOfUse ap inner join appointment a on a.appointmentID = ap.appointment where a.visit_place = ?1 group by ap.appointment) newT on newT.id = ap.Ap_periodID where (checkIn between ?2 and ?3) or (checkOut between ?2 and ?3)")
  public List<AppointmentPeriodOfUse> duplicateCheckPlace(long visit_place, String nowCheckIn, String nowCheckOut);

  @Query(nativeQuery = true, value = "select ap.* from appointmentPeriodOfUse ap inner join (select MAX(ap.Ap_periodID) as id from appointmentPeriodOfUse ap inner join appointment a on a.appointmentID = ap.appointment where a.user_host = ?1 group by ap.appointment) newT on newT.id = ap.Ap_periodID where (checkIn between ?2 and ?3) or (checkOut between ?2 and ?3)")
  public List<AppointmentPeriodOfUse> duplicateCheckHost(String ID, String nowCheckIn, String nowCheckOut);

  @Query(nativeQuery = true, value = "select ap.* from appointmentPeriodOfUse ap inner join (select MAX(ap.Ap_periodID) as id from appointmentPeriodOfUse ap inner join appointment a on a.appointmentID = ap.appointment where a.user_guest = ?1 group by ap.appointment) newT on newT.id = ap.Ap_periodID where (checkIn between ?2 and ?3) or (checkOut between ?2 and ?3)")
  public List<AppointmentPeriodOfUse> duplicateCheckGuest(String ID, String nowCheckIn, String nowCheckOut);

}
