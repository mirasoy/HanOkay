package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ana.domain.AcmVO;
import com.ana.domain.Criteria;

public interface AcmMapper {
	
	public List<AcmVO> getList();
	
	public List<AcmVO> getListWithPaging(Criteria cri);
	
	public void insert(AcmVO acm);
	
	public void insertSelectKey(AcmVO acm);
	
	public AcmVO read(String acmNum);
	
	public int delete(String acmNum);
	
	public int update(AcmVO acm);
	
	public int getTotalCount(@Param("cri") Criteria cri, @Param("acmNum") List<String> acmNum);
	
	public List<String> getAcmNum(String person);
	
	public List<AcmVO> getListPaging(@Param("cri") Criteria cri, @Param("acmNum") List<String> acmNum);
	
	
}
