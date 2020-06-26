package com.ana.mapper;

import java.util.List;
import com.ana.domain.UserVO;

public interface UserMapper {

	public List<UserVO> getList();
	
	public void insert(UserVO user);
	
	public void insertSelectKey(UserVO user);
	
	public UserVO read(String userNum);
	
	public int delete(String userNum);
	
	public int update(UserVO user);

}
