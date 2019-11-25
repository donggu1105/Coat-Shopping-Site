package com.my.spring.notice.qna.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.notice.qna.dao.QnADao;
import com.my.spring.notice.qna.pagevo.PageVO;
import com.my.spring.notice.qna.service.QnAService;
import com.my.spring.notice.qna.vo.QnAVO;

import net.coobird.thumbnailator.Thumbnails;

@Controller("QnaController")
@RequestMapping("/notice/qna")
public class QController {
	private static final String CURR_IMAGE_REPO_PATH="C:\\codename\\file_repo";
	private static final String CURR_NOTICE_QNA_REPO_PATH="C:\\codename\\notice\\qna";
	
	@Autowired
	QnADao qnaDao;
	
	@Autowired
	QnAVO qnaVo;
	
	@Autowired
	QnAService qnaService;
	
	@RequestMapping(value="/list.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listview(HttpServletRequest request , PageVO vo) {
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		
		//total페이지 수
		int total=qnaService.selectBoardCount();
		
		String qPage=request.getParameter("page");
		if(qPage==null) {
			qPage="1";
		}
		int page=Integer.parseInt(qPage);
		
		vo.setPage(page);
		vo.pageCalculate(total);
		
		int displayRowCount = vo.getDisplayRowCount();
		int rowStart=vo.getRowStart();
		int rowEnd=vo.getRowEnd();
		int totPage = vo.getTotPage();
		int totRow = vo.getTotRow();
		int pageing = vo.getPage();
		int pageStart = vo.getPageStart();
		int pageEnd = vo.getPageEnd();
		
		Map<String, Object> listmap = new HashMap<String, Object>();
		listmap.put("displayRowCount", displayRowCount);
		listmap.put("rowStart", rowStart);
		listmap.put("rowEnd", rowEnd);
		listmap.put("totPage", totPage);
		listmap.put("totRow", totRow);
		listmap.put("page", pageing);
		listmap.put("pageStart", pageStart);
		listmap.put("pageEnd", pageEnd);
		listmap.put("total", total);
		List<QnAVO> listview = qnaService.qnalist(pageing , displayRowCount);
		listmap.put("listview", listview);

		mav.addObject("listmap" , listmap);
		mav.addObject("list",listview);
		
		mav.setViewName(viewName);

		return mav;
	}

	@RequestMapping("/content_view.do")
	public ModelAndView content_view(HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("content_view.do");
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		String q_index = (String)request.getParameter("q_index");
		String q_file = request.getParameter("q_file");
		Map<String, Object> content_viewmap = new HashMap<String, Object>();
		
		//상세보기
		Object content_view = qnaService.content_view(q_index);
		content_viewmap.put("content_view", content_view);
		
		//조회수
		int hit = qnaService.hit(q_index);
		content_viewmap.put("hit", hit);
	
		System.out.println("q_file : "+q_file);
		
		mav.addObject("content_viewmap",content_viewmap);
		
		mav.setViewName(viewName);

		return mav;
	}

	@RequestMapping(value="/write_view.do" , method = RequestMethod.GET)
	public ModelAndView write_view(HttpServletRequest request) {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/write.do" , method = RequestMethod.POST , headers = ("content-type=multipart/*"))
	public ResponseEntity wrtie_(MultipartHttpServletRequest multirequest , HttpServletResponse response) throws Exception {
		System.out.println("write.do");
		
		ModelAndView mav = new ModelAndView();
			
			Enumeration enu=multirequest.getParameterNames();
			System.out.println("test");
//			------------------------------------------------------
			
			Map writeMap=new HashMap();
			
			String q_title = multirequest.getParameter("q_title");
			String q_option = multirequest.getParameter("q_option");
			String member_id = multirequest.getParameter("member_id");
			String q_content = multirequest.getParameter("q_content");
			
			writeMap.put("q_title", q_title);
			writeMap.put("q_option", q_option);
			writeMap.put("member_id", member_id);
			writeMap.put("q_content", q_content);
			
			System.out.println("q_title ---------------------: "+q_title);
			System.out.println("q_option -----------------: "+q_option);
			System.out.println("member_id -------------: "+member_id);
			System.out.println("q_content ---------------: "+q_content);
			
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
			List<QnAVO> imageFileList = upload(multirequest);
			
			for (QnAVO qnaVO : imageFileList) {
				String imageFileName=qnaVO.getQ_file();
				writeMap.put("q_file", imageFileName);
			}
			
			if (imageFileList != null && imageFileList.size() != 0) { // null check
				writeMap.put("imageFileList", imageFileList);
			}

			try {

				int q_index = qnaService.write(writeMap); // service로가서 글을쓴다

				if (imageFileList != null && imageFileList.size() != 0) { // image null check
					for (QnAVO imageFileVO : imageFileList) {
						String imageFileName = imageFileVO.getQ_file(); // 파일이름
						File srcFile = new File(CURR_NOTICE_QNA_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);// 소스객체생성
						File destDir = new File(CURR_NOTICE_QNA_REPO_PATH + "\\" + q_index); // 폴더만듬
						FileUtils.moveFileToDirectory(srcFile, destDir, true); // 파일을 해당 review_num으로 옮김
					}
				}
				
				message = "<script> ";
				message += " alert('질문 작성이 완료되었습니다.');";
				message += " location.href='" + multirequest.getContextPath() + "/notice/qna/list.do';";
				message += " </script>";

			} catch (Exception e) {
				e.printStackTrace();
				if (imageFileList != null && imageFileList.size() != 0) {// null check
					for (QnAVO imageFileVO : imageFileList) {
						String imageFileName = imageFileVO.getQ_file();
						File srcFile = new File(CURR_NOTICE_QNA_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
						srcFile.delete();
					}
				}
				message = "<script> ";
				message += " alert('질문 작성중 오류가 발생했습니다.');";
				message += " location.href='" + multirequest.getContextPath() + "/notice/qna/list.do';";
				message += " </script>";
				
			}
		
			
			resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			
			
//		mav.setViewName("redirect:/notice/qna/list.do");
		
		return resEntity;
	}
	
	public List<QnAVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception {//이미지 업로드
		List<QnAVO> fileList = new ArrayList<QnAVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames(); // enumeration
		while (fileNames.hasNext()) {
			QnAVO qnaVO = new QnAVO();
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			qnaVO.setQ_file(originalFileName);
			fileList.add(qnaVO);

			File file = new File(CURR_NOTICE_QNA_REPO_PATH + "\\" + fileName); // 파일이름으로 객체생성
			if (mFile.getSize() != 0) { // File Null Check
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) { // 폴더생성
						file.createNewFile(); // 파일생성
					}
				}
				mFile.transferTo(new File(CURR_NOTICE_QNA_REPO_PATH + "\\" + "temp" + "\\" + originalFileName)); 
			}
		}
		return fileList;
	}
	
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam(value="fileName", required=false) String fileName,
			  @RequestParam(value="pro_code", required=false)String pro_code,
			  @RequestParam(value="review_num", required=false)String review_num,
			  @RequestParam(value="q_index", required=false)String q_index,
			  HttpServletResponse response) throws IOException{
		OutputStream out=response.getOutputStream();
		System.out.println("fileName"+fileName);
		System.out.println("q_index"+q_index);
		String filePath;
		   if(pro_code !=null && !pro_code.equals("")) {
		         filePath=CURR_IMAGE_REPO_PATH+"\\"+pro_code+"\\"+fileName;
		         
		      }else if(review_num !=null && !review_num.equals("")){
		         filePath=CURR_NOTICE_QNA_REPO_PATH+"\\"+review_num+"\\"+fileName;
		      }else{
		         filePath=CURR_NOTICE_QNA_REPO_PATH+"\\"+q_index+"\\"+fileName;
		      }
		
		File image=new File(filePath);
		
		int lastIndex=fileName.lastIndexOf("."); //�ڿ��� .���� ������
		String imageFileName=fileName.substring(0,lastIndex); //Ȯ���� ������ �����̸��� ��������
		
		if(pro_code != null && !pro_code.equals("")) {
			if(image.exists()) {
				Thumbnails.of(image).size(666, 999).outputFormat("png").toOutputStream(out);
			}
		}else {
			Thumbnails.of(image).size(666, 999).outputFormat("jpg").toOutputStream(out);
		}
		byte[] buffer =new byte[1024*8];
		out.write(buffer);
		out.close();
	  }
	
	@RequestMapping(value = "/modify.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView modify_view(HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("modify.do");
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		String q_index = (String)request.getParameter("q_index");
		Map<String, Object> modifymap = new HashMap<String, Object>();
		String fileName = (String)request.getParameter("q_index");
		modifymap.put("fileName", fileName);
		
		String q_title = request.getParameter("q_title");
		String q_option = request.getParameter("q_option");
		String q_content = request.getParameter("q_content");
		String q_file = request.getParameter("q_file");
		
		modifymap.put("q_title", q_title);
		modifymap.put("q_option", q_option);
		modifymap.put("q_content", q_content);
		modifymap.put("q_file", q_file);
		
//		System.out.println("q_index : "+q_index);
//		System.out.println("q_title : "+q_title);
//		System.out.println("q_option : "+q_option);
//		System.out.println("q_content : "+q_content);
//		System.out.println("q_file : "+q_file);
		
		
		Object modify_view = qnaService.content_view(q_index);
		modifymap.put("modify_view", modify_view);
		
		mav.addObject("modifymap",modifymap);
		
		return mav;
	}
	
	@RequestMapping(value="/modify_view.do" , method = {RequestMethod.POST , RequestMethod.GET})
	public ResponseEntity modify_view(HttpServletResponse response , 
			MultipartHttpServletRequest multirequest,
			HttpServletRequest request) throws Exception {
		
		System.out.println("modify_view.do");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		
		Enumeration enu = multirequest.getParameterNames(); // 배열에 파라미터네임들 가져옴
		Map<String , Object> modifyviewMap = new HashMap<String , Object>();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = (String) multirequest.getParameter(name);
			modifyviewMap.put(name, value);
			System.out.println("name :"+name+"value : "+value);
		}
		
		String q_index=multirequest.getParameter("q_index");
		List<QnAVO> imageFileList = upload(multirequest);
		
		for (QnAVO qnaVO : imageFileList) {
			String imageFileName=qnaVO.getQ_file();
			modifyviewMap.put("q_file", imageFileName);
			System.out.println("###3q_file : "+imageFileName);
		}
		
		if (imageFileList != null && imageFileList.size() != 0) { // null check
			modifyviewMap.put("imageFileList", imageFileList);
		}

		try {
			

			if (imageFileList != null && imageFileList.size() != 0) { // image null check
				for (QnAVO imageFileVO : imageFileList) {
					String originalFileName = (String) modifyviewMap.get("originalFileName");
					File oldFile = new File(CURR_NOTICE_QNA_REPO_PATH + "\\" + q_index+"\\"+originalFileName);
					oldFile.delete();
					
					String imageFileName = imageFileVO.getQ_file(); // 파일이름
					File srcFile = new File(CURR_NOTICE_QNA_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);// 소스객체생성
					File destDir = new File(CURR_NOTICE_QNA_REPO_PATH + "\\" + q_index); // 폴더만듬
					FileUtils.moveFileToDirectory(srcFile, destDir, true); // 파일을 해당 review_num으로 옮김
					
					System.out.println("originalFileName : "+originalFileName);
					
				}
				qnaService.modify(modifyviewMap);
			}
			
			message = "<script> ";
			message += " alert('성공적으로 수정되었습니다.');";
			message += " location.href='" + multirequest.getContextPath() + "/notice/qna/list.do';";
			message += " </script>";

		} catch (Exception e) {
			e.printStackTrace();
			if (imageFileList != null && imageFileList.size() != 0) {// null check
				for (QnAVO imageFileVO : imageFileList) {
					String imageFileName = imageFileVO.getQ_file();
					File srcFile = new File(CURR_NOTICE_QNA_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			message = "<script> ";
			message += " alert('질문 수정중 오류가 발생했습니다.');";
			message += " location.href='" + multirequest.getContextPath() + "/notice/qna/list.do';";
			message += " </script>";
		}
		
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/delete.do" , method= {RequestMethod.POST , RequestMethod.GET})
	public ModelAndView delete(
			@RequestParam(value="q_index" , required=false) String q_index,
			@RequestParam(value="q_group" , required=false) String q_group,
			@RequestParam(value="q_step" , required=false) String q_step,
			@RequestParam(value="q_indent" , required=false) String q_indent,
			HttpServletRequest request , HttpServletResponse response) throws Exception {
		System.out.println("delete.do");
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> deletemap = new HashMap<String, Object>();
		
		deletemap.put("q_group", Integer.parseInt(q_group));
		deletemap.put("q_step", Integer.parseInt(q_step));
		deletemap.put("q_indent", Integer.parseInt(q_indent));
		
		System.out.println("q_index : "+q_index);
		System.out.println("q_group : "+q_group);
		System.out.println("q_step : "+q_step);
		System.out.println("q_indent : "+q_indent);
		
		qnaService.delete(deletemap);
		
		File destDir=new File(CURR_NOTICE_QNA_REPO_PATH+"\\"+q_index);
		FileUtils.deleteDirectory(destDir);
		
		mav.setViewName("redirect:/notice/qna/list.do");
		
		return mav;
	}
	
	@RequestMapping(value="/replay.do"  , method = {RequestMethod.POST , RequestMethod.GET})
	public ModelAndView replay(HttpServletRequest request) {
		
		System.out.println("replay.do");
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> reply_map = new HashMap<String, Object>();
		
		String q_index = request.getParameter("q_index");
		String q_title = request.getParameter("q_title");
		String q_option = request.getParameter("q_option");
		String member_id = request.getParameter("member_id");
		String q_content = request.getParameter("q_content");
		String q_group = request.getParameter("q_group");
		String q_step = request.getParameter("q_step");
		String q_indent = request.getParameter("q_indent");
		
		reply_map.put("q_index", q_index);
		reply_map.put("q_title", q_title);
		reply_map.put("q_option", q_option);
		reply_map.put("member_id", member_id);
		reply_map.put("q_content", q_content);
		reply_map.put("q_group", q_group);
		reply_map.put("q_step", q_step);
		reply_map.put("q_indent", q_indent);
		
		System.out.println("q_index : "+q_index);
		System.out.println("q_title : "+q_title);
		System.out.println("q_option : "+q_option);
		System.out.println("member_id : "+member_id);
		System.out.println("q_content : "+q_content);
		System.out.println("q_group : "+q_group);
		System.out.println("q_step : "+q_step);
		System.out.println("q_indent : "+q_indent);
		
		qnaService.reply(reply_map);
		int replyshape = qnaService.reply_Shape(q_group, q_step);
		
		reply_map.put("replyshape", replyshape);
		
		
		mav.setViewName("redirect:/notice/qna/list.do");

		return mav;
	}
	
	@RequestMapping(value="/replay_view.do" , method = {RequestMethod.POST , RequestMethod.GET})
	public ModelAndView replay_view(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		
		System.out.println("replay_view.do");
		
		String q_index = (String)request.getParameter("q_index");
		Map<String, Object> replay_viewmap = new HashMap<String, Object>();
		
		String q_title = request.getParameter("q_title");
//		String q_option = request.getParameter("q_option");
//		String member_id = request.getParameter("member_id");
//		String q_content = request.getParameter("q_content");
//		String q_group = request.getParameter("q_group");
//		String q_step = request.getParameter("q_step");
//		String q_indent = request.getParameter("q_indent");
		
		System.out.println("q_index : "+q_index);
//		System.out.println("q_title : "+q_title);
//		System.out.println("q_option : "+q_option);
//		System.out.println("member_id : "+member_id);
//		System.out.println("q_content : "+q_content);
//		System.out.println("q_group : "+q_group);
//		System.out.println("q_step : "+q_step);
//		System.out.println("q_indent : "+q_indent);
		
		Object replayView = qnaService.reply_view(q_index);
		replay_viewmap.put("replayView", replayView);
		
		mav.addObject("replay_viewmap" , replay_viewmap);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
}
