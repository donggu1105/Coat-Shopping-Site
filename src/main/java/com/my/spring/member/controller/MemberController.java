package com.my.spring.member.controller;

import java.io.Console;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.ConsoleHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.member.nonmember.service.NonMemberService;
import com.my.spring.member.pass_lock.Login;
import com.my.spring.member.service.MemberService;
import com.my.spring.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	
	  @RequestMapping(value="/idoverlap.do", method=RequestMethod.POST)
	  public ResponseEntity idoverlap(@RequestParam(value = "member_id" , required = false) String member_id,
			  						  @RequestParam(value = "nonmember_id" , required = false) String nonmember_id,
			  HttpServletRequest request, HttpServletResponse response) {
		  
		  ResponseEntity resEtn=null;
		  String result=memberService.idoverlap(member_id);//signup.jsp �� member_id �� ���� �޾ƿͼ� �˻�
		  
		  resEtn=new ResponseEntity(result,HttpStatus.OK);
		  System.out.println("Id Overlap result : " + resEtn);
		  return resEtn;
	  }
		
	
	  @RequestMapping(value ="/membersignupform.do" , method= {RequestMethod.POST,RequestMethod.GET}) 
	  public ModelAndView signupform(HttpServletRequest request, HttpServletResponse response) { 
		  String viewName=(String)request.getAttribute("viewName");
		  ModelAndView mav = new ModelAndView();
		  
		  mav.setViewName(viewName);
		  	
		  return mav;
	  }
	  
	  @RequestMapping(value="/membersignup.do", method= {RequestMethod.POST,RequestMethod.GET}) 
	  public ModelAndView signup(@ModelAttribute("membervo") MemberVO vo,HttpServletRequest request) {
		
		  String cp = (vo.getMember_cp_yn() == null || vo.getMember_cp_yn() == "") ? "N" : vo.getMember_cp_yn(); //���� ���Ǹ� �����ʾ����� N���� ���� 
		  String email = (vo.getMember_email_yn() == null || vo.getMember_email_yn() == "") ? "N" : vo.getMember_email_yn();
		  vo.setMember_cp_yn(cp);
		  vo.setMember_email_yn(email);
		  
		  Login lo = new Login();
		  try { 
			vo = lo.password_Lock(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		  
		  memberService.signupMember(vo);
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName("redirect:/main/main.do");
		  
		  return mav;
	  }
	  
	  @RequestMapping(value ="/memberloginform.do" , method= {RequestMethod.GET, RequestMethod.POST})
	  public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) {
		  
		  String viewName=(String)request.getAttribute("viewName");
		  ModelAndView mav = new ModelAndView();
		  
		  mav.setViewName(viewName);
		  return mav;
	  }
	  
	  @RequestMapping(value ="/memberlogin.do" , method= {RequestMethod.POST,RequestMethod.GET}) 
	  public ModelAndView login(@RequestParam("member_id") String member_id,
			  					@RequestParam("member_pwd") String member_pwd,
			  					HttpServletRequest request,HttpServletResponse response) throws IOException {
		  MemberVO vo = new MemberVO();
		  vo = memberService.loginMember(member_id);
		  Login lo = new Login();
		  try {
			vo = lo.password_Confirm(vo, member_pwd);
		} catch (Exception e) {
		}
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName("redirect:/main/main.do");
		  
		  
		  if(vo.getMember_id().equals("admin")) {
		  mav.setViewName("redirect:/admin/order/orderStatics.do");}
			  
		  HttpSession session = request.getSession();
		  session.setAttribute("memberInfo", vo);
		  session.setAttribute("isLogOn", true);
		  session.setMaxInactiveInterval(18000);
		  
		  return mav;
	  }
	  @RequestMapping(value="/memberupdateform.do" , method= {RequestMethod.POST,RequestMethod.GET})
	  public ModelAndView updateform(HttpServletRequest request) {
		  
		  String viewName=(String)request.getAttribute("viewName"); 
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName(viewName);
		  
		  return mav;
	  }
	  
	  @RequestMapping(value="/memberupdate.do" ,method= {RequestMethod.POST,RequestMethod.GET})
	  public ModelAndView update(@ModelAttribute("membervo") MemberVO vo,HttpServletRequest request) {
		  
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName("redirect:/main/main.do");
		  HttpSession session = request.getSession();
		  
		  MemberVO mvo = (MemberVO) session.getAttribute("memberInfo"); 
		  vo.setMember_code(mvo.getMember_code());
		  vo.setMember_id(mvo.getMember_id());
		  vo = memberService.memberupdate(vo);
		  session.setAttribute("memberInfo", vo);
		  session.setMaxInactiveInterval(18000);
		  
		  return mav;
	  }
	  
	  @RequestMapping(value="/memberlogout.do" , method=RequestMethod.GET)
	  public ModelAndView logout(HttpServletRequest request) {
		  
		  
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName("redirect:/main/main.do");
		  HttpSession session = request.getSession();
		  session.removeAttribute("memberInfo");
		  session.removeAttribute("isLogOn");
		  
		  return mav;
	  }
	  
	  @RequestMapping(value="/memberinfo.do")
	  public ModelAndView info(HttpServletRequest request) {
		  
		  HttpSession session = request.getSession();
		  String viewName;
		  if(session.getAttribute("memberInfo") != null || session.getAttribute("nonmemberInfo") != null) {
			  viewName = (String)request.getAttribute("viewName");
		  }else {
			  viewName = "redirect:/main/main.do";
		  }
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName(viewName);
		  
		  return mav;
	  }
	  
	  @RequestMapping(value ="/membersignupchoice.do")
	  public ModelAndView choice(HttpServletRequest request) {
		  String viewName = (String)request.getAttribute("viewName");
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName(viewName);
		  
		  return mav;
	  }
	  
	  @RequestMapping(value="/membersecessionform.do")
	  public ModelAndView secessionform(HttpServletRequest request) {
		  
		  String viewName = (String)request.getAttribute("viewName");
		  ModelAndView mav = new ModelAndView();
		  
		  mav.setViewName(viewName);
		  return mav;
	  }
	  
	  @RequestMapping(value="/membersecession.do" , method= {RequestMethod.POST,RequestMethod.GET})
	  public ModelAndView secession(HttpServletRequest request) {
		  
		  int member_code = (request.getParameter("member_code") == null ) ? 0 :Integer.parseInt(request.getParameter("member_code"));
		  int nonmember_code = (request.getParameter("nonmember_code") == null ) ? 0 : Integer.parseInt(request.getParameter("nonmember_code"));
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  
		  if(member_code != 0) {
			map.put("table", "member");  
			map.put("column", "member_code");
			map.put("code", member_code);
		  }else if(nonmember_code != 0) {
			  map.put("table", "nonmember");
			  map.put("column", "nonmember_code");
			  map.put("code", nonmember_code);
		  }
		  
		  memberService.secession(map);
		  
		  HttpSession session = request.getSession();
		  session.removeAttribute("memberInfo");
		  session.removeAttribute("nonmemberInfo");
		  session.removeAttribute("isLogOn");
		  session.removeAttribute("NonisLogOn");
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName("redirect:/main/main.do");
		  
		  return mav;
	  }
	  
	  
	  
	 
	  
}
