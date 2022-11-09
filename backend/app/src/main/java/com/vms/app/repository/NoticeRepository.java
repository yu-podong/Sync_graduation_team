package com.vms.app.repository;

import com.vms.app.entity.Notice;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeRepository extends JpaRepository<Notice, Long> {

  List<Notice> findAllByOrderByNoticeIDDesc();

}
