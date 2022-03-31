package com.vms.app.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.vms.app.dto.AppointmentDto;
import com.vms.app.entity.Appointment;
import com.vms.app.entity.AppointmentRequestResult;
import com.vms.app.entity.User;
import com.vms.app.repository.AppointmentRepository;
import com.vms.app.repository.AppointmentRequestResultRepository;
import com.vms.app.repository.UserRepository;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class AppointmentService_hostImpl implements AppointmentService_host {

  @Autowired
  AppointmentRepository appointmentRepository;

  @Autowired
  AppointmentRequestResultRepository appointmentRequestResultRepository;

  @Autowired
  UserRepository userRepository;

  @Autowired
  SimpleDateFormat time;

  @Autowired
  ModelMapper modelMapper;

  @Transactional
  @Override
  public Map<String, Object> getRequestedAppointment(String ID) {

    Map<String, Object> results = new LinkedHashMap<>();

    List<Appointment> list = appointmentRepository.findByHostOrderByAppointmentIDDesc(User.builder().ID(ID).build());

    List<AppointmentDto> appointment_userDtoList = new ArrayList<>();
    list.forEach(item -> appointment_userDtoList.add(modelMapper.map(item, AppointmentDto.class)));
    results.put("results", appointment_userDtoList);
    return results;
  }

  // Not Use
  @Override
  public Map<String, Object> getMyAppointment(String ID) {
    return null;
  }

  @Transactional
  @Override
  public int approvalAppointment(long appointmentID) {
    Appointment appointment = new Appointment();
    appointment.setAppointmentID(appointmentID);

    AppointmentRequestResult appointmentRequestResult = new AppointmentRequestResult();
    appointmentRequestResult.setApprovalTime(time.format(new Date(System.currentTimeMillis())));
    appointmentRequestResult.setIsApproval(1);
    appointmentRequestResult.setAppointment(appointment);
    appointmentRequestResultRepository.save(appointmentRequestResult);

    return 1;
  }

  @Transactional
  @Override
  public int rejectAppointment(long appointmentID, String rejectReason) {
    Appointment appointment = new Appointment();
    appointment.setAppointmentID(appointmentID);

    AppointmentRequestResult appointmentRequestResult = new AppointmentRequestResult();
    appointmentRequestResult.setApprovalTime(time.format(new Date(System.currentTimeMillis())));
    appointmentRequestResult.setIsApproval(-1);
    appointmentRequestResult.setRejectReason(rejectReason);
    appointmentRequestResult.setAppointment(appointment);
    appointmentRequestResultRepository.save(appointmentRequestResult);

    return 1;

  }

}
