package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.RomVO;

public interface RomMapper {
	
	public List<RomVO> getAll(String acmNum);
	
	public List<RomVO> getList(@Param("acmNum") String acmNum, @Param("person") String person);
	
	public int insert(RomVO rom);
	
	public RomVO read(String romNum);
	
	public int delete(String romNum);
	
	public int update(RomVO rom);

}
