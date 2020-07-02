package com.ana.mapper;

import java.util.List;

import com.ana.domain.RomVO;

public interface RomMapper {
	
	public List<RomVO> getList(String acmNum);
	
	public int insert(RomVO rom);
	
	public RomVO read(String romNum);
	
	public int delete(String romNum);
	
	public int update(RomVO rom);

}
