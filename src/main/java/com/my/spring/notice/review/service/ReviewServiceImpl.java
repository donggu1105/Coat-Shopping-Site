package com.my.spring.notice.review.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.notice.review.dao.ReviewDAO;
import com.my.spring.notice.review.vo.ReviewVO;
import com.my.spring.notice.review.vo.Review_ImageVO;
import com.my.spring.notice.review.vo.Review_ReplyVO;
import com.my.spring.product.dao.ProductDAO;
import com.my.spring.product.service.ProductService;
import com.my.spring.product.vo.ProductVO;


@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDAO reviewDAO;
	
	@Autowired
	Review_ImageVO review_ImageVO;
	
	@Autowired
	ProductDAO productDAO;

//	@Override//리뷰리스트 총 갯수
//	public int total() {
//		int totalCount=reviewDAO.selectBoardCount();
//		return totalCount; //총 리뷰수
//	}

	@Override//리뷰쓰기
	public int write(Map writeMap) {
		
		reviewDAO.insertArticle(writeMap); //글쓰기
		
		int review_num=reviewDAO.selectMaxArticle_number(); //쓴글중 max(review_num)가져오기 
		int pro_code=Integer.parseInt((String)writeMap.get("pro_code"));
		ArrayList<Review_ImageVO> imageFileList=(ArrayList<Review_ImageVO>) writeMap.get("imageFileList");  //imageFileList를가져오기

		for(Review_ImageVO review_image : imageFileList) {
			review_image.setReview_num(review_num);
			review_image.setPro_code(pro_code);
		}
		reviewDAO.insertReview_Image(imageFileList);

		return review_num;
	}

	@Override//구매목록
	public List<ProductVO> buylist(Map buylistMap) {
		List<ProductVO> buylist=productDAO.selectAllProducts(buylistMap);
		return buylist;
	}

	@Override//리뷰리스트 뽑기 & 페이징
	public Map listReview(Map pagingMap) {
		Map listMap=new HashMap();
		
		List<ReviewVO> reviewList=reviewDAO.selectAllReviews(pagingMap);
		int totalCount=reviewDAO.selectBoardCount();
		
		listMap.put("reviewList", reviewList);
		listMap.put("totalCount", totalCount);
		
		return listMap;
	}

	@Override//조회수 올림
	public int hit(String review_num) {
		int hitup=reviewDAO.hitup(review_num);
		return hitup;
	}

	@Override//이미지이름찾기
	public String imageFileName(String review_num) {
		String fileName=reviewDAO.selectReviewImage(review_num);
		return fileName;
	}

	@Override//리뷰지우기
	public void deleteReview(String review_num) {
		reviewDAO.deleteReview(review_num);
	}

	@Override//리뷰지울때 이미지도 같이 지움
	public void deleteReviewImage(String review_num) {
		reviewDAO.deleteReviewImage(review_num);
		
	}
	
	@Override//리뷰 상세 보기
	public Object content(String review_num) {
		return reviewDAO.selectContent(review_num);
	}

	@Override//댓글쓰기
	public void reply(Map replyMap) {
		reviewDAO.reviewReplyContent(replyMap);
	}

	@Override//각 리뷰에 몇개의 댓글이 달렸는지 갯수를 리뷰테이블에 업데이트
	public void replyCount(String review_num) {
		reviewDAO.updateReplyCount(review_num);
	}

	@Override//리뷰 수정
	public int modify(Map modifyMap) {
		reviewDAO.updateArticle(modifyMap); //글쓰기
		
		int review_num=Integer.parseInt((String)modifyMap.get("review_num"));
		int pro_code=Integer.parseInt((String)modifyMap.get("pro_code"));
		ArrayList<Review_ImageVO> imageFileList=(ArrayList<Review_ImageVO>) modifyMap.get("imageFileList");  //imageFileList를가져오기
		
		for(Review_ImageVO review_image : imageFileList) {
			review_image.setReview_num(review_num);
			review_image.setPro_code(pro_code);
		}
		
		Map reviewImaUpMap=new HashMap();
		
		String imageFileName=(String) modifyMap.get("imageFileName");
		
		reviewImaUpMap.put("review_num", review_num);
		reviewImaUpMap.put("review_imageFileName", imageFileName);
		
		reviewDAO.updateReviewImage(reviewImaUpMap);
		
		return review_num;
	}

	//댓글리스트
	@Override
	public Map replylist(Map pagingMap) {
		Map replyViewMap=new HashMap();
		List<Review_ReplyVO> reviewReply=reviewDAO.selectReviewReply(pagingMap);
		
		replyViewMap.put("reviewReply", reviewReply);
		return replyViewMap;
	}

	@Override//댓글 갯수
	public int selectReplyCount(String review_num) {
		return reviewDAO.selectReplyCount(review_num);
	}

	@Override//댓글 삭제
	public void deleteReviewReply(String review_reply_code) {
		reviewDAO.deleteReviewReply(review_reply_code);
		
	}

//	@Override//product 리뷰
//	public List<ReviewVO> printReview(int pro_code) {
//		 return reviewDAO.printReview(pro_code);
//		 
//		 int prCount=reviewService.selectPrCount(pro_code);
//			productReviewMap.put("prCount", prCount);
//		
//	}

	@Override
	public Map productReviews(int pro_code) {
		Map productReviewMap = new HashMap();
		List<List<Object>> printPrReview=reviewDAO.printPrReview(pro_code);
		int prCount=reviewDAO.selectPrCount(pro_code);
		int starAvg = reviewDAO.selectStarAvg(pro_code);
		
		productReviewMap.put("printPrReview", printPrReview);
		productReviewMap.put("prCount", prCount);
		productReviewMap.put("starAvg", starAvg);
		return productReviewMap;
	}

//	@Override
//	public int selectPrCount(int pro_code) {
//		return reviewDAO.selectPrCount(pro_code);
//	}
	
	@Override//내 리뷰리스트 뽑기 & 페이징
	public Map listMyReview(Map pagingMap) {
		Map listMap=new HashMap();
		
		List<ReviewVO> myReviewList=reviewDAO.selectMyReviews(pagingMap);
		int myTotalCount=reviewDAO.selectMyBoardCount();
		
		listMap.put("myReviewList", myReviewList);
		listMap.put("myTotalCount", myTotalCount);
		
		return listMap;
	}


}
