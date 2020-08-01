package com.ana.service;

import java.util.List;

import com.ana.domain.Criteria;
import com.ana.domain.QnaVO;

public interface QnaService {
	
	public void register(QnaVO qna);
	
	public QnaVO get(Long bno, String goHit);
	
	public boolean modify(QnaVO qna);
	
	public boolean remove(Long bno);
	
	//public List<QnaVO> getList();

	public List<QnaVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
