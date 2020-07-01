package com.ana.mapper;

import java.util.List;
import com.ana.domain.RevPostVO;

public interface RevMapper {

	public List<RevPostVO> getList();
	
	public void insert(RevPostVO repost);
		
	public RevPostVO read(String pstNum);
	
	public int delete(String pstNum);
	
	public int update(RevPostVO repost);

}
