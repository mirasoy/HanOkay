package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.RomVO;

public interface RomRegMapper {//호스트단에서 객실관련처리
	
	public List<RomVO> getList(String acmNum);//숙소번호를 넣어주면 숙소에 포함된 객실들을 모두 가져옴
	public int insert(RomVO rom);
	public RomVO read(String romNum);
	
}
