package com.vms.app.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.vms.app.dto.AppointmentDto;
import com.vms.app.dto.AppointmentDto_main;
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

    list.forEach(item -> {
      if (!item.getAppointmentRequestResult_list().isEmpty()) {

        int arrListSize = item.getAppointmentRequestResult_list().size();

        // size 문제 생길 수도 있음 Integer -> Long
        int check_isApproval = item.getAppointmentRequestResult_list().get(arrListSize - 1).getIsApproval();
        if (check_isApproval == 0) // 대기중
          appointment_userDtoList.add(modelMapper.map(item, AppointmentDto.class));
      }
    });

    list.forEach(item -> appointment_userDtoList.add(modelMapper.map(item, AppointmentDto.class)));
    results.put("results", appointment_userDtoList);
    return results;
  }

  @Transactional
  @Override
  public Map<String, Object> getMyAppointment(String ID) {

    Map<String, Object> results = new LinkedHashMap<>();

    User user = userRepository.findById(ID).get();
    List<Appointment> my_appointmentList = user.getAppointments();
    List<AppointmentDto> appointmentDtoList = new ArrayList<>();

    my_appointmentList.forEach(item -> {
      if (!item.getAppointmentRequestResult_list().isEmpty()) {

        int arrListSize = item.getAppointmentRequestResult_list().size();

        // size 문제 생길 수도 있음 Integer -> Long
        int check_isApproval = item.getAppointmentRequestResult_list().get(arrListSize - 1).getIsApproval();
        if (check_isApproval == 1) { // 승인확인
          // 현재 시간 > checkoutTime(이미 끝난 약속)
          int lstIdx = item.getAppointmentPeriodOfUse_list().size();
          String checkoutTime = item.getAppointmentPeriodOfUse_list().get(lstIdx - 1).getCheckOut();
          String currentTime = time.format(new Date(System.currentTimeMillis()));
          if (currentTime.compareTo(checkoutTime) == 1)
            appointmentDtoList.add(modelMapper.map(item, AppointmentDto.class));
        }
      }
    });

    results.put("myAppointmentList", appointmentDtoList);

    return results;
  }

  @Transactional
  @Override
  public int approvalAppointment(long appointmentID) {
    Appointment appointment = Appointment.builder()
        .appointmentID(appointmentID)
        .build();

    AppointmentRequestResult appointmentRequestResult = AppointmentRequestResult.builder()
        .approvalTime(time.format(new Date(System.currentTimeMillis())))
        .isApproval(1)
        .appointment(appointment)
        .build();

    appointmentRequestResultRepository.save(appointmentRequestResult);

    return 1;
  }

  @Transactional
  @Override
  public int rejectAppointment(long appointmentID, String rejectReason) {
    Appointment appointment = Appointment.builder()
        .appointmentID(appointmentID)
        .build();

    AppointmentRequestResult appointmentRequestResult = AppointmentRequestResult.builder()
        .approvalTime(time.format(new Date(System.currentTimeMillis())))
        .isApproval(-1)
        .rejectReason(rejectReason)
        .appointment(appointment)
        .build();
    appointmentRequestResultRepository.save(appointmentRequestResult);

    return 1;

  }

  @Transactional
  @Override
  public Map<String, Object> getApprovalResult(String ID) {

    Map<String, Object> results = new LinkedHashMap<>();

    User user = userRepository.findById(ID).get();
    List<Appointment> my_appointmentList = user.getAppointments();
    List<AppointmentDto> appointmentDtoList = new ArrayList<>();

    my_appointmentList.forEach(item -> {
      if (!item.getAppointmentRequestResult_list().isEmpty()) {

        int arrListSize = item.getAppointmentRequestResult_list().size();

        // size 문제 생길 수도 있음 Integer -> Long
        int check_isApproval = item.getAppointmentRequestResult_list().get(arrListSize - 1).getIsApproval();
        if (check_isApproval == 1) // 승인확인
          appointmentDtoList.add(modelMapper.map(item, AppointmentDto.class));
      }
    });

    results.put("myAppointmentList", appointmentDtoList);

    return results;
  }

  @Transactional
  @Override
  public Map<String, Object> getTodayList(String iD) {
    Map<String, Object> results = new LinkedHashMap<>();

    User user = User.builder().ID(iD).build();
    List<Appointment> appointmentList = appointmentRepository.getTodayList_host(user);

    // List<AppointmentDto> appointmentDtoList = new ArrayList<>();
    List<AppointmentDto_main> appointmentDtoList = new ArrayList<>();

    appointmentList.forEach(item -> {
      // appointmentDtoList.add(modelMapper.map(item, AppointmentDto.class));
      appointmentDtoList.add(modelMapper.map(item, AppointmentDto_main.class));

    });

    results.put("myAppointmentList", appointmentDtoList);

    return results;
  }

}
