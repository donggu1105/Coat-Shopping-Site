package com.my.spring.admin.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.admin.product.service.AdminProductService;
import com.my.spring.member.vo.MemberVO;
import com.my.spring.product.vo.ImageFileVO;

@Controller("adminProductController")
@RequestMapping("/admin/product")
public class AdminProductController {
		private static final String CURR_IMAGE_REPO_PATH="C:\\codename\\file_repo";
	
	@Autowired
	AdminProductService adminProductService;
	

	@RequestMapping(value="/listProducts.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addNewProductMain(@RequestParam(value="total", required=false) String total,
										  @RequestParam(value="direct_pro_status", required=false) String direct_pro_status, //������ ��ǰ���м��ڴ�������
										  @RequestParam(value="pro_name", required=false) String keyword,//Ű���尪���� �˻��� ��������
										  @RequestParam(value="pro_status", required=false) String pro_status, //��ǰ����
										  @RequestParam(value="pro_category", required=false) String pro_category, //��з�
										  @RequestParam(value="order_price", required=false) String order_price,//�ߺз�
										  @RequestParam(value="order_salesRate", required=false) String order_salesRate,//�Һз�
										  @RequestParam(value="order_count", required=false) String order_count,//�󼼺з�
			HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		if(session.getAttribute("side_menu") !=null){
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_product");
		
		System.out.println("keyword :"+keyword);
		System.out.println("pro_status :"+pro_status);
		System.out.println("pro_category :"+pro_category);
		System.out.println("order_price :"+order_price);
		System.out.println("order_salesRate :"+order_salesRate);
		System.out.println("order_count :"+order_count);
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView();
		Map<String,Object> pagingMap=new HashMap(); //����¡ó���� �ʻ���
		Map<String,Object> productsMap=new HashMap(); //jsp�ܿ� �ѷ��� �ʻ���
		String _section=(String)request.getParameter("section"); //���ǰ� ��������
		String _pageNum=(String)request.getParameter("pageNum"); //������ �ѹ��� ��������
		
		int section=Integer.parseInt(((_section==null) ?"1" : _section)); //���ǳѹ� int��ȯ
		int pageNum=Integer.parseInt(((_pageNum==null) ?"1" : _pageNum)); //����¡�ѹ� int��ȯ
		
		//pagingMap�� value�� �����ϱ�
		pagingMap.put("section", section);  //����¡�ʿ� ���ǰ� ����
		pagingMap.put("pageNum", pageNum); //����¡�ʿ� ���̳ѹ��� ���� 
		pagingMap.put("total", total); //����¡�ʿ� ���̳ѹ��� ���� 
		pagingMap.put("direct_pro_status", direct_pro_status); //����¡�ʿ� ���̳ѹ��� ���� 
		pagingMap.put("keyword", keyword); //������ư ��ǰ���а� �ֱ�
		pagingMap.put("pro_status", pro_status); //������ư ��ǰ���а� �ֱ�
		pagingMap.put("pro_category", pro_category); //������ư ��ǰ���а� �ֱ�
		pagingMap.put("order_price", order_price); //������ư ��ǰ���а� �ֱ�
		pagingMap.put("order_salesRate", order_salesRate); //������ư ��ǰ���а� �ֱ�
		pagingMap.put("order_count", order_count); //������ư ��ǰ���а� �ֱ�
		
		productsMap=adminProductService.listProducts(pagingMap);//pagingMap�����ָ鼭 product����Ʈ �̾ƿ���
		
		productsMap.put("section", section); //�ٽ� ���������� ���ǰ�
		productsMap.put("pageNum", pageNum); 
		productsMap.put("keyword", keyword); 
		productsMap.put("pro_category", pro_category); 
		productsMap.put("order_price", order_price); 
		productsMap.put("order_salesRate", order_salesRate); 
		productsMap.put("order_count", order_count); 
		productsMap.put("pro_status", pro_status); 
		productsMap.put("direct_pro_status", direct_pro_status); 
		
		System.out.println("section :"+section );
		System.out.println("pageNum :"+pageNum );
		System.out.println("keyword :"+keyword );
		System.out.println("pro_category :"+pro_category );
		System.out.println("order_price :"+order_price );
		System.out.println("order_salesRate :"+order_salesRate );
		System.out.println("order_count :"+order_count );
		System.out.println("pro_status :"+pro_status );
		System.out.println("direct_pro_status :"+direct_pro_status );
		
		mav.addObject("productsMap",productsMap);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	@RequestMapping(value="/addNewProduct.do", method=RequestMethod.POST)
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName=null;
		Map<String,Object> newProductMap=new HashMap();
		
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			newProductMap.put(name, value);
		}
		
		HttpSession session=multipartRequest.getSession();
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
 		String register=memberVO.getMember_id();
 		
 		List<ImageFileVO> imageFileList=upload(multipartRequest);
		if(imageFileList !=null && imageFileList.size() !=0) { //null check
			for(ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setPro_register(register); 
			}
			newProductMap.put("imageFileList", imageFileList);
		}
		String message=null;
		ResponseEntity resEntity=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int pro_code=adminProductService.addNewProduct(newProductMap); 
			if(imageFileList !=null && imageFileList.size() !=0) {
				for(ImageFileVO imageFileVO : imageFileList) {
				imageFileName=imageFileVO.getPro_imageFileName();
				File srcFile=new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);//temp�� �̹��� �ӽ�����
				File destDir=new File(CURR_IMAGE_REPO_PATH+"\\"+pro_code); //�ش��ǰ��ȣ ��������� (�����Ұ�)
				FileUtils.moveFileToDirectory(srcFile, destDir, true); //�� �ش��ǰ��ȣ ������ �̹����ű��
				}
			}
			message="<script> ";
			message+=" alert('새상품이 등록외었습니다.');";
			message+=" location.href='"+multipartRequest.getContextPath()+"/admin/product/addNewProductForm.do';";
			message+=" </script>";
			
		}catch(Exception e) {
			e.printStackTrace();
			if(imageFileList !=null && imageFileList.size() !=0) {
				for(ImageFileVO imageFileVO : imageFileList) {
					imageFileName=imageFileVO.getPro_imageFileName();
					File srcFile=new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			message="<script> ";
			message+=" alert('새상품 들록 실패');";
			message+=" location.href='"+multipartRequest.getContextPath()+"/admin/product/addNewProductForm.do';";
			message+=" </script>";
		}
		resEntity=new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		
		return resEntity;
	}
	@RequestMapping(value="/addNewModel.do", method= RequestMethod.POST)
	public ResponseEntity addNewModel(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String,Object> productDetailMap=new HashMap();
		Enumeration enu=request.getParameterNames();
		while(enu.hasMoreElements()) {
			String name=(String)enu.nextElement();
			String value=request.getParameter(name);
			productDetailMap.put(name, value);
		}
		adminProductService.addNewModel(productDetailMap);
		
		String message=null;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		message="<script> ";
		message+=" alert('�� ���� �߰��Ͽ����ϴ�.');";
		message+=" self.close();";
		message+=" </script>";
		
		resEnt=new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		
		return resEnt;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteProducts.do", method= RequestMethod.POST)
	public ResponseEntity deleteProducts(String[] _delete_val,
									HttpServletRequest request, HttpServletResponse response) {
		
		
		ArrayList<String> deleteList=new ArrayList<String>();
		for(String value : _delete_val) { //������ ��ǰ�ڵ� �̱�
			System.out.println(value);
			deleteList.add(value);
		}
		String message=null;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		Map<String,Object> deleteMap=new HashMap();
		deleteMap.put("deleteList", deleteList);
		try {
			adminProductService.deleteProducts(deleteMap);
			for(int i=0; i<deleteList.size(); i++) {
				File destDir=new File(CURR_IMAGE_REPO_PATH+"\\"+deleteList.get(i).toString());
				FileUtils.deleteDirectory(destDir);
			}
			message="<script> ";
			message+=" alert('��ǰ�� �����߽��ϴ�.');";
			message+=" location.href='"+request.getContextPath()+"/admin/product/listProducts.do'; ";
			message+=" </script>";
			resEnt=new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		}catch(Exception e) {
			
			message="<script> ";
			message+=" alert('�۾��� ������ �߻��߽��ϴ�.');";
			message+=" location.href='"+request.getContextPath()+"/admin/product/listProducts.do'; ";
			message+=" </script>";
			resEnt=new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@RequestMapping(value="/addNewModelForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addNewModelForm(@RequestParam(value="pro_code") String pro_code,
			  @RequestParam(value="pro_category") String pro_category,
			  HttpServletRequest request, HttpServletResponse response) {
		
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView();
		mav.addObject("pro_code",pro_code);
		mav.addObject("pro_category",pro_category);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/addNewProductForm.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView addNewProductForm(
			HttpServletResponse response, HttpServletRequest request) {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView();
		
	
		mav.setViewName(viewName);
		return mav;
	}
	public List<ImageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<ImageFileVO> fileList= new ArrayList<ImageFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			ImageFileVO imageFileVO =new ImageFileVO();
			String fileName = fileNames.next();
			imageFileVO.setPro_imageFileType(fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			imageFileVO.setPro_imageFileName(originalFileName);
			fileList.add(imageFileVO);
			
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ //��λ� ������ �������� ���� ���
					if(file.getParentFile().mkdirs()){ //��ο� �ش��ϴ� ���丮���� ����
							file.createNewFile(); //���� ���� ����
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+"temp"+ "\\"+originalFileName)); //�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ����
			}
		}
		return fileList;
	}
	
	@RequestMapping(value="/listOutOfStock.do" , method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView searchMember (HttpServletRequest request, HttpServletResponse response) {
		
		
	ModelAndView mav=new ModelAndView();
	String viewName=(String)request.getAttribute("viewName");
	
	
	
	mav.setViewName(viewName);
	return mav;		
	
	
}
	@RequestMapping(value="/productStatics.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView productStatics (HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		
		Map<String,Object> viewMap=adminProductService.getProductStatics();
		
		mav.addObject("viewMap",viewMap);
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
}
