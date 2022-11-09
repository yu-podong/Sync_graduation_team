package com.vms.app.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vms.app.service.NoticeService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@Api("공지사항 관련 Controller 입니다")
public class NoticeController {

  @Autowired
  private NoticeService noticeService;

  @ModelAttribute("cp")
  public String getContextPath(HttpServletRequest request) {
    return request.getContextPath();
  }

  @ApiOperation(value = "<상단 네비게이션>[MyInfo.dart]", notes = "- 유저와 회사정보를 가져옵니다. \n")
  @GetMapping("/getBbs")
  public Map<String, Object> getBbs() {
    return noticeService.getBbs();
  }

}
