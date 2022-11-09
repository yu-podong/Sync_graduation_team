package com.vms.app.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vms.app.dto.NoticeDto;
import com.vms.app.entity.Notice;
import com.vms.app.repository.NoticeRepository;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class NoticeServiceImpl implements NoticeService {

  @Autowired
  private NoticeRepository noticeRepository;

  @Autowired
  ModelMapper modelMapper;

  @Transactional
  @Override
  public Map<String, Object> getBbs() {
    Map<String, Object> results = new LinkedHashMap<>();

    try {
      List<Notice> list = noticeRepository.findAllByOrderByNoticeIDDesc();
      List<NoticeDto> listDto = new ArrayList<>();
      list.forEach(item -> {
        listDto.add(modelMapper.map(item, NoticeDto.class));
      });

      results.put("reuslt", list);
    } catch (Exception e) {
      e.printStackTrace();
    }

    return results;

  }

}
