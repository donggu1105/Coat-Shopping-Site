package com.my.spring.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FIleDonwloadController {
	private static final String CURR_IMAGE_REPO_PATH="C:\\codename\\file_repo";
	private static final String CURR_NOTICE_REVIEW_REPO_PATH="C:\\codename\\notice\\review";
	private static final String CURR_NOTICE_QNA_REPO_PATH="C:\\codename\\notice\\qna";
	
	
		@RequestMapping("/download")
		protected void download(@RequestParam("fileName") String fileName,
								@RequestParam("pro_code") String pro_code,
								HttpServletResponse response) throws IOException {
			
			OutputStream out=response.getOutputStream();
			String filePath=CURR_IMAGE_REPO_PATH+"\\"+pro_code+"\\"+fileName; //占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占싹곤옙체占쏙옙占쏙옙
			File image=new File(filePath);
			
			response.setHeader("Cache-Control", "no-cache");
			response.addHeader("Content-disposition", "attachment; fileName="+fileName);
			
			FileInputStream in=new FileInputStream(image);
			byte[]buffer=new byte[1024*8];
			while(true) {
				int count=in.read(buffer); //占쏙옙占쌜울옙 占싻억옙占쏙옙占� 占쏙옙占쌘곤옙占쏙옙
				if(count==-1) break; //占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌩댐옙占쏙옙 체크
				out.write(buffer,0,count);
			}
			in.close();
			out.close();
		}
		
		@RequestMapping("/thumbnails.do")
		protected void thumbnails(@RequestParam(value="fileName", required=false) String fileName,
								  @RequestParam(value="pro_code", required=false)	String pro_code,
								  @RequestParam(value="review_num", required=false) String review_num,
								  @RequestParam(value="q_index" , required=false) String q_index,
								  HttpServletResponse response) throws IOException{
			
			
			OutputStream out=response.getOutputStream();
//			System.out.println("fileName ------이미지이미지"+fileName);
//			System.out.println("review_num ------이미지이미지"+review_num);
		
//			System.out.println("ThumbNail 신호");
			String filePath;
			if(pro_code !=null && !pro_code.equals("")) {
				filePath=CURR_IMAGE_REPO_PATH+"\\"+pro_code+"\\"+fileName;
			}
			else if (review_num != null && !review_num.equals("")){
				filePath=CURR_NOTICE_REVIEW_REPO_PATH+"\\"+review_num+"\\"+fileName;
			}else {
				filePath=CURR_NOTICE_QNA_REPO_PATH+"\\"+q_index+"\\"+fileName;
			}
			
			
			File image=new File(filePath);
			int lastIndex=fileName.lastIndexOf("."); //�ڿ��� .���� ������
			String imageFileName=fileName.substring(0,lastIndex); //Ȯ���� ������ �����̸��� ��������
			if(image.exists()) {
				Thumbnails.of(image).size(666,999).outputFormat("png").toOutputStream(out);
			}
			byte[] buffer =new byte[1024*8];
			out.write(buffer);
			out.close();
									  
		  }
		
		
		@RequestMapping("/thumbnailsRe.do")
		protected void thumbnailsRe(@RequestParam(value="fileName", required=false) String fileName,
								  @RequestParam(value="pro_code", required=false)	String pro_code,
								  @RequestParam(value="review_num", required=false) String review_num,
								  HttpServletResponse response) throws IOException{
			OutputStream out=response.getOutputStream();
		
//			System.out.println("ThumbNail 신호111");
			String filePath;
			filePath=CURR_NOTICE_REVIEW_REPO_PATH+"\\"+review_num+"\\"+fileName;
			
//			System.out.println("fileName ------이미지이미지"+fileName);
//			System.out.println("review_num ------이미지이미지"+review_num);
			
			File image=new File(filePath);
			int lastIndex=fileName.lastIndexOf("."); //�ڿ��� .���� ������
			String imageFileName=fileName.substring(0,lastIndex); //Ȯ���� ������ �����̸��� ��������
			if(image.exists()) {
				Thumbnails.of(image).size(960,960).outputFormat("png").toOutputStream(out);
			}
			byte[] buffer =new byte[1024*8];
			out.write(buffer);
			out.close();
									  
		  }
}
