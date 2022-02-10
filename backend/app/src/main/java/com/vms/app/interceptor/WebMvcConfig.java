// package com.finaltest.lins.interceptor;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.context.annotation.Configuration;
// import
// org.springframework.scheduling.config.AnnotationDrivenBeanDefinitionParser;
// import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
// import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// @Configuration
// public class WebMvcConfig implements WebMvcConfigurer {

// @Autowired
// private CheckLoginInterceptor CheckLogininterceptor;

// @Autowired
// private UserLoginInterceptor userLoginInterceptor;

// @Autowired
// private CheckMyInfoInterceptor checkMyInfoInterceptor;

// @Override
// public void addInterceptors(InterceptorRegistry registry) {
// // 로그인을 해주세요
// // registry.addInterceptor(CheckLogininterceptor)
// // .addPathPatterns("/calendar")
// // .addPathPatterns("/community/write")
// // .addPathPatterns("/questions/write")
// // .addPathPatterns("/questionListAction")
// // .addPathPatterns("/commentWriteAction")
// // .addPathPatterns("/licenseScrapAction")
// // .addPathPatterns("/commuScrapAction")
// // .addPathPatterns("/myPage")
// // .addPathPatterns("/my-page/scrapLicense")
// // .addPathPatterns("/my-page/scrapCommu")
// // .addPathPatterns("/my-page/user-writing-list")
// // .addPathPatterns("/myPage_checkPasswordAction")
// // .addPathPatterns("/myPage_changePasswordAction")
// // .addPathPatterns("/myPage_changeEmailAction")
// // .addPathPatterns("/withdrawalAction");
// //
// // 로그인 되어 있습니다
// registry.addInterceptor(userLoginInterceptor)
// .addPathPatterns("/register")
// .addPathPatterns("/find");

// // 사용자 권한 체크
// registry.addInterceptor(checkMyInfoInterceptor)
// .addPathPatterns("/deleteAction")
// .addPathPatterns("/modify")
// .addPathPatterns("/modifyAction");

// }

// }
