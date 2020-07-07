package com.ana.mapper;

import java.util.List;


import com.ana.domain.RomOptVO;

public interface RomOptMapper {//객실에 대한 옵션테이블
	
	public List<RomOptVO> getList(String romNum);//전체객실 보여지기
	
	public int insert(RomOptVO vo);//객실추가
	
	public int delete(String romNum); //객실제거
	

}
