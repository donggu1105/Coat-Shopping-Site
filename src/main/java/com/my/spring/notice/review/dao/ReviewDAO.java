package com.my.spring.notice.review.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.my.spring.notice.review.vo.ReviewVO;
import com.my.spring.notice.review.vo.Review_ImageVO;
import com.my.spring.notice.review.vo.Review_ReplyVO;
import com.my.spring.product.vo.ProductVO;

public interface ReviewDAO {

	void insertArticle(Map writeMap);//글쓰기
	
	public int selectBoardCount();//총 갯수
	
	void insertReview_Image(ArrayList<Review_ImageVO> imageFileList);//이미지 등록

	List<ReviewVO> selectAllReviews(Map pagingMap);//리뷰리스트 뽑기
	
	int hitup(String review_num);//조회수

	int selectMaxArticle_number();//이미지 등록시 등록 글번호 불러오기

	public String selectReviewImage(String review_num);

	void deleteReview(String review_num);

	void deleteReviewImage(String review_num);
	
	void reviewReplyContent(Map replyMap);

	Object selectContent(String review_num);

	void updateReplyCount(String review_num);

	void updateArticle(Map modifyMap);

	public void updateReviewImage(Map reviewImaUpMap);

	//댓글리스트
	List<Review_ReplyVO> selectReviewReply(Map pagingMap);

	int selectReplyCount(String review_num);

	void deleteReviewReply(String review_reply_code);

	List<List<Object>> printPrReview(int pro_code);

	int selectPrCount(int pro_code);

	int selectStarAvg(int pro_code);
	
	//내 리뷰만
		public int selectMyBoardCount();
		List<ReviewVO> selectMyReviews(Map pagingMap);

		int selectTotalReview(Map<String, Object> pagingMap);



}
