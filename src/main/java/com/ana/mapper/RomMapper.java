package com.ana.mapper;

import java.util.List;

import com.ana.domain.RomVO;

public interface RomMapper {
	
	public List<RomVO> getList();
	
	public void insert(RomVO rom);
	
	public RomVO read(String rom_Num);
	
	public int delete(String rom_Num);
	
	public int update(RomVO rom);

}
