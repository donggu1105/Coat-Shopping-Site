package com.my.spring.notice.qna.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.notice.qna.dao.QnADao;
import com.my.spring.notice.qna.vo.QnAVO;

@Service("qnaService")
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	QnADao qnaDAO;

	@Override
	public List<QnAVO> qnalist(int page , int displayRowCount) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("displayRowCount", displayRowCount);
		
		return qnaDAO.qnalist(map);
	}

	@Override
	public int selectBoardCount() {
		Map<String, Object> map = new HashMap<String, Object>();
		return qnaDAO.selectBoardCount(map);
	}

	@Override
	public int write(Map<String, Object> writeMap) {
		qnaDAO.write(writeMap); //글쓰기
		
		
		int q_index=qnaDAO.selectMaxwrite_number(); //쓴글중 max(review_num)가져오기 
//		int pro_code=Integer.parseInt((String)writeMap.get("pro_code"));
		ArrayList<QnAVO> imageFileList=(ArrayList<QnAVO>) writeMap.get("imageFileList");  //imageFileList를가져오기

		for(QnAVO q_file : imageFileList) {
			q_file.setQ_index(q_index);
//			review_image.setPro_code(pro_code);
		}
//		qnaDAO.insertReview_Image(imageFileList);

		return q_index;
		
//		return qnaDAO.write(writeMap);
	}

	@Override
	public Object content_view(String q_index) {
		return qnaDAO.content_view(q_index);
	}

	@Override
	public int modify(Map<String, Object> map) {
		qnaDAO.modify(map);
		
		int q_index = Integer.parseInt((String)map.get("q_index"));
		ArrayList<QnAVO> imageFileList = (ArrayList<QnAVO>) map.get("imageFileList");
		
		for (QnAVO qnaImage : imageFileList) {
			qnaImage.setQ_index(q_index);
		}
		
		Map<String, Object> modifyImagemap = new HashMap<String, Object>();
		
		String q_title = (String)map.get("q_title");
		String q_option = (String)map.get("q_option");
		String q_content = (String)map.get("q_content");
		String q_file = (String)map.get("q_file");
		
		modifyImagemap.put("q_index", q_index);
		modifyImagemap.put("q_title", q_title);
		modifyImagemap.put("q_option", q_option);
		modifyImagemap.put("q_content", q_content);
		modifyImagemap.put("q_file", q_file);
		
		qnaDAO.modifyImage(modifyImagemap);
		
		return q_index;
	}

	@Override
	public void delete(Map<String, Object> map) {
		qnaDAO.delete(map);
	}

	@Override
	public int reply(Map<String, Object> map) {
		return qnaDAO.reply(map);
	}

	@Override
	public Object reply_view(String q_index) {
		return qnaDAO.reply_view(q_index);
	}

	@Override
	public int hit(String q_index) {
		return qnaDAO.hit(q_index);
	}

	@Override
	public int reply_Shape(String q_group , String q_step) {
		return qnaDAO.reply_Shape(q_group,q_step);
	}

	@Override
	public Map<String, Object> qna_mywrite_list(Map<String, Object> map) {
		Map<String, Object> myQnamap = new HashMap<String, Object>();
		
		List<QnAVO> myQnalist=qnaDAO.selectMyqnaview(map);
		int myQnatotal=qnaDAO.selectMyqnaBoardCount();
		
		myQnamap.put("myQnalist", myQnalist);
		myQnamap.put("myQnatotal", myQnatotal);
		
		return myQnamap;
	}

}
