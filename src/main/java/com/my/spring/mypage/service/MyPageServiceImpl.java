package com.my.spring.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.notice.qna.dao.QnADao;
import com.my.spring.notice.qna.vo.QnAVO;
import com.my.spring.notice.review.dao.ReviewDAO;
import com.my.spring.notice.review.vo.ReviewVO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {

	
	@Autowired
	ReviewDAO reviewDAO;
	
	@Autowired
	QnADao	qnaDAO;

	@Override
	public Map<String, Object> getMyArticles(String member_id) {
		Map<String,Object> pagingMap=new HashMap();
		pagingMap.put("member_id", member_id);
		pagingMap.put("section", "1");
		pagingMap.put("pageNum", "1");
		pagingMap.put("displayRowCount", "10");
		pagingMap.put("page", "1");
		
		List<ReviewVO> reviewList=reviewDAO.selectMyReviews(pagingMap);
		List<QnAVO> qnaList=qnaDAO.selectMyqnaview(pagingMap);
		int totalQna=qnaDAO.selectTotalQna(pagingMap);
		int totalReview=reviewDAO.selectTotalReview(pagingMap);
		Map<String,Object> returnMap=new HashMap();
		
		returnMap.put("reviewList", reviewList);
		returnMap.put("qnaList", qnaList);
		returnMap.put("totalQna", totalQna);
		returnMap.put("totalReview", totalReview);
		
		return returnMap;
	}
	
	
	
}
