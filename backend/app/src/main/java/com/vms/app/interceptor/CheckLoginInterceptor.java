// package com.vms.app.interceptor;

// import java.io.PrintWriter;

// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;

// import org.springframework.beans.factory.annotation.Configurable;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.web.servlet.ModelAndView;
// import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// @Configuration
// public class CheckLoginInterceptor extends HandlerInterceptorAdapter {

// @Override
// public boolean preHandle(HttpServletRequest request, HttpServletResponse
// response, Object handler)
// throws Exception {
// HttpSession session = request.getSession(false);
// if (session != null) {
// String userID = (String) session.getAttribute("userID");
// if (userID != null) {
// return true;
// }
// }
// response.setCharacterEncoding("utf-8");
// response.setContentType("text/html; charset=UTF-8");
// PrintWriter script = response.getWriter();
// script.println("<script>");
// script.println("alert('로그인을 해주세요');");
// script.println("location.href='/index'");
// script.println("</script>");

// return false;
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