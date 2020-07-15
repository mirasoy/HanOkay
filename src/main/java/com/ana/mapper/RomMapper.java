package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.RomVO;

public interface RomMapper {
	
	// 숙소 상세페이지: 검색 옵션에 맞는 객실 목록 불러오기
	public List<RomVO> getAll(String acmNum);
	
	// 숙소 상세페이지: 숙소별 객실 목록 불러오기
	public List<RomVO> getList(@Param("acmNum") String acmNum, @Param("person") String person);
	
	public int insert(RomVO rom);
	
	public RomVO read(String romNum);
	
	public int delete(String romNum);
	
	public int update(RomVO rom);

}
