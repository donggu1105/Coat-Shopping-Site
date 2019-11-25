package com.my.spring.notice.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.spring.member.vo.MemberVO;
import com.my.spring.notice.qna.pagevo.PageVO;
import com.my.spring.notice.qna.service.QnAService;
import com.my.spring.notice.review.service.ReviewService;
import com.my.spring.notice.review.vo.ReviewVO;
import com.my.spring.notice.review.vo.Review_ImageVO;
import com.my.spring.notice.review.vo.Review_ReplyVO;
import com.my.spring.product.vo.ImageFileVO;
import com.my.spring.product.vo.ProductVO;

@Controller("reviewController")
@RequestMapping("/notice/review")
public class ReviewController {
	private static final String CURR_NOTICE_REVIEW_REPO_PATH = "C:\\codename\\notice\\review";

	@Autowired
	ReviewService reviewService;

	@Autowired
	Review_ImageVO review_ImageVO;

	@Autowired
	ReviewVO reviewVO;
	
	@Autowired
	Review_ReplyVO review_ReplyVO;
	
	@Autowired
	ProductVO productVO;
	
	@Autowired
	QnAService qnaService;
	
	
	@RequestMapping("/list.do")//리뷰 목록
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		Map listMap = new HashMap();
		Map pagingMap=new HashMap();
		
		String _section=(String)request.getParameter("section"); 
		String _pageNum=(String)request.getParameter("pageNum");
		
		int section=Integer.parseInt(((_section==null) ?"1" : _section)); 
		int pageNum=Integer.parseInt(((_pageNum==null) ?"1" : _pageNum));
		
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		
		listMap=reviewService.listReview(pagingMap);

		listMap.put("section", section); 
		listMap.put("pageNum", pageNum); 
		
		mav.addObject("listMap",listMap);

		mav.setViewName(viewName);
		return mav;

	}

	@RequestMapping("/contentView.do")//리뷰 상세
	public ModelAndView contentView(HttpServletRequest request, HttpServletResponse response){

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		String review_num=(String)request.getParameter("review_num");
		Map contentViewMap = new HashMap();
		
		//리뷰 상세 뽑기
		Object contentView = reviewService.content(review_num);
		contentViewMap.put("contentView", contentView);
		
		//조회수 올리기
		int hitup=reviewService.hit(review_num);
		contentViewMap.put("hitup", hitup);
		
		//이미지 찾기
		String fileName=reviewService.imageFileName(review_num);
		contentViewMap.put("fileName", fileName);
		
		System.out.println("파일네임 아아아아ㅏ"+fileName);
		
//		List<Object> fileName=reviewService.imageFileName(review_num);
//		contentViewMap.put("fileName", fileName);
		
		//리뷰 작성했을때 리뷰 목록 업데이트
		Map replyViewMap = new HashMap();
		Map pagingMap=new HashMap();
		
		int totReCount=reviewService.selectReplyCount(review_num);
		
		pagingMap.put("review_num", review_num);
		
		String _section=(String)request.getParameter("section"); 
		String _pageNum=(String)request.getParameter("pageNum");
		String action=(String)request.getParameter("action");
		
		int section=Integer.parseInt(((_section==null) ?"1" : _section)); 
		int pageNum=Integer.parseInt(((_pageNum==null) ?"1" : _pageNum));
		action=((action ==null)? "review_num" : action);
		
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("action", action);
		
		replyViewMap=reviewService.replylist(pagingMap);

		replyViewMap.put("section", section); 
		replyViewMap.put("pageNum", pageNum); 
		replyViewMap.put("action", action);

		replyViewMap.put("totReCount", totReCount);
		mav.addObject("replyViewMap", replyViewMap);
		mav.addObject("contentViewMap", contentViewMap);

		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping("/write_view.do")//리뷰쓰는 창
	public ModelAndView write_view(HttpServletRequest request, HttpServletResponse response) {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		String pro_code = (String) request.getParameter("pro_code");
		String pro_name = (String) request.getParameter("pro_name");

		Map viewMap = new HashMap();

		viewMap.put("pro_code", pro_code);
		viewMap.put("pro_name", pro_name);

		mav.addObject("viewMap", viewMap);

		mav.setViewName(viewName);

		return mav;

	}

	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)//리뷰 쓰기 동작
	public ResponseEntity write(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		Enumeration enu = multipartRequest.getParameterNames(); // 배열에 파라미터네임들 가져옴
		Map writeMap = new HashMap();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = (String) multipartRequest.getParameter(name);

			System.out.println("name :" + name + " value :" + value +"   writttttttttttttt");
			writeMap.put(name, value);

		}
		
//		String review_content = multipartRequest.getParameter("review_content");
//		review_content=review_content.replace("\r\n","<br>");
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		List<Review_ImageVO> imageFileList = upload(multipartRequest);
		
		if (imageFileList != null && imageFileList.size() != 0) { // null check
			writeMap.put("imageFileList", imageFileList);
		}

		try {

			int review_num = reviewService.write(writeMap); // service로가서 글을쓴다

			if (imageFileList != null && imageFileList.size() != 0) { // image null check
				for (Review_ImageVO imageFileVO : imageFileList) {
					String imageFileName = imageFileVO.getReview_imageFileName(); // 파일이름
					File srcFile = new File(CURR_NOTICE_REVIEW_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);// 소스객체생성
					File destDir = new File(CURR_NOTICE_REVIEW_REPO_PATH + "\\" + review_num); // 폴더만듬
					FileUtils.moveFileToDirectory(srcFile, destDir, true); // 파일을 해당 review_num으로 옮김
				}
			}
			
			message = "<script> ";
			message += " alert('리뷰를 작성했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/notice/review/list.do';";
			message += " </script>";

		} catch (Exception e) {
			e.printStackTrace();
			if (imageFileList != null && imageFileList.size() != 0) {// null check
				for (Review_ImageVO imageFileVO : imageFileList) {
					String imageFileName = imageFileVO.getReview_imageFileName();
					File srcFile = new File(CURR_NOTICE_REVIEW_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			message = "<script> ";
			message += " alert('리뷰 작성중 오류가 발생했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/notice/review/buylist.do';";
			message += " </script>";
		}
	
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
		
	}


	public List<Review_ImageVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception {//이미지 업로드
		List<Review_ImageVO> fileList = new ArrayList<Review_ImageVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames(); // enumeration
		while (fileNames.hasNext()) {
			Review_ImageVO review_ImageVO = new Review_ImageVO();
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			review_ImageVO.setReview_imageFileName(originalFileName);
			fileList.add(review_ImageVO);
			
			File file = new File(CURR_NOTICE_REVIEW_REPO_PATH + "\\" + fileName); // 파일이름으로 객체생성
			if (mFile.getSize() != 0) { // File Null Check
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) { // 폴더생성
						file.createNewFile(); // 파일생성
					}
				}
				mFile.transferTo(new File(CURR_NOTICE_REVIEW_REPO_PATH + "\\" + "temp" + "\\" + originalFileName)); 
			}
			
		}
		return fileList;
	}

	
	@RequestMapping("/modify_view.do")//리뷰 수정창
	public ModelAndView modify_view(HttpServletRequest request, HttpServletResponse response) {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		Map modifyViewMap = new HashMap();
		
		String review_num=(String)request.getParameter("review_num");
		//contentView와 같이 사용 - imageFileName
		String fileName=reviewService.imageFileName(review_num);
		modifyViewMap.put("fileName", fileName);
		
		//contentView와 같이 사용 - content
		Object modifyView = reviewService.content(review_num);
		modifyViewMap.put("modifyView", modifyView);
		
		mav.addObject("modifyViewMap", modifyViewMap);

		return mav;

	}	

	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)//리뷰 수정 동작
	public ResponseEntity modify(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		Enumeration enu = multipartRequest.getParameterNames(); // 배열에 파라미터네임들 가져옴
		Map modifyMap = new HashMap();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = (String) multipartRequest.getParameter(name);
			modifyMap.put(name, value);
			System.out.println("name :"+name+"value : "+value);
		}
		
		String review_num=multipartRequest.getParameter("review_num");
		
		List<Review_ImageVO> imageFileList = upload(multipartRequest);
		
		if (imageFileList != null && imageFileList.size() != 0) { // null check
			modifyMap.put("imageFileList", imageFileList);
		}
		
		try {
			
			if (imageFileList != null && imageFileList.size() != 0) {// image null check
				
				for (Review_ImageVO imageFileVO : imageFileList) {
					String originalFileName = (String) modifyMap.get("originalFileName");
					File oldFile = new File(CURR_NOTICE_REVIEW_REPO_PATH + "\\" + review_num+"\\"+originalFileName);
					oldFile.delete();
					
					String imageFileName = imageFileVO.getReview_imageFileName(); // 파일이름
					File srcFile = new File(CURR_NOTICE_REVIEW_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);// 소스객체생성
					File destDir = new File(CURR_NOTICE_REVIEW_REPO_PATH + "\\" + review_num); // 폴더만듬
					FileUtils.moveFileToDirectory(srcFile, destDir, true); // 파일을 해당 review_num으로 옮김
					
					modifyMap.put("imageFileName", imageFileName);
					
				}
				reviewService.modify(modifyMap);
			}
			
			message = "<script> ";
			message += " alert('성공적으로 수정되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/notice/review/list.do';";
			message += " </script>";

		} catch (Exception e) {
			e.printStackTrace();
//			if (imageFileList != null && imageFileList.size() != 0) {// null check
//				for (Review_ImageVO imageFileVO : imageFileList) {
//					String imageFileName = imageFileVO.getReview_imageFileName();
//					File srcFile = new File(CURR_NOTICE_REVIEW_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
//					srcFile.delete();
//				}
//			}
			message = "<script> ";
			message += " alert('리뷰 수정중 오류가 발생했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/notice/review/list.do';";
			message += " </script>";
		}

	
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
		
	}
	
	@RequestMapping("/buylist.do")//구매목록(임시)
	public ModelAndView buylist(HttpServletRequest request, HttpServletResponse response) {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		Map buylistMap = new HashMap();
		List<ProductVO> buylist = reviewService.buylist(buylistMap);
		mav.addObject("buylist", buylist);

		mav.setViewName(viewName);

		return mav;

	}
	
	@RequestMapping(value="/deleteReview.do", method= {RequestMethod.POST, RequestMethod.GET })//리뷰 삭제
	public ModelAndView deleteReview(@RequestParam(value="review_num", required=false) String review_num,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		ModelAndView mav = new ModelAndView();
		//리뷰 삭제
		reviewService.deleteReview(review_num);
		//리뷰 이미지 삭제
			reviewService.deleteReviewImage(review_num);
				File destDir=new File(CURR_NOTICE_REVIEW_REPO_PATH+"\\"+review_num);
				FileUtils.deleteDirectory(destDir);
		

		mav.setViewName("redirect:/notice/review/list.do");

		return mav;

	}
	
	
	@RequestMapping(value = "/reply.do", method = RequestMethod.POST)//댓글 쓰기 동작
	public ModelAndView reply(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();

		Map replyMap = new HashMap();
		Enumeration enu = request.getParameterNames();
		String review_num=null; 
		
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement(); 
			String value = (String) request.getParameter(name);
			
			if (name.equals("review_num")) {
				review_num=(String) request.getParameter(name);
			}

			replyMap.put(name, value);

		}

		reviewService.reply(replyMap);
		reviewService.replyCount(review_num);

		mav.setViewName("redirect:/notice/review/contentView.do?review_num="+review_num);

		return mav;

	}
	
	@RequestMapping(value="/deleteReviewReply.do", method= {RequestMethod.POST, RequestMethod.GET })//댓글 삭제 동작
	public ModelAndView deleteReviewReply(@RequestParam(value="review_num", required=false) String review_num,
			@RequestParam(value="review_reply_code", required=false) String review_reply_code,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		reviewService.deleteReviewReply(review_reply_code);
		
		mav.setViewName("redirect:/notice/review/contentView.do?review_num="+review_num);

		return mav;

	}

	

}
