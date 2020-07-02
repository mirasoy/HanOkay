package com.ana.mapper;

import java.util.List;

import com.ana.domain.RevDetailVO;

public interface RevDetailMapper {

	public List<RevDetailVO> getList();
	
	public void insert(RevDetailVO repost);
	
	public RevDetailVO read(String pstNum);
	
	public int delete(String pstNum);
	
	public int update(RevDetailVO repost);

}
