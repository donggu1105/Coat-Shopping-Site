package com.my.spring.notice.review.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.notice.review.vo.ReviewVO;
import com.my.spring.notice.review.vo.Review_ImageVO;
import com.my.spring.notice.review.vo.Review_ReplyVO;
import com.my.spring.product.vo.ProductVO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	ReviewVO reviewVO;
	
	@Autowired
	ProductVO productVO;

	@Override
	public void insertArticle(Map writeMap) {
		sqlSession.insert("mapper.notice.review.insertArticle",writeMap); 
	}
	
	public int selectBoardCount() {
		return sqlSession.selectOne("mapper.notice.review.selectBoardCount");
	}

	@Override
	public void insertReview_Image(ArrayList<Review_ImageVO> imageFileList) {
			
		for(int i=0; i<imageFileList.size(); i++) {
			
			Review_ImageVO imageFile=imageFileList.get(i);
			
			sqlSession.insert("mapper.notice.review.insertReview_Image", imageFile);
		}
	}

	@Override
	public List<ReviewVO> selectAllReviews(Map pagingMap) {
		return sqlSession.selectList("mapper.notice.review.selectAllReviews",pagingMap);
	}

	@Override
	public int hitup(String review_num) {
		return sqlSession.update("mapper.notice.review.hitup", review_num);
	}
	
	@Override
	public int selectMaxArticle_number() {
		return sqlSession.selectOne("mapper.notice.review.selectMaxArticle_number");
	}

	@Override
	public String selectReviewImage(String review_num) {
		return sqlSession.selectOne("mapper.notice.review.selectReviewImage", review_num);
	}

	@Override
	public void deleteReview(String review_num) {
		sqlSession.delete("mapper.notice.review.deleteReview", review_num);
	}

	@Override
	public void deleteReviewImage(String review_num) {
		sqlSession.delete("mapper.notice.review.deleteReviewImage", review_num);
		
	}

	@Override
	public void reviewReplyContent(Map replyMap) {
		sqlSession.insert("mapper.notice.review.reviewReplyContent", replyMap);
		
	}



	@Override
	public Object selectContent(String review_num) {
		return sqlSession.selectOne("mapper.notice.review.selectContent", review_num);
	}

	@Override
	public void updateReplyCount(String review_num) {
		sqlSession.update("mapper.notice.review.updateReplyCount",review_num);
		
	}

	@Override
	public void updateArticle(Map modifyMap) {
		sqlSession.insert("mapper.notice.review.updateArticle",modifyMap); 
		
	}

	@Override
	public void updateReviewImage(Map reviewImaUpMap) {
		sqlSession.update("mapper.notice.review.updateReviewImage",reviewImaUpMap); 
	}

	@Override
	public int selectReplyCount(String review_num) {
		return sqlSession.selectOne("mapper.notice.review.selectReplyCount", review_num);
	}
	
	@Override
	public List<Review_ReplyVO> selectReviewReply(Map pagingMap) {
		return sqlSession.selectList("mapper.notice.review.selectReviewReply",pagingMap);
	}

	@Override
	public void deleteReviewReply(String review_reply_code) {
		sqlSession.delete("mapper.notice.review.deleteReviewReply", review_reply_code);
		
	}

	@Override
	public List<List<Object>> printPrReview(int pro_code) {
		return sqlSession.selectList("mapper.notice.review.selectPrReviews", pro_code);
		
	}

	@Override
	public int selectPrCount(int pro_code) {
		return sqlSession.selectOne("mapper.notice.review.selectPrCount", pro_code);
	}

	@Override
	public int selectStarAvg(int pro_code) {
		return sqlSession.selectOne("mapper.notice.review.selectStarAvg", pro_code);
	}

	///내 리뷰만
		@Override
		public int selectMyBoardCount() {
			return sqlSession.selectOne("mapper.notice.review.selectMyBoardCount");
		}

		@Override
		public List<ReviewVO> selectMyReviews(Map pagingMap) {
			return sqlSession.selectList("mapper.notice.review.selectMyReviews",pagingMap);
		}

		@Override
		public int selectTotalReview(Map<String, Object> pagingMap) {
			return sqlSession.selectOne("mapper.notice.review.selectTotalReview",pagingMap);
		}


}
