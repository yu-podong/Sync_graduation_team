package com.vms.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vms.app.entity.AccompanyPerson;
import com.vms.app.entity.Appointment;
import com.vms.app.entity.User;

@Repository
public interface AccompanyPersonRepository extends JpaRepository<AccompanyPerson, Long> {

  public List<AccompanyPerson> findByGuestOrderByAccompanyPersonIDDesc(User user);

  public List<AccompanyPerson> findByGuestAndAppointment(User user, Appointment appointment);

}
