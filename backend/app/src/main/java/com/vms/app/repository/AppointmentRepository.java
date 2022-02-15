package com.vms.app.repository;

import java.util.List;

import com.vms.app.entity.Appointment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {

  public List<Appointment> findByDate(String string);

  // public List<Appointment> findByUserGuest(String string);
}
