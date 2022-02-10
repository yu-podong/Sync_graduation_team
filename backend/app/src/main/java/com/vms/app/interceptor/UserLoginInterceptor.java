// package com.finaltest.lins.interceptor;

// import java.io.PrintWriter;

// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;

// import org.springframework.beans.factory.annotation.Configurable;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.security.core.context.SecurityContextHolder;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.web.servlet.ModelAndView;
// import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// @Configuration
// public class UserLoginInterceptor extends HandlerInterceptorAdapter {

// @Override
// public boolean preHandle(HttpServletRequest request, HttpServletResponse
// response, Object handler)
// throws Exception {
// UserDetails userDetails = null;
// try {

// userDetails = (UserDetails)
// SecurityContextHolder.getContext().getAuthentication().getPrincipal();

// if (userDetails != null) {
// String userID = userDetails.getUsername();
// if (userID != null) {
// response.setCharacterEncoding("utf-8");
// response.setContentType("text/html; charset=UTF-8");
// PrintWriter script = response.getWriter();
// script.println("<script>");
// script.println("alert('잘못된 접근입니다');");
// script.println("history.back();");
// script.println("</script>");
// return false;
// }
// }
// } catch (Exception e) {
// }
// return true;
// }

// @Override
// public void postHandle(HttpServletRequest request, HttpServletResponse
// response, Object handler,
// ModelAndView modelAndView) throws Exception {
// super.postHandle(request, response, handler, modelAndView);
// }

// @Override
// public void afterCompletion(HttpServletRequest request, HttpServletResponse
// response, Object handler, Exception ex)
// throws Exception {

// super.afterCompletion(request, response, handler, ex);
// }
// }