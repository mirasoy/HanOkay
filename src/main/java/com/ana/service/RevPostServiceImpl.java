package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;
import com.ana.mapper.RevPostMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RevPostServiceImpl implements RevPostService{
	
	private RevPostMapper mapper;

	public void register(RevVO post) {
		log.info("register......" + post);
		
		mapper.insert(post);
		
	}

	@Override
	public RevVO get(String postNum) {
		log.info("get......"+postNum);
		return mapper.read(postNum);
	}

	@Override
	public boolean modify(RevPostVO post) {
		log.info("modify......" + post);
		return mapper.update(post)==1;
	}

	@Override
	public boolean remove(String postNum) {
		log.info("remove......" + postNum);
		return mapper.delete(postNum)==1;
	}

	@Override
	public List<RevVO> getList() {
		log.info("getList...........");
		return mapper.getList();
	}

	@Override
	public List<RevPostVO> getAcmList(String acmNum) {
		log.info("getList...........");
		return mapper.getAcmList(acmNum);
	}

}
