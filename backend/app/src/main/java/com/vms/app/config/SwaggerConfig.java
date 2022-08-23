package com.vms.app.config;

import java.util.HashSet;
import java.util.Set;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
@EnableWebMvc
public class SwaggerConfig {

  @Bean
  public Docket api() {
    return new Docket(DocumentationType.OAS_30)
        .useDefaultResponseMessages(false)
        .select()
        .apis(RequestHandlerSelectors.basePackage("com.vms.app"))
        .paths(PathSelectors.any())
        .build()
        .apiInfo(apiInfo());
  }

  private ApiInfo apiInfo() {
    return new ApiInfoBuilder()
        .title("VMS Open API")
        .description("VMS API 명세서입니다. 프론트엔드에서 Rest Server로 요청을 보낼 url입니다. 개발에 참고해주세요.\n\n\n" +
            "1. BaseURL : Vms-env-1.eba-2mmc5mce.ap-northeast-2.elasticbeanstalk.com/\n" +
            "2. GET요청 시 Try it Out은 안될 확률이 높습니다.(JWT인증을 필요해서 그런데 찾아보겠습니다.)\n\n\n " +
            "<b>구현 되지 않은 API가 있거나, 필요한 기능이 없거나 설명이 부족하거나 헷갈리시면 언제든지 말씀해주세요!</b>\n\n\n"
            // RELEASE NOTE
            + "[RELEASE NOTE]\n\n"
            + "v1.2.1 : 2022.8.23 - Host, Guest Controller 세부 기능 추가, [GUEST]승인이력 추가, [HOST] 승인내역 추가 [commit : 48d8699d06cfa37f8252e889f58917a7fd0c9c11]\n\n"
            + "v1.1.1 : 2022.8.23 - 추가 개발로 인한 설명 정리\n\n"
            + "v1.1.0 : 2022.7.20 - Host, Guest Controller [api : approvalAppointment, getMyAppointment, getRequestedAppointment, rejectAppointment etc] [commit : cfd023fbb829c07a647bd5e34dcc462c9a875dca]\n\n"
            + "v1.0.0 : 2022.7.13 - swagger 연동, TEST [commit : e40ede476cf27d4affed242e9d9e68afd9f8cbc8]" +
            "")
        .version("1.2.1")
        .build();
  }

}