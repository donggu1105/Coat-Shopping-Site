package com.my.spring.cart.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.awt.PageAttributes.OriginType;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.cart.service.CartService;
import com.my.spring.cart.vo.CartVO;
import com.my.spring.member.nonmember.vo.NonMemberVO;
import com.my.spring.member.vo.MemberVO;
import com.my.spring.product.detail.ColorSizeOverlap;
import com.my.spring.product.vo.ImageFileVO;
import com.my.spring.product.vo.ProductDetailVO;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartController {
	@Autowired
	CartService cartService;
	@Autowired
	CartVO cartVO;
	
	@RequestMapping(value="/addcart.do" ,method=RequestMethod.POST)
	public ResponseEntity addcart(@ModelAttribute("cartvo") CartVO vo,@RequestParam("result") String result,
									@RequestParam("code") int code, @RequestParam("col") String col) {
		
		ResponseEntity resEtn = null;
		if(col.equals("member"))
			vo.setCart_member_code(code);
		else if(col.equals("nonmember"))
			vo.setCart_nonmember_code(code);
		
		if(result.equals("false")) 
			cartService.AddOverlapCart(vo);
		else
			cartService.addcart(vo);
		resEtn = new ResponseEntity(HttpStatus.OK);
		
		return resEtn;
	}
	
	@RequestMapping(value="/cartlist_total_order_price.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView TotalOrder_Price(HttpServletRequest request) {
		int total_order_price = Integer.parseInt(request.getParameter("total_order_price"));
		ModelAndView mav = new ModelAndView();
		System.out.println(total_order_price);
		mav.setViewName("/cart/cartlist");
		mav.addObject("totalprice" , total_order_price);
		return mav;
	}
	
	@RequestMapping(value="/cartlist.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView CartList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		
		String viewName = (String)request.getAttribute("viewName");
		
		Map<String, Object> map = new HashMap<String, Object>();
		if((Boolean)session.getAttribute("isLogOn") != null) {
			MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
			map.put("table", "member");
			map.put("code", vo.getMember_code());
		}else if((Boolean)session.getAttribute("NonisLogOn") != null) {
			System.out.println("nonmember");
			NonMemberVO vo = (NonMemberVO)session.getAttribute("nonmemberInfo");
			map.put("table", "nonmember");
			map.put("code", vo.getNonmember_code());
		}else {
			viewName = "redirect:/member/memberlogin";
		}
		
	
		List<CartVO> list = new ArrayList<CartVO>(); 
		list = cartService.CartList(map);
		int totalprice = 0;
		ModelAndView mav = new ModelAndView();
		
		
		
		ColorSizeOverlap cs = new ColorSizeOverlap();
		
		Map<String , Object> [] csmap = new HashMap[list.size()];
		List<ProductDetailVO> [] detail_list = new List[list.size()];
		
		for(int i = 0 ; i < list.size(); i ++) {
			detail_list [i] = cartService.getOptions(list.get(i).getCart_pro_code());
			csmap[i] = cs.colorandsize(detail_list[i]);
			list.get(i).setColor_list((List)csmap[i].get("color"));
			list.get(i).setSize_list((List)csmap[i].get("size"));
		}
		
		mav.setViewName(viewName);
		if(list.size() != 0) {
			mav.addObject("cartlist" , list);
			totalprice = cartService.TotalPrice(map);
			mav.addObject("totalprice",totalprice);
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="/cart_overlap.do" , method=RequestMethod.POST)
	public ResponseEntity Cart_Overlap(@RequestParam("pro_detail_code") int pro_detail_code ,
										@RequestParam("col") String col,
										@RequestParam("code") int code) {
		ResponseEntity resEtn = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pro_detail_code", pro_detail_code);
		map.put("col", col);
		map.put("code", code);
		String result = cartService.Cart_Overlap(map);
		
		resEtn = new ResponseEntity(result , HttpStatus.OK);
		return resEtn;
	}
	
	@RequestMapping(value="/UpdateCart.do" , method=RequestMethod.POST)
	public ResponseEntity UpdateCart(@RequestParam(value = "quantity" , required = false) int quantity,
								   @RequestParam(value = "pro_detail_code" , required = false) int pro_detail_code,
								   HttpServletRequest request) {
		HttpSession session = request.getSession();
		
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
		map.put("quantity", quantity);
		map.put("pro_detail_code", pro_detail_code);
		map.put("origin_pro_detail_code", pro_detail_code);
		map.put("action", "");
		cartService.UpdateCart(map);
		
		ResponseEntity resEtn = new ResponseEntity(HttpStatus.OK);
		
		return resEtn;
	}
	
	@RequestMapping(value="/DeleteCart.do" , method=RequestMethod.POST)
	public ResponseEntity DeleteCart(@RequestParam("pro_detail_code_list") ArrayList<Integer> pro_detail_code_list,
									HttpServletRequest request) {
		
		ResponseEntity resEtn = null;
		
		HttpSession session = request.getSession();
		
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
		
		map.put("pro_detail_code_list", pro_detail_code_list);
		cartService.DeleteCart(map);
		
		resEtn = new ResponseEntity(HttpStatus.OK);
		
		return resEtn;
	}
	
	@RequestMapping(value="/cartOptionupdateForm.do",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView OptionUpdateForm(@ModelAttribute("product_image") ImageFileVO imgvo,
									@RequestParam("pro_detail_code") int pro_detail_code,
									@RequestParam("pro_quantity") int pro_quantity,
									HttpServletRequest request) {
		
		System.out.println("pro_detail_code : " + pro_detail_code);
		System.out.println("pro_quantity : " + pro_quantity);
		ModelAndView mav = new ModelAndView();
		
		List<ProductDetailVO> detailvo = cartService.getOptions(imgvo.getPro_code());
		
		ColorSizeOverlap cs = new ColorSizeOverlap();
		Map<String,Object> csmap = new HashMap<String, Object>();
		
		csmap = cs.colorandsize(detailvo);
		
		System.out.println(csmap);
		
		
		mav.addObject("color" , csmap.get("color"));
		mav.addObject("size" , csmap.get("size"));
		mav.addObject("img",imgvo);
		mav.addObject("pro_detail_code" , pro_detail_code);
		mav.addObject("pro_quantity",pro_quantity);
		mav.setViewName("/cart/cartlist");
		return mav;
	}
	@RequestMapping(value="/cartOptionUpdate.do", method=RequestMethod.POST)
	public ResponseEntity OptionUpdate(HttpServletRequest request,
							@RequestParam("col") String col , @RequestParam("code") int code,
							@RequestParam("action") String action,@RequestParam("pro_code") int pro_code,
							@RequestParam("pro_detail_code") int pro_detail_code,@RequestParam("result") Boolean result,
							@RequestParam("color") String color ,@RequestParam("size") String size,
							@RequestParam("origin_pro_detail_code") int origin_pro_detail_code,
							@RequestParam("price") int price , @RequestParam("pro_quantity") int pro_quantity
							) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pro_code", pro_code);
		map.put("code", code);
		map.put("pro_detail_code", pro_detail_code);
		map.put("origin_pro_detail_code", origin_pro_detail_code);
		map.put("color", color);
		map.put("size", size);
		map.put("col", col);
		map.put("action", action);
		map.put("price"	, price);
		map.put("quantity", pro_quantity);
		try {
			
			if(action.equals("추가")) {
				if(result) {
					map.put("quantity", 1);
					CartVO vo = cartService.SetCartService(map);
					cartService.addcart(vo);
				}else if (!result) {
					map.put("quantity" , cartService.ChangeTarget_QuantityCheck(map));
					cartService.UpdateCart(map);
				}
			}else if (action.equals("변경")) {
				if(result) {
					cartService.allUpdateCart(map);
				}else if (!result) {
					List<Integer> list = new ArrayList<Integer>();
					list.add(origin_pro_detail_code);
					map.put("pro_detail_code_list", list);
					cartService.DeleteCart(map);
					int target_quantity = cartService.ChangeTarget_QuantityCheck(map) - 1;
					map.put("quantity", pro_quantity + target_quantity);
					map.put("origin_pro_detail_code", pro_detail_code);
					cartService.UpdateCart(map);
				}
			}
		}catch(Exception e) {
			System.out.println("Error!!");
		}
		ResponseEntity resEtn = new ResponseEntity(HttpStatus.OK);
		
		return resEtn;
	}
	
	@ResponseBody
	@RequestMapping(value="/getPro_Detail_code.do" , method=RequestMethod.POST)
	public String getPro_detail_code(@RequestParam("pro_code") int pro_code,
								@RequestParam("color")String color,
								@RequestParam("size") String size) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pro_code", pro_code);
		map.put("pro_color", color);
		map.put("pro_size", size);
		
		String pro_detail_code = cartService.get_Pro_Detail_Code(map);
		
		return pro_detail_code;
	}
	
	
}
