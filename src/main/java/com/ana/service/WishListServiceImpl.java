package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.WishListVO;
import com.ana.mapper.WishListMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class WishListServiceImpl implements WishListService{
	
	private WishListMapper mapper;
	
	@Override
	public int register(WishListVO board) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■register......" + board);		
		return mapper.insert(board);
	}
	
	
	@Override
	public WishListVO get(String wishNum) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■get......"+wishNum);
		return mapper.read(wishNum);
	}
	

	
	
	@Override
	public List<WishListVO> getWishList(String loginUserNum) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■getList...........");
		return mapper.getList();
	}
	

	@Override
	public int modify(WishListVO board) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■modify......" + board);
		return mapper.update(board);
	}

	@Override
	public int remove(String wishNum) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■remove......" + wishNum);
		return mapper.delete(wishNum);
	}




}
