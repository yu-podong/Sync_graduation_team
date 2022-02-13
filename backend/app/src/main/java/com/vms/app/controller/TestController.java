package com.vms.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import com.vms.app.dto.CompanyDto;
import com.vms.app.dto.UserDto;
import com.vms.app.entity.Company;
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

	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}

	@Transactional
	@GetMapping("/insertUserData") // 회원 데이터 추가
	public String insertData() {

		try {
			// *********[형식]*********
			// <User>
			// (아이디, 비밀번호, 이름, 주민등록번호, 폰번호, 이메일앞자리, 이메일뒷자리, role, isLoginCheck, null(회사),
			// null, null, null(setting))

			// List<Company> Alldata = companyRepository.findAll();
			// for (Company company : companies) {
			// boolean flag = false;
			// for (Company company_data : Alldata) {
			// if (!company.equals(company_data))
			// flag = true;
			// }
			// if (flag)
			// companyRepository.save(company);
			// }

			/////////////////////////////////////////////////////////////////////////////////
			List<Company> companies = new ArrayList<>();
			companies = companyRepository.findAll();

			List<User> users = new ArrayList<>();

			User user1 = new User("ksygt728", "123", "김승연", "961019-1234567", "01091360767", "ksygt728", "gmail.com", "User",
					1, companies.get(0), null, null, null);
			User user2 = new User("saiqgo522", "123", "홍길동", "961022-1222267",
					"01012142243", "qwee242", "gmail.com", "User",
					1, companies.get(1), null, null, null);
			User user3 = new User("ksygt728", "123", "김이름", "961019-1232467",
					"01091361232", "zzvs5200", "gmail.com", "User",
					1, companies.get(3), null, null, null);

			users.add(user1);
			users.add(user2);
			users.add(user3);

			userRepository.saveAll(users);
			/////////////////////////////////////////////////////////////////////////////////

		} catch (Exception e) {
			e.printStackTrace();
		}

		// return userRepository.findAll().get(0).getID();
		return "asd";
	}

	@GetMapping("/insertAppointmentData") // 일정 데이터 추가
	public String insertAppointmentData() {

		try {

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/insertCompanyData") // 회사 데이터 추가
	public String insertCompanyData() {

		try {

			List<Company> companies = new ArrayList<>();

			Company company1 = new Company();
			Company company2 = new Company();
			Company company3 = new Company();
			Company company4 = new Company();

			company1.setCompany_name("삼성");
			company1.setDepartment("영업부");

			company2.setCompany_name("하이닉스");
			company2.setDepartment("인사부");

			company3.setCompany_name("엘지");
			company3.setDepartment("생산부");

			company4.setCompany_name("삼성");
			company4.setDepartment("마케팅");

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

	@GetMapping("/insertSettingData") // 세팅 추가
	public String insertSettingmentData() {

		try {

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/insertNoticeData") // 공지사항 추가
	public String insertNoticeData() {

		try {

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/insertAppointmentRequestResultData")
	public String insertAppointmentRequestResultData() {

		try {

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/AppointmentPeriodOfUseData")
	public String AppointmentPeriodOfUseData() {

		try {

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/insertAllData") // 모든 데이터 추가
	public String AppointmentPeriodOfUse() {

		try {

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

	@GetMapping("/deleteAllData") // 모든 데이터 삭제
	public String deleteAllData() {

		try {

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
	}

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
