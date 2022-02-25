package com.vms.app;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
public class QuerydslJPATest {

	// @Autowired
	// CommunicationRepository commuDao;

	// @Autowired
	// ImageRepositorySupport imageReposit;

	// @Test
	// @DisplayName("JPA Test")
	// void test() {
	// List<Communication> list = commuDao.getCommunicationList("xxx");
	// log.info("list size: " + list.size());
	// }

	@Test
	@DisplayName("queryDSL TEST")
	void test2() {
		// int reuslt = imageReposit.delete(24, 1);
		// log.warn("result : " + reuslt);

	}

}
