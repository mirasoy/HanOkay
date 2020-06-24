package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ana.domain.AcmVO;

public interface AcmMapper {
	
	//@Select("select * from tacm")
	public List<AcmVO> getList();
	
	public void insert(AcmVO acm);
	
	public void insertSelectKey(AcmVO acm);
	
	public AcmVO read(String acm_Num);
	
	public int delete(String acm_Num);
	
	public int update(AcmVO acm);

}
