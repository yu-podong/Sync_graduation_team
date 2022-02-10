// package com.vms.app.interceptor;

// import java.io.PrintWriter;

// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.security.core.context.SecurityContextHolder;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.web.servlet.ModelAndView;
// import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// import com.finaltest.lins.domain.Communication;
// import com.finaltest.lins.repository.CommunicationRepository;

// @Configuration
// public class CheckMyInfoInterceptor extends HandlerInterceptorAdapter {

// @Autowired
// CommunicationRepository commuDao;

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
// int writingID = Integer.parseInt(request.getParameter("writingID"));
// Communication commu = commuDao.getCommunication(writingID);
// if (!userID.equals(commu.getUser().getID())) {
// response.setCharacterEncoding("utf-8");
// response.setContentType("text/html; charset=UTF-8");
// PrintWriter script = response.getWriter();
// script.println("<script>");
// script.println("alert('권한이 없습니다');");
// script.println("location.href='/index'");
// script.println("</script>");
// return false;
// } else {
// return true;
// }
// }
// }
// } catch (Exception e) {
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