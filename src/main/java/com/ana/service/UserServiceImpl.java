package com.ana.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.ana.domain.UserVO;
import com.ana.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{

	private UserMapper mapper;
	
	@Override
	public void register(UserVO user) {
		log.info("register...."+ user);
		mapper.insertSelectKey(user);
	}

	@Override
	public UserVO get(String userNum) {
		log.info("getList.......");
		return mapper.readUser(userNum);
	}

	@Override
	public boolean modify(UserVO user) {
		log.info("modify.........."+ user);
		return mapper.updateUser(user) == 1;
	}

	@Override
	public boolean remove(String userNum) {
		log.info("remove......."+ userNum);
		return mapper.deleteUser(userNum) == 1;
	}

	@Override
	public List<UserVO> getList() {
		log.info("getList.......");
		return mapper.getList();
	}

	@Override
	public boolean checkEmail(String email) {
		log.info("idCheck........");
		return mapper.checkEmail(email)==0;
	}

}
