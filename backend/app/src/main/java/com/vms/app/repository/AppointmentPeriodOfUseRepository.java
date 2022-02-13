package com.vms.app.repository;

import com.vms.app.entity.AppointmentPeriodOfUse;
import com.vms.app.entity.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentPeriodOfUseRepository extends JpaRepository<AppointmentPeriodOfUse, Long> {

}
