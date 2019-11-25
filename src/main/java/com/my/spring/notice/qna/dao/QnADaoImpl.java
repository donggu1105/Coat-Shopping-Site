package com.my.spring.notice.qna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.notice.qna.vo.QnAVO;

@Repository("QnaDAO")
public class QnADaoImpl implements QnADao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<QnAVO> qnalist(Map<String, Object> map) {
		return sqlSession.selectList("mapper.notice_qna.qnalist" , map);
	}

	@Override
	public int selectBoardCount(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.notice_qna.selectBoardCount" , map);
	}

	@Override
	public void write(Map<String, Object> writeMap) {
		sqlSession.insert("mapper.notice_qna.write" , writeMap);
	}

	@Override
	public Object content_view(String q_index) {
		return sqlSession.selectOne("mapper.notice_qna.content_view" , q_index);
	}
	
	@Override
	public int modify(Map<String, Object> map) {
		return sqlSession.update("mapper.notice_qna.modify" , map);
	}
	
	@Override
	public int modifyImage(Map<String, Object> map) {
		return sqlSession.update("mapper.notice_qna.modifyImage" , map);
	}

	@Override
	public void delete(Map<String, Object> map) {
		sqlSession.delete("mapper.notice_qna.delete" , map);
	}

	@Override
	public int reply(Map<String, Object> map) {
		return sqlSession.insert("mapper.notice_qna.reply" , map);
	}

	@Override
	public Object reply_view(String q_index) {
		return sqlSession.selectOne("mapper.notice_qna.reply_view" , q_index);
	}

	@Override
	public int hit(String q_index) {
		return sqlSession.update("mapper.notice_qna.hit" , q_index);
	}

	@Override
	public int reply_Shape(String q_group , String q_step) {
		return sqlSession.update("mapper.notice_qna.reply_Shape");
	}

	@Override
	public int selectMaxwrite_number() {
		return sqlSession.selectOne("mapper.notice_qna.selectMaxwrite_number");
	}

	@Override
	public int selectMyqnaBoardCount() {
		return sqlSession.selectOne("mapper.notice_qna.selectMyqnaBoardCount");
	}

	@Override
	public List<QnAVO> selectMyqnaview(Map<String, Object> map) {
		return sqlSession.selectList("mapper.notice_qna.selectMyqnaview" , map);
	}

	@Override
	public int selectTotalQna(Map<String, Object> pagingMap) {
		return sqlSession.selectOne("mapper.notice_qna.selectTotalQna", pagingMap);
	}
	
}
