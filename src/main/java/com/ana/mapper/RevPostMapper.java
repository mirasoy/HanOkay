package com.ana.mapper;

import java.util.List;

import com.ana.domain.RevDetailVO;
import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;

public interface RevPostMapper {

	public List<RevVO> getList();
	
	public List<RevVO> getMyList(String loginUser);
	
	public void insert(RevVO RevVO);
	
	public RevVO read(String pstNum);
	
	public int delete(String pstNum);
	
	public int update(RevPostVO repost);

}
