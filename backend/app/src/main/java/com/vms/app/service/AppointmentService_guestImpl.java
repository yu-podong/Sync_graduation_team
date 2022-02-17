package com.vms.app.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.vms.app.dto.AppointmentDto;
import com.vms.app.dto.AppointmentPeriodOfUseDto;
import com.vms.app.dto.AppointmentRequestResultDto;
import com.vms.app.entity.Appointment;
import com.vms.app.entity.AppointmentPeriodOfUse;
import com.vms.app.entity.AppointmentRequestResult;
import com.vms.app.entity.User;
import com.vms.app.repository.AppointmentRepository;
import com.vms.app.repository.UserRepository;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

  @Transactional
  @Override
  public Map<String, Object> getMyAppointment(String ID, String tempRole) {

    Map<String, Object> results = new LinkedHashMap<>();

    /* 1. userRepository로 권한 얻어오기 */
    User user = userRepository.findById(ID).get();
    String userRole = user.getRole();

    /* 2. 권한에 따라 다른 메소드 호출 (나중에 구현할 것) 현재는 tempROle */
    // if (user.getRole().equals("host")) {

    // } else if (user.getRole().equals("guest")) {

    // } else { // 게스트도 호스트도 아닐 시

    // }

    List<Appointment> my_appointmentList = null;

    // 게스트 호스트 분기
    // 임시 코드
    if (tempRole.equals("HOST")) {
      my_appointmentList = user.getAppointments();
    } else if (tempRole.equals("GUEST")) {
      my_appointmentList = user.get_appointments();
    } else {
      my_appointmentList = user.getAppointments();
    }

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

    /*
     * select arr.appointment from appointmentRequestResult arr where
     * arr.Ap_reqResultID In (select max(Ap_reqResultID)
     * from appointmentRequestResult group by appointment order by max(approvalTime)
     * desc) and arr.isApproval = 1;
     */

  }

  @Transactional
  @Override
  public Map<String, Object> getMyHistory(String ID) {
    /* 1. guest권한 확인 */

    Map<String, Object> results = new LinkedHashMap<>();

    List<Appointment> list = appointmentRepository.findByGuestOrderByAppointmentIDDesc(User.builder().ID(ID).build());

    List<AppointmentDto> appointment_userDtoList = new ArrayList<>();
    list.forEach(item -> appointment_userDtoList.add(modelMapper.map(item, AppointmentDto.class)));
    results.put("results", appointment_userDtoList);
    return results;
  }

  @Override
  public Map<String, Object> sendArrived(String ID) {
    return null;
  }

}