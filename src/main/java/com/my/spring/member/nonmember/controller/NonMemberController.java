package com.my.spring.member.nonmember.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.member.nonmember.service.NonMemberService;
import com.my.spring.member.nonmember.vo.NonMemberVO;
import com.my.spring.member.pass_lock.Login;
import com.my.spring.member.service.MemberService;

@Controller("nonmemberController")
@RequestMapping(value="/nonmember")
public class NonMemberController {
	
	@Autowired
	NonMemberService nonmemberService;
	
	
	@RequestMapping(value="/idoverlap.do" , method=RequestMethod.POST)
	public ResponseEntity idoverlap(@RequestParam("nonmember_id") String nonmember_id) throws Exception {
		
		ResponseEntity resEtn = null;
		String result = nonmemberService.idoverlap(nonmember_id);
		resEtn=new ResponseEntity(result,HttpStatus.OK);
		System.out.println("Non Id Overlap result : " + resEtn);
		return resEtn;
	}
	
	@RequestMapping(value="/nonmembersignupform.do")
	public ModelAndView signupform(HttpServletRequest request) {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/nonmembersignup.do")
	public ModelAndView signup(@ModelAttribute("nonmember")NonMemberVO vo , HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		Login lo = new Login();
		
		vo = lo.password_Lock_non(vo);
		
		String viewName = (String)request.getAttribute("viewName");
		nonmemberService.nonmembersignup(vo);
		
		mav.setViewName("redirect:/main/main.do");
		
		return mav;
	}
	
	@RequestMapping(value="/nonmemberlogin.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login(@RequestParam("nonmember_id") String nonmember_id , 
							  @RequestParam("nonmember_pwd") String nonmember_pwd,
							  HttpServletRequest request) {
		
		NonMemberVO vo = new NonMemberVO();
		vo = nonmemberService.loginnonmember(nonmember_id);
		Login lo = new Login();
		try {
			lo.password_Confirm_non(vo, nonmember_pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/main/main.do");
		HttpSession session = request.getSession();
		session.setAttribute("nonmemberInfo", vo);
		session.setAttribute("NonisLogOn", true);
		session.setMaxInactiveInterval(18000);
		
		return mav;
	}
	
	@RequestMapping(value="/nonmemberlogout.do")
	public ModelAndView logout(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		session.removeAttribute("nonmemberInfo");
		session.removeAttribute("NonisLogOn");
		
		mav.setViewName("redirect:/main/main.do");
		
		return mav;
	}
	
	@RequestMapping(value="/nonmemberupdateform.do")
	public ModelAndView updateform(HttpServletRequest request) {
		
		String viewName = (String)request.getAttribute("viewName");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/nonmemberupdate.do" , method=RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("nonmember") NonMemberVO vo ,
								HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/member/memberinfo.do");
		
		return mav;
	}
	
}
