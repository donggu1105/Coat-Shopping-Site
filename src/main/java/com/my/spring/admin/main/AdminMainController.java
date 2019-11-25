package com.my.spring.admin.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("adminMainController")
@RequestMapping("/admin/main")
public class AdminMainController {
		
	
	
	@RequestMapping(value="/adminMain.do" , method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminMain (HttpServletRequest request, HttpServletResponse response) {
		System.out.println("git 출력");
		System.out.println("master 수정");
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		
		mav.setViewName("/admin/order/orderStatics");
		return mav;
		
	}
}
