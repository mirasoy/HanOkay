package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ana.domain.Criteria;
import com.ana.domain.QnaVO;

public interface QnaMapper {
	
	//@Select("select * from tqna where bno > 0")
	public List<QnaVO> getList();

	public List<QnaVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(QnaVO qna);
	
	public Integer insertSelectKey(QnaVO qna);
	
	public QnaVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(QnaVO qna);

}
