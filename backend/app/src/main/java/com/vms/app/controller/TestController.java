package com.vms.app.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import com.vms.app.dto.CompanyDto;
import com.vms.app.dto.UserDto;
import com.vms.app.entity.Appointment;
import com.vms.app.entity.AppointmentPeriodOfUse;
import com.vms.app.entity.AppointmentRequestResult;
import com.vms.app.entity.Company;
import com.vms.app.entity.Notice;
import com.vms.app.entity.Place;
import com.vms.app.entity.Setting;
import com.vms.app.entity.User;
import com.vms.app.repository.AppointmentPeriodOfUseRepository;
import com.vms.app.repository.AppointmentRepository;
import com.vms.app.repository.AppointmentRequestResultRepository;
import com.vms.app.repository.CompanyRepository;
import com.vms.app.repository.NoticeRepository;
import com.vms.app.repository.PlaceRepository;
import com.vms.app.repository.SettingRepository;
import com.vms.app.repository.UserRepository;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.log4j.Log4j2;

// 프로토타입 개발중 간단한 데이터 확인을 위한 test컨트롤러

@Log4j2
@RestController
@Transactional
@Tag(name = "bear controller", description = "bear controller desc")
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
	private PlaceRepository placeRepository;

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private SimpleDateFormat time;

	@Autowired
	private PasswordEncoder bCryPasswordEncoder;

	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}

	@GetMapping("/insertAllData") // 모든 데이터 추가
	@Operation(summary = "bear eat method", description = "bear eat method description", tags = { "contact" })
	@ApiResponses(value = {
			@ApiResponse(responseCode = "200", description = "successful operation", content = @Content(array = @ArraySchema(schema = @Schema(implementation = Contact.class)))) })
	public String AppointmentPeriodOfUse() {

		try {
			// 순서 바뀌면 안됨 (외래키를 가진거 부터 지워야 함)

			noticeRepository.deleteAll();
			appointmentPeriodOfUseRepository.deleteAll();
			appointmentRequestResultRepository.deleteAll();
			appointmentRepository.deleteAll();
			placeRepository.deleteAll();
			userRepository.deleteAll();
			companyRepository.deleteAll();
			settingRepository.deleteAll();

			insertCompanyData();
			insertPlaceData();
			insertUserData();
			insertAppointmentData();
			insertAppointmentRequestResultData();
			AppointmentPeriodOfUseData();
			insertSettingmentData();
			insertNoticeData();
			log.info("Strping boot version : " + org.springframework.core.SpringVersion.getVersion());

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
					.position("상무")
					.build();

			Company company2 = Company.builder()
					.company_name("하이닉스")
					.department("인사부")
					.position("상무")
					.build();
			Company company3 = Company.builder()
					.company_name("엘지")
					.department("생산부")
					.position("상무")
					.build();
			Company company4 = Company.builder()
					.company_name("삼성")
					.department("마케팅")
					.position("상무")
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

			// 접견자1
			User user1 = new User("q1q1", bCryPasswordEncoder.encode("q1q1_김승연"), "김승연", "961019-1234567", "01091360767",
					"ksygt728", "gmail.com", "ROLE_USER",
					1, 1, null, companies.get(0), null, null);

			// 접견자2
			User user2 = new User("q2q2", bCryPasswordEncoder.encode("q2q2_홍길동"), "홍길동", "961022-1222267",
					"01012148888", "qwee242", "gmail.com", "ROLE_USER",
					1, 1, null, companies.get(1), null, null);

			// 접견자3
			User user3 = new User("q3q3", bCryPasswordEncoder.encode("q3q3_김이름"), "김이름", "961019-1232887",
					"01091367777", "zzvs5200", "gmail.com", "ROLE_USER",
					1, 1, null, companies.get(3), null, null);

			// 방문자(직장인)1
			User user4 = new User("유현진_01011111232", bCryPasswordEncoder.encode("유현진_01011111232"), "유현진", "961027-1452467",
					"01011111232", "zzvs5200", "gmail.com", "ROLE_USER",
					2, 1, null, companies.get(3), null, null);

			// 방문자(직장인)2
			User user5 = new User("송승우_01091363332", bCryPasswordEncoder.encode("송승우_01091363332"), "송승우", "961022-1346267",
					"01091363332", "zzvs5200", "gmail.com", "ROLE_USER",
					2, 1, null, companies.get(3), null, null);

			// 방문자(직장인)3
			User user6 = new User("이지민_01091367772", bCryPasswordEncoder.encode("이지민_01091367772"), "이지민", "961022-1392567",
					"01091367772", "zzvs5200", "gmail.com", "ROLE_USER",
					2, 1, null, companies.get(3), null, null);

			// 방문자(학생)1
			User user7 = new User("2019395940", bCryPasswordEncoder.encode("2019395940_떠나간지민님"), "떠나간지민님", "961022-1348366",
					"01091661232", "zzvs5200", "gmail.com", "ROLE_USER",
					3, 1, null, companies.get(3), null, null);

			// 방문자(학생)2
			User user8 = new User("2019403922", bCryPasswordEncoder.encode("2019403922_돌아오지않는지민님"), "돌아오지않는지민님",
					"961022-1335237",
					"01095551232", "zzvs5200", "gmail.com", "ROLE_USER",
					3, 1, null, companies.get(3), null, null);

			// 방문자(학생)3
			User user9 = new User("2005104220", bCryPasswordEncoder.encode("2005104220_군대를가버린지님민"), "군대를가버린지님민",
					"961022-1069867",
					"01091361212", "zzvs5200", "gmail.com", "ROLE_USER",
					3, 1, null, companies.get(3), null, null);

			// 관리자1
			User user10 = new User("admin", bCryPasswordEncoder.encode("admin_나는관리자"), "나는관리자", "961022-1059377",
					"01091361422", "zzvs5200", "gmail.com", "ROLE_USER",
					4, 1, null, companies.get(3), null, null);

			users.add(user1);
			users.add(user2);
			users.add(user3);
			users.add(user4);
			users.add(user5);
			users.add(user6);
			users.add(user7);
			users.add(user8);
			users.add(user9);
			users.add(user10);

			userRepository.saveAll(users);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "sucess";
	}

	@GetMapping("/insertPlaceData") // 세팅 추가
	public String insertPlaceData() {

		try {
			List<Place> list = new ArrayList();

			Place place1 = Place.builder()
					.roomNum("101")
					.name("강의실1")
					.floor(1)
					.isUse(0)
					.build();
			Place place2 = Place.builder()
					.roomNum("102")
					.name("강의실2")
					.floor(1)
					.isUse(0)
					.build();
			Place place3 = Place.builder()
					.roomNum("103")
					.name("강의실3")
					.floor(1)
					.isUse(0)
					.build();
			Place place4 = Place.builder()
					.roomNum("104")
					.name("강의실4")
					.floor(1)
					.isUse(0)
					.build();
			Place place5 = Place.builder()
					.roomNum("105")
					.name("강의실5")
					.floor(1)
					.isUse(0)
					.build();
			Place place6 = Place.builder()
					.roomNum("106")
					.name("강의실6")
					.floor(1)
					.isUse(0)
					.build();
			Place place7 = Place.builder()
					.roomNum("107")
					.name("강의실7")
					.floor(1)
					.isUse(0)
					.build();
			Place place8 = Place.builder()
					.roomNum("201")
					.name("실습실1")
					.floor(2)
					.isUse(0)
					.build();
			Place place9 = Place.builder()
					.roomNum("202")
					.name("실습실2")
					.floor(2)
					.isUse(0)
					.build();
			Place place10 = Place.builder()
					.roomNum("203")
					.name("실습실3")
					.floor(2)
					.isUse(0)
					.build();

			list.add(place1);
			list.add(place2);
			list.add(place3);
			list.add(place4);
			list.add(place5);
			list.add(place6);
			list.add(place7);
			list.add(place8);
			list.add(place9);
			list.add(place10);

			placeRepository.saveAll(list);

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/insertAppointmentData") // 일정 데이터 추가
	public String insertAppointmentData() {

		/*
		 * new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new
		 * Timestamp(System.currentTimeMillis()))
		 */

		try {
			List<Appointment> list = new ArrayList<>();
			List<Place> placeList = placeRepository.findAll();
			Appointment appoint1 = Appointment.builder()
					.date(time.format(new Timestamp(System.currentTimeMillis())))
					.visit_place(placeList.get(0))
					.visit_purpose("거래")
					.accompanyingPerson(1)
					.isArrival(0)
					.invite_link("asfioafioqjw21ioioaafsopja")
					.type(1)
					.guest(userRepository.findById("ksygt728").get())
					.host(userRepository.findById("q1q1").get())
					.build();

			Appointment appoint2 = Appointment.builder()
					.date(time.format(new Timestamp(System.currentTimeMillis())))
					.visit_place(placeList.get(1))
					.visit_purpose("생각안남")
					.accompanyingPerson(1)
					.isArrival(0)
					.type(1)
					.invite_link("asfioafioqjw21ioioaafsopja")
					.guest(userRepository.findById("q3q3").get())
					.host(userRepository.findById("w2w2").get())
					.build();

			Appointment appoint3 = Appointment.builder()
					.date(time.format(new Timestamp(System.currentTimeMillis())))
					.visit_place(placeList.get(2))
					.visit_purpose("생각안남2")
					.accompanyingPerson(1)
					.isArrival(0)
					.invite_link("asfioafioqjw21ioioaafsopja")
					.type(1)
					.guest(userRepository.findById("w2w2").get())
					.host(userRepository.findById("q3q3").get())
					.build();

			Appointment appoint4 = Appointment.builder()
					.date(time.format(new Timestamp(System.currentTimeMillis())))
					.visit_place(placeList.get(7))
					.visit_purpose("생각안남2")
					.accompanyingPerson(1)
					.isArrival(0)
					.invite_link("asfioafioqjw21ioioaafsopja")
					.type(1)
					.guest(userRepository.findById("ksygt728").get())
					.host(userRepository.findById("q1q1").get())
					.build();

			Appointment appoint5 = Appointment.builder()
					.date(time.format(new Timestamp(System.currentTimeMillis())))
					.visit_place(placeList.get(8))
					.visit_purpose("생각안남")
					.accompanyingPerson(1)
					.isArrival(0)
					.invite_link("asfioafioqjw21ioioaafsopja")
					.type(1)
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

	@GetMapping("/user")
	public String user() {
		return "user";
	}

	@GetMapping("/manager")
	public String manager() {
		return "manager";
	}

	@GetMapping("/admin")
	public String admin() {
		return "admin";
	}

}
