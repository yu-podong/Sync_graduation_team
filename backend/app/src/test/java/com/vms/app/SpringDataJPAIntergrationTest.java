// package com.vms.app;

// import java.util.ArrayList;

// import javax.transaction.Transactional;

// import org.junit.jupiter.api.DisplayName;
// import org.junit.jupiter.api.Test;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.boot.test.context.SpringBootTest;

// import lombok.extern.log4j.Log4j2;

// @Log4j2
// @SpringBootTest
// @Transactional
// class SpringDataJPAIntergrationTest {

// @Autowired
// UserRepository userDao;

// // @Autowired //queryDSL
// // UserRepository userRepository;

// @Autowired
// UserService userService;

// @Autowired
// CommentRepository commentDao;

// @Autowired
// CommunicationRepository commuDao;

// @Autowired
// LicenseRepository licenseDao;

// @Autowired
// CommuscrapRepository commuScrapDao;

// // @Test
// // @DisplayName("User find by ID 테스트")
// // void UserFindByID() {
// // Optional<User> user = userDao.findById("qwe");
// // assertThat(user.get().getPassword()).isEqualTo("123");
// // }
// //
// // @Test
// // @DisplayName("save() Test")
// // void saveTest() {
// // Communication commu = new Communication();
// // commu.setWritingID(27);
// // commu.setCategory("xxx");
// // commu.setSub_category("free");
// // commu.setTitle("예시입니다");
// // commu.setID("qwe");
// // commu.setNickName("qwe");
// // commu.setCommuDate("2021-08-05");
// // commu.setContent("안녕하세요");
// // commu.setScrapCount(0);
// // commu.setView(0);
// // commu.setAvailable(1);
// //
// //// Communication result = commuDao.save(commu);
// //// logger.info("save return is : " + result.getID());
// // }
// //
// //// @Test
// //// @DisplayName("delete() Test")
// //// void deleteTest() {
// //// Communication commu = commuDao.getById(24);
// //// // 1. entity로 지우는 법
// ////// commuDao.delete(commu);
// ////
// //// // 2. id로 지우는 법
// ////// commuDao.deleteById(26);
// //// }
// ////
// //// @Test
// //// @DisplayName("count() Test")
// //// void countTest() {
// //// int count = (int) commuDao.count();
// //// log.info("count : " + count);
// //// }
// ////
// //// @Test
// //// @DisplayName("save update() Test")
// //// @Transactional
// //// void updateTest() {
// //// Communication commu = commuDao.getById(23);
// //// log.info(commu.getTitle());
// //// commu.setTitle("수정 후 제목입니다");
// //// Communication result = commuDao.save(commu); // update
// //// log.info(result.getTitle());
// //// }
// //
// // @Test
// // @DisplayName("find sort Test")
// // void sortTest() {
// //
// //// 단일 order
// //// List<Communication> list = commuDao.findAll(Sort.by(Sort.Direction.DESC,
// // "title"));
// //// for (int i = 0; i < list.size(); i++) {
// //// logger.info(i +" : " + list.get(i).getTitle());
// //// }
// //
// // // 다중 order
// //// List<Order> orders = new ArrayList<Order>();
// ////
// //// Order StartTimeOrder = new Order(Sort.Direction.DESC, "StartTime");
// //// orders.add(StartTimeOrder);
// //// Order progDateOrder = new Order(Sort.Direction.ASC, "ProgDate");
// //// orders.add(progDateOrder);
// //// List<Communication> list = commuDao.findAll(Sort.by(orders));
// //
// // }
// //
// //// @Test
// //// @DisplayName("find limit Test")
// //// void findByID() {
// ////
// //// //일반
// //// List<Communication> list = commuDao.findByCategory("xxx");
// //// log.info("***********************************************");
// //// list.forEach(commu->log.info(commu.getTitle()));
// //// log.info("***********************************************");
// ////
// //// //and
// //// List<Communication> list2 = commuDao.findByCategoryAndTitle("xxx",
// // "asd1");
// //// log.info("***********************************************");
// //// list2.forEach(commu->log.info(commu.getTitle()));
// //// log.info("***********************************************");
// ////
// //// //group by @query anootation
// //// List<Communication> list3 = commuDao.findByCategoryGroupByCategory();
// //// log.info("***********************************************");
// //// list3.forEach(commu->log.info(commu.getTitle()));
// //// log.info("***********************************************");
// ////
// //// //order by
// //// List<Communication> list4 = commuDao.findByOrderByWritingIDDesc();
// //// log.info("***********************************************");
// //// list3.forEach(commu->log.info(commu.getTitle()));
// //// log.info("***********************************************");
// ////
// //// }
// ////
// //
// // @Test
// // @DisplayName("find limit Test")
// // void limitTest() {
// //
// // }
// //
// // @Test
// // @DisplayName("userService login 실행")
// // void userServiceLogin() {
// //// log.warn("userService 값 "+userService.login("qwe", "123"));
// // }
// //
// // @Test
// // @DisplayName("CommunicationDAO : getNextTest")
// // void getNextTest() {
// // int nextID = commuDao.getNext();
// // log.info("nextID: " + nextID);
// //
// //// assertThat(nextID).isEqualsTo(24);
// // }
// //
// // @Test
// // @DisplayName("CommunicationDAO : getWritingIDTest")
// // void getWritingIDTest() {
// // int writingID = commuDao.getWritingID(23);
// // log.info("wirtingID: " + writingID);
// // assertThat(writingID).isEqualTo(23);
// // }
// //
// // @Test
// // @DisplayName("CommunicationDAO : getCommunication")
// // void getCommunicationTest() {
// //
// // Communication commu = commuDao.getCommunication(23);
// // log.info("commu writind ID :" + commu.getWritingID());
// // log.info("commu title :" + commu.getTitle());
// // log.info("commu content :" + commu.getContent());
// // }
// //
// // @Test
// // @DisplayName("CommunicationDAO : getCommunicationList")
// // void getCommunicationListTest() {
// //
// // List<Communication> commuList = commuDao.getCommunicationList("xxx");
// //
// // log.info("List size :" + commuList.size());
// // }
// //
// //// @Test
// //// @DisplayName("userRepository : userRepositoryTest")
// //// void userRepositoryTest() {
// //// //queryDSL 잘 연동 되는지
// //// User user = userRepository.findUserQueryDSL("qwe");
// //// assertThat(user.getPassword()).isEqualTo("123");
// ////
// //// }
// //
// // @Test
// // @DisplayName("getDateTest commentDAO")
// // void commentDaogetDateTest() {
// // List<Comment> list =
// // commentDao.findByCommentKeyWritingIDOrderByCommentKeyCommentIDAsc(12);
// // log.info("list(o) commentID : " +
// // list.get(0).getCommentKey().getCommentID());
// // log.info("list(o) writingID : " +
// // list.get(0).getCommentKey().getWritingID());
// // assertThat(list.size()).isEqualTo(7);
// //
// // }

// // @Test
// // @DisplayName("getDateTest commentDAO")
// // void secessionUpdateTest() {
// // Commuscrap c = commuScrapDao.getCommuscrap("qwe", 1);
// // log.info("c ID : " + c.getCommuScrapKey().getID());
// // log.info("c writingID : " + c.getCommuScrapKey().getWritingID());
// // }
// }
