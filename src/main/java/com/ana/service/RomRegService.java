package com.ana.service;

import java.util.List;

import com.ana.domain.RomVO;

public interface RomRegService {//호스트 등록단에서 

	public List<RomVO> getList(String acmNum);//객실전체리스트 가져오기

	public int register(RomVO rom); //객실등록할때

	public RomVO getRom(String romNum);

	public boolean modify(RomVO rom);

	public boolean remove(String romNum);


}
