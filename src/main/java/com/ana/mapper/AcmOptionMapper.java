package com.ana.mapper;

import java.util.List;

import com.ana.domain.AcmOptionVO;

public interface AcmOptionMapper {

	public List<AcmOptionVO> getList(String acmNum);
	
	public int insert(AcmOptionVO option);
	
	public AcmOptionVO read(String acmNum);
	
	public int delete(String acmNum, String acmOptcode);
	
	public int update(AcmOptionVO option);
	
}
