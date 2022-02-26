package com.vms.app.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import com.vms.app.dto.CompanyDto;
import com.vms.app.dto.UserDto;
import com.vms.app.entity.Appointment;
import com.vms.app.entity.AppointmentPeriodOfUse;
import com.vms.app.entity.AppointmentRequestResult;
import com.vms.app.entity.Company;
import com.vms.app.entity.Notice;
import com.vms.app.entity.Setting;
import com.vms.app.entity.User;
import com.vms.app.repository.AppointmentPeriodOfUseRepository;
import com.vms.app.repository.AppointmentRepository;
import com.vms.app.repository.AppointmentRequestResultRepository;
import com.vms.app.repository.CompanyRepository;
import com.vms.app.repository.NoticeRepository;
import com.vms.app.repository.SettingRepository;
import com.vms.app.repository.UserRepository;

import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

// 프로토타입 개발중 간단한 데이터 확인을 위한 test컨트롤러

@Log4j2
@RestController
@Transactional
public class TestController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AppointmentRepository appointmentRepository;

	@Autowired
	private AppointmentPeriodOfUseRepository appointmentPeriodOfUseRepository;

	@Autowired
	private AppointmentRequestResultRepository appointmentRequestResultRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CompanyRepository companyRepository;

	@Autowired
	private NoticeRepository noticeRepository;

	@Autowired
	private SettingRepository settingRepository;

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private SimpleDateFormat time;

	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}

	@GetMapping("/insertAllData") // 모든 데이터 추가
	public String AppointmentPeriodOfUse() {

		try {
			// 순서 바뀌면 안됨 (외래키를 가진거 부터 지워야 함)

			noticeRepository.deleteAll();
			appointmentPeriodOfUseRepository.deleteAll();
			appointmentRequestResultRepository.deleteAll();
			appointmentRepository.deleteAll();
			userRepository.deleteAll();
			companyRepository.deleteAll();
			settingRepository.deleteAll();

			insertCompanyData();
			insertUserData();
			insertAppointmentData();
			insertAppointmentRequestResultData();
			AppointmentPeriodOfUseData();
			insertSettingmentData();
			insertNoticeData();

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/insertCompanyData") // 회사 데이터 추가
	public String insertCompanyData() {

		// 초기화

		try {

			List<Company> companies = new ArrayList<>();

			Company company1 = Company.builder()
					.company_name("삼성")
					.department("영업부")
					.build();

			Company company2 = Company.builder()
					.company_name("하이닉스")
					.department("인사부")
					.build();
			Company company3 = Company.builder()
					.company_name("엘지")
					.department("생산부")
					.build();
			Company company4 = Company.builder()
					.company_name("삼성")
					.department("마케팅")
					.build();

			companies.add(company1);
			companies.add(company2);
			companies.add(company3);
			companies.add(company4);

			companyRepository.saveAll(companies);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@Transactional
	@GetMapping("/insertUserData") // 회원 데이터 추가
	public String insertUserData() {

		try {

			List<Company> companies = new ArrayList<>();
			companies = companyRepository.findAll();

			List<User> users = new ArrayList<>();

			User user1 = new User("ksygt728", "123", "김승연", "961019-1234567", "01091360767", "ksygt728", "gmail.com", "User",
					1, companies.get(0), null, null);
			User user2 = new User("saiqgo522", "123", "홍길동", "961022-1222267",
					"01012142243", "qwee242", "gmail.com", "User",
					1, companies.get(1), null, null);
			User user3 = new User("q1q1", "123", "김이름", "961019-1232887",
					"01091361232", "zzvs5200", "gmail.com", "User",
					1, companies.get(3), null, null);
			User user4 = new User("q3q3", "123", "유현진", "961027-1452467",
					"01091361232", "zzvs5200", "gmail.com", "User",
					1, companies.get(3), null, null);
			User user5 = new User("w2w2", "123", "이지민", "961022-1342467",
					"01091361232", "zzvs5200", "gmail.com", "User",
					1, companies.get(3), null, null);

			users.add(user1);
			users.add(user2);
			users.add(user3);
			users.add(user4);
			users.add(user5);

			userRepository.saveAll(users);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "sucess";
	}

	@GetMapping("/insertAppointmentData") // 일정 데이터 추가
	public String insertAppointmentData() {

		/*
		 * new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new
		 * Timestamp(System.currentTimeMillis()))
		 */

		try {
			List<Appointment> list = new ArrayList<>();

			Appointment appoint1 = Appointment.builder()
					.date(time.format(new Timestamp(System.currentTimeMillis())))
					.visit_place("삼성 대기실 1")
					.visit_purpose("거래")
					.accompanyingPerson(1)
					.isArrival(0)
					.invite_link("asfioafioqjw21ioioaafsopja")
					.guest(userRepository.findById("ksygt728").get())
					.host(userRepository.findById("q1q1").get())
					.build();

			Appointment appoint2 = Appointment.builder()
					.date(time.format(new Timestamp(System.currentTimeMillis())))
					.visit_place("엘지 어디어디")
					.visit_purpose("생각안남")
					.accompanyingPerson(1)
					.isArrival(0)
					.invite_link("asfioafioqjw21ioioaafsopja")
					.guest(userRepository.findById("q3q3").get())
					.host(userRepository.findById("w2w2").get())
					.build();

			Appointment appoint3 = Appointment.builder()
					.date(time.format(new Timestamp(System.currentTimeMillis())))
					.visit_place("하이닉스 어디어디")
					.visit_purpose("생각안남2")
					.accompanyingPerson(1)
					.isArrival(0)
					.invite_link("asfioafioqjw21ioioaafsopja")
					.guest(userRepository.findById("w2w2").get())
					.host(userRepository.findById("q3q3").get())
					.build();

			Appointment appoint4 = Appointment.builder()
					.date(time.format(new Timestamp(System.currentTimeMillis())))
					.visit_place("삼성 생각안남")
					.visit_purpose("생각안남2")
					.accompanyingPerson(1)
					.isArrival(0)
					.invite_link("asfioafioqjw21ioioaafsopja")
					.guest(userRepository.findById("ksygt728").get())
					.host(userRepository.findById("q1q1").get())
					.build();

			Appointment appoint5 = Appointment.builder()
					.date(time.format(new Timestamp(System.currentTimeMillis())))
					.visit_place("하이닉스 생각안남")
					.visit_purpose("생각안남")
					.accompanyingPerson(1)
					.isArrival(0)
					.invite_link("asfioafioqjw21ioioaafsopja")
					.guest(userRepository.findById("w2w2").get())
					.host(userRepository.findById("q3q3").get())
					.build();

			list.add(appoint1);
			list.add(appoint2);
			list.add(appoint3);
			list.add(appoint4);
			list.add(appoint5);

			appointmentRepository.saveAll(list);

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";

	}

	@GetMapping("/insertSettingData") // 세팅 추가
	public String insertSettingmentData() {

		try {
			List<Setting> list = new ArrayList();

			Setting setting1 = Setting.builder()
					.userID("ksygt728")
					.user(userRepository.findById("ksygt728").get())
					.build();

			Setting setting2 = Setting.builder()
					.userID("w2w2")
					.user(userRepository.findById("w2w2").get())
					.build();

			list.add(setting1);
			list.add(setting2);

			settingRepository.saveAll(list);

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/insertNoticeData") // 공지사항 추가
	public String insertNoticeData() {

		try {
			List<Notice> list = new ArrayList<>();

			Notice notice1 = Notice.builder()
					.content("내용입니다1")
					.title("제목입니다1")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice2 = Notice.builder()
					.content("내용입니다2")
					.title("제목입니다2")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice3 = Notice.builder()
					.content("내용입니다3")
					.title("제목입니다3")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice4 = Notice.builder()
					.content("내용입니다4")
					.title("제목입니다4")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice5 = Notice.builder()
					.content("내용입니다5")
					.title("제목입니다5")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice6 = Notice.builder()
					.content("내용입니다6")
					.title("제목입니다6")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice7 = Notice.builder()
					.content("내용입니다7")
					.title("제목입니다7")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice8 = Notice.builder()
					.content("내용입니다8")
					.title("제목입니다8")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice9 = Notice.builder()
					.content("내용입니다9")
					.title("제목입니다9")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice10 = Notice.builder()
					.content("내용입니다10")
					.title("제목입니다10")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice11 = Notice.builder()
					.content("내용입니다11")
					.title("제목입니다11")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			Notice notice12 = Notice.builder()
					.content("내용입니다12")
					.title("제목입니다12")
					.write_date(time.format(new Timestamp(System.currentTimeMillis())))
					.writer("admin")
					.build();

			list.add(notice1);
			list.add(notice2);
			list.add(notice3);
			list.add(notice4);
			list.add(notice5);
			list.add(notice6);
			list.add(notice7);
			list.add(notice8);
			list.add(notice9);
			list.add(notice10);
			list.add(notice11);
			list.add(notice12);

			noticeRepository.saveAll(list);

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/insertAppointmentRequestResultData")
	public String insertAppointmentRequestResultData() {

		try {
			List<AppointmentRequestResult> list = new ArrayList<>();

			List<Appointment> ap_list = appointmentRepository.findAll();

			// 가져온 약속 리스트중 첫번째 데이터[표시 : 대기중 0]
			AppointmentRequestResult ap_rr1 = AppointmentRequestResult.builder()
					.approvalTime(time.format(new Timestamp(System.currentTimeMillis())))
					.isApproval(0) // 대기중
					.appointment(appointmentRepository.findById(ap_list.get(0).getAppointmentID()).get())
					.build();

			// 가져온 약속 리스트중 두번째 데이터[표시 : 대기중 0]
			AppointmentRequestResult ap_rr2 = AppointmentRequestResult.builder()
					.approvalTime(time.format(new Timestamp(System.currentTimeMillis())))
					.isApproval(0) // 대기중
					.appointment(appointmentRepository.findById(ap_list.get(1).getAppointmentID()).get())
					.build();

			// 가져온 약속 리스트중 두번째 데이터[표시 : 승인 1]
			AppointmentRequestResult ap_rr2_approval = AppointmentRequestResult.builder()
					.approvalTime(time.format(new Timestamp(System.currentTimeMillis())))
					.isApproval(1) // 대기중
					.appointment(appointmentRepository.findById(ap_list.get(1).getAppointmentID()).get())
					.build();

			// 가져온 약속 리스트중 세번째 데이터[표시 : 거절 -1]
			AppointmentRequestResult ap_rr3 = AppointmentRequestResult.builder()
					.approvalTime(time.format(new Timestamp(System.currentTimeMillis())))
					.isApproval(-1) // 대기중
					.rejectReason("바쁨")
					.appointment(appointmentRepository.findById(ap_list.get(2).getAppointmentID()).get())
					.build();

			list.add(ap_rr1);
			list.add(ap_rr2);
			list.add(ap_rr2_approval);
			list.add(ap_rr3);

			appointmentRequestResultRepository.saveAll(list);

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/AppointmentPeriodOfUseData")
	public String AppointmentPeriodOfUseData() {

		try {
			List<AppointmentPeriodOfUse> list = new ArrayList<>();
			List<Appointment> ap_list = appointmentRepository.findAll();

			// log.info(time.format(new Timestamp(System.currentTimeMillis())));
			// log.info(time.format(new Timestamp(System.currentTimeMillis() + 1000000)));

			/* 3번의 변동 된 시간 */
			AppointmentPeriodOfUse ap_pr1 = AppointmentPeriodOfUse.builder()
					.checkIn(time.format(new Timestamp(System.currentTimeMillis())))
					.checkOut(time.format(new Timestamp(System.currentTimeMillis() + 100000)))
					.appointment(ap_list.get(0))
					.build();

			AppointmentPeriodOfUse ap_pr2 = AppointmentPeriodOfUse.builder()
					.checkIn(time.format(new Timestamp(System.currentTimeMillis())))
					.checkOut(time.format(new Timestamp(System.currentTimeMillis() + 100000)))
					.appointment(ap_list.get(0))
					.build();

			AppointmentPeriodOfUse ap_pr3 = AppointmentPeriodOfUse.builder()
					.checkIn(time.format(new Timestamp(System.currentTimeMillis())))
					.checkOut(time.format(new Timestamp(System.currentTimeMillis() + 1000000)))
					.appointment(ap_list.get(0))
					.build();

			/* 2번의 변동된 시간 */
			AppointmentPeriodOfUse ap_pr4 = AppointmentPeriodOfUse.builder()
					.checkIn(time.format(new Timestamp(System.currentTimeMillis())))
					.checkOut(time.format(new Timestamp(System.currentTimeMillis())))
					.appointment(ap_list.get(1))
					.build();

			AppointmentPeriodOfUse ap_pr5 = AppointmentPeriodOfUse.builder()
					.checkIn(time.format(new Timestamp(System.currentTimeMillis())))
					.checkOut(time.format(new Timestamp(System.currentTimeMillis() + 100000)))
					.appointment(ap_list.get(1))
					.build();

			list.add(ap_pr1);
			list.add(ap_pr2);
			list.add(ap_pr3);
			list.add(ap_pr4);
			list.add(ap_pr5);

			appointmentPeriodOfUseRepository.saveAll(list);

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	/*
	 *
	 * [ModelMapper Test] : Entity를 직접 가져오지 않기
	 *
	 */
	// Model Mapper Test func 하나의 객체 가져오기
	@GetMapping(value = "/mapperTest_getOneData")
	public Map<String, Object> mapperTest_getOneData() {
		Map<String, Object> map = new HashMap<>();

		User user = userRepository.findById("ksygt728").get();
		UserDto userDto = modelMapper.map(user, UserDto.class);

		Company company = user.getCompany();
		CompanyDto companyDto = modelMapper.map(company, CompanyDto.class);
		map.put("user", userDto);
		map.put("company", companyDto);

		return map;

	}

	// Model Mapper Test func 하나의 객체 가져오기
	@GetMapping(value = "/mapperTest_getAllData")
	public Map<String, Object> mapperTest_getAllData() {
		Map<String, Object> map = new HashMap<>();

		List<User> userList = userRepository.findAll();
		List<UserDto> userDtoList = new ArrayList<>();
		userList.forEach(user -> {
			userDtoList.add(modelMapper.map(user, UserDto.class));
		});

		map.put("userList", userDtoList);

		return map;

	}

}
