package com.vms.app.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class MyFilter1 implements Filter {

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {

    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;
    res.setCharacterEncoding("UTF-8");
    // 토큰 : 코스
    // if (req.getMethod().equals("POST")) {

    // String headerAuth = req.getHeader("Authorization");
    // log.info("headerAuth : " + headerAuth);

    // if (headerAuth.equals("cors")) {
    // chain.doFilter(req, res);
    // } else {
    // PrintWriter out = res.getWriter();
    // out.println("인증 안됨");
    // return;

    // }
    // }
    log.info("filter1 responsed (security filter 등록에 의해 1번째로 호출");

    chain.doFilter(req, res);

  }

}
