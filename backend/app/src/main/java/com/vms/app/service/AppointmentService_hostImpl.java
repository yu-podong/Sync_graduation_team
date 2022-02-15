package com.vms.app.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.vms.app.entity.Appointment;
import com.vms.app.repository.AppointmentRepository;
import com.vms.app.repository.UserRepository;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class AppointmentService_hostImpl implements AppointmentService_host {

  @Autowired
  AppointmentRepository appointmentRepository;

  @Autowired
  UserRepository userRepository;

  @Autowired
  SimpleDateFormat time;

  @Autowired
  ModelMapper modelMapper;

  @Override
  public Map<String, Object> getRequestedAppointment(String ID) {
    // List<Appointment> list = appointmentRepository.findByUserGuest("ksygt728");

    // list.forEach(c -> {
    // log.info(c.getAppointmentID());
    // });
    return null;
  }

  // Not Use
  @Override
  public Map<String, Object> getMyAppointment(String ID) {
    // TODO Auto-generated method stub
    return null;
  }

}
