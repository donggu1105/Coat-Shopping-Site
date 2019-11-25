package com.my.spring.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.notice.review.service.ReviewService;
import com.my.spring.product.detail.ColorSizeOverlap;
import com.my.spring.product.detail.ColorTransForm;
import com.my.spring.product.service.ProductService;
import com.my.spring.product.vo.ProductDetailVO;
import com.my.spring.product.vo.ProductVO;

@Controller("productController")
@RequestMapping(value="/product")
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	ProductVO productVO;
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(value="/productlist.do", method= {RequestMethod.GET,RequestMethod.POST})
	   public ModelAndView productlist(HttpServletRequest request ) {
	      final int displaypage = 5;
	      final int displayproduct = 12;
	      String keyword2 = (request.getParameter("keyword5") == null) ? null : request.getParameter("keyword5");
	      System.out.println("keyword2 : "+keyword2);
	      int pagenum = (request.getParameter("pagenum") == null) ? 1 : Integer.parseInt(request.getParameter("pagenum")); 
	      int min_price = (request.getParameter("min_price") == null || request.getParameter("min_price").equals("all")) ? 0 : Integer.parseInt(request.getParameter("min_price"));
	      int max_price = min_price + 30000; if(min_price == 140000) max_price = 300000;
	      String keyword = (request.getParameter("keyword") == null) ? "%%" : request.getParameter("keyword");
	      String keyword_detail = (request.getParameter("keyword_detail") == null) ? "%%" : request.getParameter("keyword_detail");
	      String list_type = (request.getParameter("list_type") == null) ? "other" : request.getParameter("list_type");
	      String pro_status = (request.getParameter("pro_status") == null) ? "%%" : request.getParameter("pro_status");
	      String pro_color = (request.getParameter("pro_color") == null) ? null : request.getParameter("pro_color");
	      
	      Map<String, Object> map = new HashMap<String, Object>();
	      
	      
	   
	       map.put("keyword2", keyword2);
	      map.put("pagenum", pagenum);
	      map.put("keyword", keyword);
	      map.put("keyword_detail", keyword_detail);
	      map.put("list_type", list_type);
	      map.put("pro_status", pro_status);
	      map.put("pro_color", pro_color);
	      map.put("min_price", min_price);
	      map.put("max_price", max_price);
	      map.put("displayproduct", displayproduct);
		
		int allnum;
		List<ProductVO> list = null;
		
		try {
		list = productService.productlist(map);
		allnum = productService.productlist_count(map);
		}catch(Exception e) {
			allnum = 0 ;
		}
		
		ColorTransForm Ctf = new ColorTransForm();
		list = Ctf.product_Color_List(list);
		List<Integer> index_list = list.get(0).getIndex_list();
		List<ProductVO> product_list = new ArrayList<ProductVO>();
		int index_num = -1;
		int i = 0;
		
		for(ProductVO vo : list) {
			index_num ++;
			if(index_num == index_list.get(i)) {
				product_list.add(vo);
				i++;
				if(i == index_list.size())
					break;
			}
		}

		int allpage = (allnum % displayproduct == 0) ? allnum / displayproduct : allnum / displayproduct + 1;
		int startpage = (pagenum % displaypage == 0 ) ? pagenum - 4 :  pagenum - (pagenum % displaypage - 1);
		int endpage = startpage + displaypage - 1; 
		boolean next = (pagenum < allpage) ? true : false;
		boolean prev = (pagenum > 1) ? true : false;
		
		
		
		Map<String,Object> page = new HashMap<String,Object>();
		page.put("displaypage", displaypage);
		page.put("pagenum", pagenum);
		page.put("allpage", allpage);
		page.put("startpage", startpage);
		page.put("endpage", endpage);
		page.put("next", next);
		page.put("prev", prev);
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		
			
			
		mav.addObject("pro_list" , product_list);
	
		mav.addObject("paging" , page);
		mav.addObject("keyword",keyword);
		mav.addObject("keyword_detail" , keyword_detail);
		mav.addObject("list_type" , list_type);
		mav.addObject("pro_status" , pro_status);
		mav.addObject("min_price" , min_price);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/productdetail.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView productdetail(HttpServletRequest request) {
		
		
		
		int pro_code = Integer.parseInt(request.getParameter("pro_code"));
		
		ProductVO pvo = new ProductVO();
		ProductDetailVO pdvo = new ProductDetailVO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map=productService.productdetail(pro_code);
		productService.productcountupdate(pro_code);
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		ColorSizeOverlap cs = new ColorSizeOverlap();
		Map<String,Object> csmap = new HashMap<String, Object>();
		csmap = cs.colorandsize((List<ProductDetailVO>)map.get("product_detail"));
		
		
		//리뷰뽑기 - review서비스 연결
				Map productReviewMap = new HashMap();
				productReviewMap=reviewService.productReviews(pro_code);
				mav.addObject("productReviewMap", productReviewMap);
		//
		
		mav.setViewName(viewName);
		mav.addObject("product",map.get("product"));
		mav.addObject("product_detail",map.get("product_detail"));
		mav.addObject("product_image" , map.get("product_image"));
		mav.addObject("color" , csmap.get("color"));
		mav.addObject("size" , csmap.get("size"));
		
		
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/quantitycheck.do" , method=RequestMethod.POST)
	public String quantitycheck(HttpServletRequest request ,@RequestParam("pro_code") int pro_code,
										@RequestParam("color") String color,
										@RequestParam("size") String size) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pro_code", pro_code);
		map.put("color", color);
		map.put("size", size);
		int pro_detail_code = productService.product_detail_code(map);
		String result = productService.productquantity_check(map);
		
		if(result.equals("true"))
			return String.valueOf(pro_detail_code);
		else
			return null;
		
	}
}
