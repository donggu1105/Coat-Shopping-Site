package com.my.spring.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.spring.member.nonmember.vo.NonMemberVO;
import com.my.spring.member.vo.MemberVO;
import com.my.spring.mypage.service.MyPageService;
import com.my.spring.notice.qna.dao.QnADao;
import com.my.spring.notice.qna.pagevo.PageVO;
import com.my.spring.notice.qna.service.QnAService;
import com.my.spring.notice.qna.vo.QnAVO;
import com.my.spring.notice.review.dao.ReviewDAO;
import com.my.spring.notice.review.service.ReviewService;
import com.my.spring.order.dao.OrderDAO;
import com.my.spring.order.vo.OrderVO;

@Controller("myPageController")
@RequestMapping("/mypage")
public class MyPageController {

   @Autowired
   OrderDAO orderdao;
   
   @Autowired
   ReviewService reviewService;
   
   @Autowired
   QnAService qnaService;
   @Autowired
   MyPageService myPageService;
   
   
   @RequestMapping(value="/memberInfo.do")
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
     
     @RequestMapping(value="/memberInfo_orderList.do" , method= {RequestMethod.POST,RequestMethod.GET})
     public ModelAndView info_orderlist(HttpServletRequest request) {
        
        HttpSession session = request.getSession();
        String viewName = (String)request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = new HashMap<String, Object>();
        if((Boolean)session.getAttribute("isLogOn")) {
			MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
			map.put("col", "member");
			map.put("code", vo.getMember_code());
		}else if((Boolean)session.getAttribute("NonisLogOn")) {
			NonMemberVO vo = (NonMemberVO)session.getAttribute("nonmemberInfo");
			map.put("col", "nonmember");
			map.put("code", vo.getNonmember_code());
		}
        List<OrderVO> orderlist = orderdao.get_OrderList(map);
        List<Integer> groupCountlist = orderdao.order_Code_GroupCount(map);
        
        
        mav.addObject("orderlist" , orderlist);
        mav.addObject("countlist" , groupCountlist);
        
        mav.setViewName(viewName);
        
      return mav;
     }
     
     @RequestMapping(value="/memberInfo_refundList.do" , method= {RequestMethod.POST,RequestMethod.GET})
     public ModelAndView info_refundlist(HttpServletRequest request) {
        
        HttpSession session = request.getSession();
        String viewName = (String)request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = new HashMap<String, Object>();
        if((Boolean)session.getAttribute("isLogOn")) {
			MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
			map.put("col", "member");
			map.put("code", vo.getMember_code());
		}else if((Boolean)session.getAttribute("NonisLogOn")) {
			NonMemberVO vo = (NonMemberVO)session.getAttribute("nonmemberInfo");
			map.put("col", "nonmember");
			map.put("code", vo.getNonmember_code());
		}
        List<OrderVO> orderlist = orderdao.get_OrderList(map);
        List<Integer> groupCountlist = orderdao.order_Code_GroupCount(map);
        
        
//        System.out.println("orderlist.size() : " + orderlist.size());
//        System.out.println("groupcountlist.size() : " + groupCountlist.size());
        
        mav.addObject("orderlist" , orderlist);
        mav.addObject("countlist" , groupCountlist);
        
        mav.setViewName(viewName);
        
      return mav;
     }
     
     @RequestMapping(value = "/orderDetail.do", method= {RequestMethod.POST,RequestMethod.GET})
     public ModelAndView orderDetail(HttpServletRequest request,
    		 						@RequestParam("order_code") int order_code) {
    	 HttpSession session = request.getSession();
    	 String viewName = (String)request.getAttribute("viewName");
    	 ModelAndView mav = new ModelAndView();
    	 Map<String, Object> map = new HashMap<String, Object>();
         if((Boolean)session.getAttribute("isLogOn")) {
 			MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
 			map.put("col", "member");
 			map.put("code", vo.getMember_code());
 		}else if((Boolean)session.getAttribute("NonisLogOn")) {
 			NonMemberVO vo = (NonMemberVO)session.getAttribute("nonmemberInfo");
 			map.put("col", "nonmember");
 			map.put("code", vo.getNonmember_code());
 		}
         map.put("order_code", order_code);
    	 OrderVO vo = orderdao.orderDetail(map);
    	 List<OrderVO> orderlist = orderdao.get_OrderList(map);
    	 
    	 
    	 mav.addObject("orderInfo" , vo);
    	 mav.addObject("orderlist" , orderlist);
    	 mav.setViewName(viewName);
    	 return mav;
     }
     
     
    @RequestMapping(value ="/myReviewList.do", method= {RequestMethod.POST, RequestMethod.GET})//리뷰 목록
 	public ModelAndView myReviewList(HttpServletRequest request, HttpServletResponse response , PageVO vo) {	
 		ModelAndView mav = new ModelAndView();
 		String viewName=(String)request.getAttribute("viewName");
 		HttpSession session=request.getSession();
 		
 		MemberVO member=(MemberVO)session.getAttribute("memberInfo");
 		String member_id=member.getMember_id();
 		
 		
 		Map<String,Object> viewMap=myPageService.getMyArticles(member_id);
 		mav.setViewName(viewName);
 		mav.addObject("viewMap", viewMap);
 		return mav;

 	}
     
/*     @RequestMapping("/myReviewList.do")//리뷰 목록
 	public ModelAndView myReviewList(HttpServletRequest request, HttpServletResponse response) {

 		String viewName = (String) request.getAttribute("viewName");
 		ModelAndView mav = new ModelAndView();
 		Map listMap = new HashMap();
 		Map pagingMap=new HashMap();
 		
 		String _section=(String)request.getParameter("section"); 
 		String _pageNum=(String)request.getParameter("pageNum");
 		String member_id=request.getParameter("member_id");
 		
 		int section=Integer.parseInt(((_section==null) ?"1" : _section)); 
 		int pageNum=Integer.parseInt(((_pageNum==null) ?"1" : _pageNum));
 		
 		pagingMap.put("member_id", member_id);
 		pagingMap.put("section", section);
 		pagingMap.put("pageNum", pageNum);
 		
 		listMap=reviewService.listMyReview(pagingMap);

 		listMap.put("section", section); 
 		listMap.put("pageNum", pageNum); 
 		
 		mav.addObject("listMap",listMap);

 		mav.setViewName(viewName);
 		return mav;

 	}*/
}