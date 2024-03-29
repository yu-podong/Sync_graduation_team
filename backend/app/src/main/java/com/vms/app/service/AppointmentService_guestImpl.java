package com.vms.app.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vms.app.dto.AppointmentDto;
import com.vms.app.dto.AppointmentDto_main;
import com.vms.app.entity.AccompanyPerson;
import com.vms.app.entity.Appointment;
import com.vms.app.entity.AppointmentPeriodOfUse;
import com.vms.app.entity.AppointmentRequestResult;
import com.vms.app.entity.Place;
import com.vms.app.entity.User;
import com.vms.app.repository.AccompanyPersonRepository;
import com.vms.app.repository.AppointmentPeriodOfUseRepository;
import com.vms.app.repository.AppointmentRepository;
import com.vms.app.repository.AppointmentRequestResultRepository;
import com.vms.app.repository.PlaceRepository;
import com.vms.app.repository.UserRepository;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class AppointmentService_guestImpl implements AppointmentService_guest {

  @Autowired
  AppointmentRepository appointmentRepository;

  @Autowired
  UserRepository userRepository;

  @Autowired
  AppointmentPeriodOfUseRepository appointmentPeriodOfUseRepository;

  @Autowired
  AppointmentRequestResultRepository appointmentRequestResultRepository;

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
  public Map<String, Object> getMyAppointment(String ID, String tempRole) {

    Map<String, Object> results = new LinkedHashMap<>();

    /* 1. userRepository로 권한 얻어오기 */
    /** ID = w3w3 일때 noSuchElementsException */
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
    /* 0. guest권한 확인 */

    Map<String, Object> results = new LinkedHashMap<>();

    /* 1. guest의 약속 가져오기(동반인원 포함) */

    // List<Appointment> list =
    // appointmentRepository.findByGuestOrderByAppointmentIDDesc(User.builder().ID(ID).build());
    List<Appointment> list = appointmentRepository
        .findByGuestOrderByAppointmentIDDesc_withAccompanyPerson(User.builder().ID(ID).build());

    /* 3. dto 매핑 */
    List<AppointmentDto> appointment_userDtoList = new ArrayList<>();
    list.forEach(item -> appointment_userDtoList.add(modelMapper.map(item, AppointmentDto.class)));
    results.put("results", appointment_userDtoList);
    return results;
  }

  @Override
  @Transactional
  public int sendArrived(long appointmentID) {

    // 1. 해당 guest가 약속을 잡은게 맞는지 확인 : Optional Fliter로 토근값과 일치하는지 확인

    appointmentRepository.findById(appointmentID).ifPresentOrElse(ap -> ap.setIsArrival(1), () -> {
      log.info("일치하는 값 없음");
    });

    // 2. 접견자에게 알림보내기

    return 1;
  }

  @Transactional
  @Override
  public Map<String, Object> getMyAppointment(String ID) {
    Map<String, Object> results = new LinkedHashMap<>();

    User user = userRepository.findById(ID).get();
    List<Appointment> my_appointmentList = appointmentRepository
        .findByGuestOrderByAppointmentIDDesc_withAccompanyPerson(user);
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
          if (currentTime.compareTo(checkoutTime) > 0)
            appointmentDtoList.add(modelMapper.map(item, AppointmentDto.class));
        }
      }
    });

    results.put("myAppointmentList", appointmentDtoList);

    return results;
  }

  @Transactional
  @Override
  public Map<String, Object> getApprovalResult(String ID) {
    Map<String, Object> results = new LinkedHashMap<>();

    User user = userRepository.findById(ID).get();
    // List<Appointment> my_appointmentList = user.get_appointments();
    List<Appointment> my_appointmentList = appointmentRepository
        .findByGuestOrderByAppointmentIDDesc_withAccompanyPerson(user);
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
    List<Appointment> appointmentList = appointmentRepository.getTodayList_guest_withAccompanyPerson(user);

    // List<AppointmentDto> appointmentDtoList = new ArrayList<>();
    List<AppointmentDto_main> appointmentDtoList = new ArrayList<>();

    appointmentList.forEach(item -> {
      // appointmentDtoList.add(modelMapper.map(item, AppointmentDto.class));
      appointmentDtoList.add(modelMapper.map(item, AppointmentDto_main.class));

    });

    results.put("myAppointmentList", appointmentDtoList);

    return results;
  }

  @Transactional
  @Override
  public int createAppointment(String ID, String hostID, int placeID, Appointment appointment, String checkIn,
      String checkOut) {

    // 1. host guest place 객체 생성(관계 매핑)
    User _host = userRepository.findById(hostID).orElse(null);
    User _guest = userRepository.findById(ID).orElse(null);
    Place _place = placeRepository.findById((long) placeID).orElse(null);

    // 체크인, 인바이트 링크 추가 데이터
    appointment.setDate(checkIn);
    appointment.setInvite_link("inviteLink");

    appointment.setHost(_host); // 매핑
    appointment.setGuest(_guest); // 매핑
    appointment.setVisit_place(_place); // 매핑

    // AppointmentPeriodOfUse 객체 생성
    AppointmentPeriodOfUse appointmentPeriodOfUse = AppointmentPeriodOfUse.builder()
        .checkIn(checkIn)
        .checkOut(checkOut)
        .appointment(appointment)
        .build();

    // AppointmentRequestResult 객체 생성
    AppointmentRequestResult appointmentRequestResult = AppointmentRequestResult.builder()
        .appointment(appointment)
        .isApproval(0)
        .rejectReason("")
        .build();
    // log.warn("[appointment] : " + appointmentPeriodOfUse.getAp_periodID());

    try {
      int duplicateCheckPlace = this.duplicateCheckPlace(_place, checkIn, checkOut);
      int duplicateCheckUser = this.duplicateCheckUser(appointment, checkIn, checkOut);

      if (duplicateCheckPlace == 1 && duplicateCheckUser == 1) { // 모두 중복이 아닐 경우
        appointmentRepository.save(appointment);
        appointmentPeriodOfUseRepository.save(appointmentPeriodOfUse);
        appointmentRequestResultRepository.save(appointmentRequestResult);

      } else {
        return -2; // 일정 중복
      }

    } catch (Exception e) {
      log.warn("방문자 정보가 일치 하지 않습니다.");
      e.printStackTrace();
      return -1;
    }
    return 0;
  }

  @Transactional
  @Override
  public int agreeAccompany(String ID, long appointmentID) {

    try {
      Appointment appointment = appointmentRepository.findById(appointmentID).orElse(null);
      User guest = userRepository.findById(ID).orElse(null);

      List<AccompanyPerson> accompanyList = accompanyPersonRepository.findByGuestAndAppointment(guest, appointment);

      if (!accompanyList.isEmpty()) {
        log.warn("이미 가입한 사용자입니다.");
        return 0;
      } else {

        AccompanyPerson accompanyPerson = AccompanyPerson.builder()
            .appointment(appointment)
            .guest(guest)
            .build();

        accompanyPersonRepository.save(accompanyPerson);
      }
    } catch (Exception e) {
      e.printStackTrace();
      log.info("입력한 정보가 불일치 합니다.");
      return -1; // 정보 불일치
    }
    log.info("동행인에 추가 되었습니다.");
    ;
    return 1;
  }

  @Override
  public int duplicateCheckPlace(Place place, String nowCheckIn, String nowCheckOut) {

    try {

      Place now_place = placeRepository.findById(place.getPlaceID()).orElse(null);
      if (now_place != null) {

        List<AppointmentPeriodOfUse> list = appointmentPeriodOfUseRepository.duplicateCheckPlace(place.getPlaceID(),
            nowCheckIn, nowCheckOut);
        // log.warn("list.size() : " + list.size());
        return (list.isEmpty()) ? 1 : 0;
      }
      log.info("장소에 대한 정보가 올바르지 않습니다.");
      return -1; // 해당 장소가 없음

    } catch (Exception e) {
      e.printStackTrace();
      return -2; //
    }
  }

  @Override
  public int duplicateCheckUser(Appointment appointment, String nowCheckIn, String nowCheckOut) {
    try {
      if (appointment != null) {
        User host = appointment.getHost();
        User guest = appointment.getGuest();

        // 중복된 일정이 있는지 체크 한 리스트

        List<AppointmentPeriodOfUse> appointmentPeriodOfUse_guestList = appointmentPeriodOfUseRepository
            .duplicateCheckHost(host.getID(), nowCheckIn,
                nowCheckOut);

        List<AppointmentPeriodOfUse> appointmentPeriodOfUse_hostList = appointmentPeriodOfUseRepository
            .duplicateCheckHost(guest.getID(), nowCheckIn,
                nowCheckOut);

        if (!appointmentPeriodOfUse_guestList.isEmpty()) {
          log.info("방문자의 일정이 중복됩니다.");
          return -1;
        } else if (!appointmentPeriodOfUse_hostList.isEmpty()) {
          log.info("접견자의 일정이 중복됩니다.");
          return -2;
        } else {
          return 1; // 일정 중복 X
        }

      }
      log.info("약속에 대한 정보가 올바르지 않습니다. (접견자 or 방문자 or 약속에 대한 정보 없음)");
      return -3; // 약속에 대한 정보가 올바르지 않음

    } catch (Exception e) {
      e.printStackTrace();
      return -4; //
    }

  }

}
