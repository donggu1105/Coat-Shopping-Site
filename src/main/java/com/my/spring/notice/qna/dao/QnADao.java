package com.my.spring.notice.qna.dao;

import java.util.List;
import java.util.Map;

import com.my.spring.notice.qna.vo.QnAVO;

public interface QnADao {
	List<QnAVO> qnalist(Map<String, Object> map);
	int selectBoardCount(Map<String, Object> map);
	void write(Map<String, Object> writeMap);
	Object content_view(String q_index);
	int modify(Map<String, Object> map);
	int modifyImage(Map<String, Object> map);
	void delete(Map<String, Object> map);
	int reply(Map<String, Object> map);
	Object reply_view(String q_index);
	int hit(String q_index);
	int reply_Shape(String q_group , String q_step);
	int selectMaxwrite_number();
	//내 문의사항
	int selectMyqnaBoardCount();
	List<QnAVO> selectMyqnaview(Map<String, Object> map);
	int selectTotalQna(Map<String, Object> pagingMap);
	
}
