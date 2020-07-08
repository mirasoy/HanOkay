package com.ana.service;

import java.util.List;
import com.ana.domain.RomVO;

public interface RomService {

	public int register(RomVO rom);

	public RomVO get(String romNum);

	public boolean modify(RomVO rom);

	public boolean remove(String romNum);

	public List<RomVO> getAll(String acmNum);
	
	public List<RomVO> getList(String acmNum, String person);
}
