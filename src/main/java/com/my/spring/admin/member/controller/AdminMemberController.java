package com.my.spring.admin.member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.spring.admin.member.service.AdminMemberService;
import com.my.spring.member.vo.MemberVO;

@Controller("adminMemberController")
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	AdminMemberService adminMemberService;
	@Autowired
	MemberVO memberVO;
	
	@RequestMapping(value="/listMembers.do", method= {RequestMethod.POST, RequestMethod.GET}) //회원목록 리스트로 뽑아내기
	public ModelAndView listMembers (HttpServletRequest request, HttpServletResponse response,
				@RequestParam(value="order_lately_date", required=false) String order_lately_date,
				@RequestParam(value="order_total_buy", required=false) String order_total_buy,
				@RequestParam(value="order_total_order", required=false) String order_total_order,
				@RequestParam(value="member_gender", required=false) String member_gender,
				@RequestParam(value="keyword", required=false) String keyword
			
			) {
			
		
			
			HttpSession session=request.getSession();
			if(session.getAttribute("side_menu") !=null){
				session.removeAttribute("side_menu");
			}
			session.setAttribute("side_menu", "side_member");
			String viewName=(String)request.getAttribute("viewName");//viewName가져오기
			ModelAndView mav=new ModelAndView();
			String _section=(String)request.getParameter("section"); //섹션값가져오기
			String _pageNum=(String)request.getParameter("pageNum"); //페이지넘버가져오기
			int section=Integer.parseInt(((_section ==null)? "1" : _section)); //int로 변환
			int pageNum=Integer.parseInt(((_pageNum ==null)? "1" : _pageNum));
			Map<String,Object> pagingMap=new HashMap();
			
			
			System.out.println("section : "+section);
			System.out.println("pageNum : "+pageNum);
			System.out.println("order_lately_date : "+order_lately_date);
			System.out.println("order_total_buy : "+order_total_buy);
			System.out.println("order_total_order : "+order_total_order);
			System.out.println("member_gender : "+member_gender);
			System.out.println("keyword : "+keyword);
			
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
			pagingMap.put("order_lately_date", order_lately_date);
			pagingMap.put("order_total_buy", order_total_buy);
			pagingMap.put("order_total_order", order_total_order);
			pagingMap.put("member_gender", member_gender);
			pagingMap.put("keyword", keyword);
			
		
		
			 //최종으로 jsp에 보내줄 Map생성 이쪽에 membersList 그리고 Paging,section번호까지 담아서 보내줄거임
			
			Map<String,Object> membersMap=adminMemberService.listMembers(pagingMap);
			membersMap.put("section", section);
			membersMap.put("pageNum", pageNum);
			membersMap.put("order_lately_date", order_lately_date);
			membersMap.put("order_total_buy", order_total_buy);
			membersMap.put("order_total_order", order_total_order);
			membersMap.put("member_gender", member_gender);
			membersMap.put("keyword", keyword);
			mav.addObject("membersMap",membersMap); // 회원정보를 담은 membersMap를 바인딩
			mav.setViewName(viewName);
		
		return mav;
		
	}
	@RequestMapping(value="/memberupdate.do" , method= {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity modfiyMember (HttpServletRequest request, HttpServletResponse response) {
		
		ResponseEntity resEnt=null;
		
		return resEnt;
		
	}
	@RequestMapping(value="/viewMember.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView viewMember(@RequestParam(value="member_code", required=false) String member_code,
									@RequestParam(value="memberKeyword", required=false) String memberKeyword,
									@RequestParam(value="nonMemberKeyword", required=false) String nonMemberKeyword,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		if(session.getAttribute("side_menu") !=null){
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_member");
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		Map searchMap=new HashMap();
		Map<String,Object> viewMap=new HashMap();
		
		if(member_code !=null && !member_code.equals("")) {
			searchMap.put("member_code", member_code);
			System.out.println("member_code : "+ member_code);
		}
		if(memberKeyword !=null && !memberKeyword.equals("")) {
			searchMap.put("memberKeyword", memberKeyword);
			System.out.println("memberKeyword "+memberKeyword);
		}
		
	    viewMap=adminMemberService.viewMember(searchMap);
		mav.setViewName(viewName);
		
		mav.addObject("viewMap",viewMap);
		return mav;
	}

		
	@RequestMapping(value="/deleteMember.do" , method= {RequestMethod.POST, RequestMethod.GET })
		public ModelAndView deleteMember (@RequestParam(value="member_code", required=false) String member_code,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
			
			ModelAndView mav=new ModelAndView();
			
			adminMemberService.deleteMember(member_code);
			
			mav.setViewName("redirect:/admin/member/listMembers.do");
		return mav;
		}
	
	@RequestMapping(value="/searchMember.do" , method= {RequestMethod.POST})
		public ModelAndView searchMember (@RequestParam(value="memberSearch", required=false) String memberSearch,
										RedirectAttributes redir,
										HttpServletRequest request, HttpServletResponse response) {
			
			
		ModelAndView mav=new ModelAndView();
		redir.addAttribute("memberKeyword", memberSearch);
		mav.setViewName("redirect:/admin/member/viewMember.do");
		return mav;		
		
	}
	
	@RequestMapping(value="/memberStatics.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView searchMember (HttpServletRequest request, HttpServletResponse response) {
		
		
	ModelAndView mav=new ModelAndView();
	String viewName=(String)request.getAttribute("viewName");

	
	Map<String,Object> viewMap=adminMemberService.getMemberStatics();
	
	mav.addObject("viewMap",viewMap);
	mav.setViewName(viewName);
	return mav;		
	
}
}
			

