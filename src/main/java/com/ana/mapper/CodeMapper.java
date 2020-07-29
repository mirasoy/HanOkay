package com.ana.mapper;

import java.util.List;

import com.ana.domain.CodeVO;

public interface CodeMapper {
	
	public List<CodeVO> getAcmCode(); // 숙소 옵션 코드

	public List<CodeVO> getRomCode(); // 객실 옵션 코드
	
}
