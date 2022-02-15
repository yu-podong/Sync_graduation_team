package com.vms.app.service;

import java.text.SimpleDateFormat;
import java.util.Map;

import com.vms.app.entity.User;
import com.vms.app.repository.AppointmentRepository;
import com.vms.app.repository.UserRepository;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class AppointmentService_guestImpl implements AppointmentService_guest {

  @Autowired
  AppointmentRepository appointmentRepository;

  @Autowired
  UserRepository userRepository;

  @Autowired
  SimpleDateFormat time;

  @Autowired
  ModelMapper modelMapper;

  @Override
  public Map<String, Object> getMyAppointment(String ID) {
    /* 1. userRepository로 권한 얻어오기 */
    User user = userRepository.findById(ID).get();
    log.info("user의 정보 : " + user.getID());

    /* 2. 권한에 따라 다른 메소드 호출 (나중에 구현할 것) */
    // if (user.getRole().equals("host")) {

    // } else if (user.getRole().equals("guest")) {

    // } else { // 게스트도 호스트도 아닐 시

    // }

    return null;
  }

  @Override
  public Map<String, Object> getMyHistory(String ID) {
    return null;
  }

  @Override
  public Map<String, Object> sendArrived(String ID) {
    return null;
  }

}
