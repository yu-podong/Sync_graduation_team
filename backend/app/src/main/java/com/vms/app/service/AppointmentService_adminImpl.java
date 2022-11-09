package com.vms.app.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vms.app.dto.AppointmentDto;
import com.vms.app.entity.Appointment;
import com.vms.app.repository.AccompanyPersonRepository;
import com.vms.app.repository.AppointmentPeriodOfUseRepository;
import com.vms.app.repository.AppointmentRepository;
import com.vms.app.repository.PlaceRepository;
import com.vms.app.repository.UserRepository;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class AppointmentService_adminImpl implements AppointmentService_admin {

  @Autowired
  AppointmentRepository appointmentRepository;

  @Autowired
  UserRepository userRepository;

  @Autowired
  AppointmentPeriodOfUseRepository appointmentPeriodOfUseRepository;

  @Autowired
  PlaceRepository placeRepository;

  @Autowired
  AccompanyPersonRepository accompanyPersonRepository;

  @Autowired
  SimpleDateFormat time;

  @Autowired
  ModelMapper modelMapper;

  @Transactional
  @Override
  public Map<String, Object> getAllAppointment() {

    Map<String, Object> results = new LinkedHashMap<>();

    List<Appointment> list = appointmentRepository.findAllByOrderByAppointmentIDDesc();
    List<AppointmentDto> listDto = new ArrayList<>();
    list.forEach(item -> {
      listDto.add(modelMapper.map(item, AppointmentDto.class));
    });
    results.put("results", listDto);

    // log.warn("list.size : " + list.size());

    return results;
  }

}
