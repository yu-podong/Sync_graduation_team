// package com.vms.app;

// import static org.assertj.core.api.Assertions.assertThat;

// import java.util.HashMap;

// import org.junit.jupiter.api.Test;
// import org.junit.jupiter.api.extension.ExtendWith;
// import org.mockito.InjectMocks;
// import org.mockito.Mock;
// import org.mockito.junit.jupiter.MockitoExtension;

// import lombok.extern.log4j.Log4j2;

// @Log4j2
// @ExtendWith(MockitoExtension.class)
// class ServiceTest {

// @Mock
// private CommuscrapRepository commuscrapDao;

// @InjectMocks
// private CommunicationService commuService;

// @Test
// void test() {
// HashMap<String, Object> map = commuService.getLicenseNameList();
// assertThat(map).isNotNull();

// // Commuscrap c = commuscrapDao.getCommuscrap("qwe",1);
// // log.info("c ID : " + c.getCommuScrapKey().getID());
// // log.info("c writingID : " + c.getCommuScrapKey().getWritingID());
// }

// }
