package com.my.spring.notice.qna.service;

import java.util.List;
import java.util.Map;

import com.my.spring.notice.qna.vo.QnAVO;

public interface QnAService {
	List<QnAVO> qnalist(int page , int displayRowCount);
	int selectBoardCount();
	int write(Map<String, Object> writeMap);
	Object content_view(String q_index);
	int modify(Map<String, Object> map);
	void delete(Map<String, Object> map);
	int reply(Map<String, Object> map);
	Object reply_view(String q_index);
	int hit(String q_index);
	int reply_Shape(String q_group , String q_step);
	Map<String, Object> qna_mywrite_list(Map<String, Object> map);
}
