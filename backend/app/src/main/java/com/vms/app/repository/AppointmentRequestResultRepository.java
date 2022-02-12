package com.vms.app.repository;

import com.vms.app.entity.AppointmentRequestResult;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentRequestResultRepository extends JpaRepository<AppointmentRequestResult, Long> {

}
