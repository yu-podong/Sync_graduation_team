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
        .description("VMS API 명세서입니다. 프론트엔드에서 Rest Server로 요청을 보낼 url입니다. 개발에 참고해주세요.\n" +
            "1. BaseURL : ~~~~~~~\n" +
            "2. [BaseURL]/[Api] 로 요청을 보내시면 됩니다. e.g. ~~~~~/insertAllData\n" +
            "3. GET요청 시 Try it Out은 안될 확률이 높습니다.(미숙해요..ㅎㅎ)\n " +
            "\n\n<b>구현 되지 않은 Api가 있거나, 필요한 기능이 없거나 설명이 부족하거나 헷갈리시면 언제든지 말씀해주세요!</b>")
        .version("1.0.0")
        .build();
  }

}