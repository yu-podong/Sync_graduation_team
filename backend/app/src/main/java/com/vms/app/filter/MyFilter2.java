package com.vms.app.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.security.web.context.SecurityContextPersistenceFilter;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class MyFilter2 extends SecurityContextPersistenceFilter {

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    log.info("SecurityContextPersistenceFilter responsed 2번쨰로 호출");
    chain.doFilter(request, response);
  }

}
