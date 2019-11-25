package com.my.spring.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.product.detail.ColorTransForm;
import com.my.spring.product.service.ProductService;
import com.my.spring.product.vo.ProductVO;

@Controller("mainController")
@RequestMapping("/main")
public class MainController {

	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductVO productvo;
	
	@RequestMapping("/main.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView();
		
		final int displayproduct = 6;
		
		int pagenum = (request.getParameter("pagenum") == null) ? 1 : Integer.parseInt(request.getParameter("pagenum")); 
		int min_price = (request.getParameter("min_price") == null) ? 0 : Integer.parseInt(request.getParameter("min_price"));
		int max_price = (request.getParameter("max_price") == null) ? 0 : Integer.parseInt(request.getParameter("max_price"));
		String keyword = (request.getParameter("keyword") == null) ? "%%" : request.getParameter("keyword");
		String keyword_detail = (request.getParameter("keyword_detail") == null) ? "%%" : request.getParameter("keyword_detail");
		String list_type = (request.getParameter("list_type") == null || request.getParameter("list_type") == "") ? "other" : request.getParameter("list_type");
		String pro_status = (request.getParameter("pro_status") == null) ? "%%" : request.getParameter("pro_status");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagenum", pagenum);
		map.put("keyword", keyword);
		map.put("list_type", list_type);
		map.put("displayproduct", displayproduct);
		map.put("min_price", min_price);
		map.put("max_price", max_price);
		map.put("pro_status" , pro_status);	
		
		
		List<ProductVO> [] list = new List[2];
		list[0] = new ArrayList<ProductVO>();
		list[1] = new ArrayList<ProductVO>();
		List<Integer> indexlist[] = new List[2];
		indexlist[0] = new ArrayList<Integer>();
		indexlist[1] = new ArrayList<Integer>();
		
		ColorTransForm Ctf = new ColorTransForm();
		
		
		
		map.put("keyword_detail", "트렌치코트");
		List<ProductVO> productlist_trench = productService.productlist(map);
		
		list[0] = Ctf.product_Color_List(productlist_trench);
		indexlist[0] = list[0].get(0).getIndex_list();
		List<ProductVO> trenchlist = new ArrayList<ProductVO>();
		for(Integer indexnum : indexlist[0]) {
			trenchlist.add(list[0].get(indexnum));
		}
		
		map.put("keyword_detail", "자켓");
		List<ProductVO> productlist_jk = productService.productlist(map);
		
		list[1] = Ctf.product_Color_List(productlist_jk);
		indexlist[1] = list[1].get(0).getIndex_list();
		List<ProductVO> jklist = new ArrayList<ProductVO>();
		for(Integer indexnum : indexlist[1]) {
			jklist.add(list[1].get(indexnum));
		}
		
		
		mav.addObject("pro_list_jk",jklist);
		mav.addObject("pro_list_trench",trenchlist);
		mav.setViewName(viewName);
		return mav;
		
	}
	
	@RequestMapping(value="/FindLocation.do")
	public ModelAndView FindLocation(HttpServletRequest request) {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/always_asking.do")
	public ModelAndView Always_asking(HttpServletRequest request) {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
		return mav;
	}
	
}


@Controller
class index{
	@RequestMapping("/")
	public String index() {
		return "redirect:/main/main.do";
	}
}
