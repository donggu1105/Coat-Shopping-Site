package com.my.spring.notice.review.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.my.spring.notice.review.vo.ReviewVO;
import com.my.spring.notice.review.vo.Review_ReplyVO;
import com.my.spring.product.vo.ProductVO;

public interface ReviewService {
	
	//리뷰리스트 총 갯수
//	int total();
	
	//리뷰쓰기
	int write(Map writeMap);
	
	//구매목록
	List<ProductVO> buylist(Map buylistMap);
	
	//리뷰리스트 뽑기 & 페이징
	Map listReview(Map pagingMap);
	
	//조회수 올림
	int hit(String review_num);
	
	//이미지이름찾기
	String imageFileName(String review_num);
	
	//리뷰지우기
	void deleteReview(String review_num);
	
	//리뷰지울때 이미지도 같이 지움
	void deleteReviewImage(String review_num);
	
	//리뷰 상세 보기
	Object content(String review_num);
	
	//댓글쓰기
	void reply(Map replyMap);
	
	//각 리뷰에 몇개의 댓글이 달렸는지 갯수를 리뷰테이블에 업데이트
	void replyCount(String review_num);
	
	//리뷰 수정
	int modify(Map modifyMap);
	
	//댓글 리스트 페이징
	Map replylist(Map pagingMap);
	int selectReplyCount(String review_num);

	//댓글 삭제
	void deleteReviewReply(String review_reply_code);
	
	//리뷰뽑기 - product컨트롤러 연결
//	List<ReviewVO> printReview(int pro_code);

	Map productReviews(int pro_code);

//	int selectPrCount(int pro_code);

	//내 리뷰만
	Map listMyReview(Map pagingMap);

	
}
