package com.vms.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

// 프로토타입 개발중 간단한 데이터 확인을 위한 test컨트롤러

@Log4j2
@RestController
public class TestController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}

	@GetMapping("/insertUserData") // 회원 데이터 추가
	public String insertDate() {

		try {

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "success";
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
}
