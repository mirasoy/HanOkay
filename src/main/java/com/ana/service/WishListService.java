package com.ana.service;

import java.util.List;

import com.ana.domain.BookingVO;
import com.ana.domain.WishListVO;

public interface WishListService {

	public void register(WishListVO board); // 찜 추가하기
	
	public WishListVO get(String wishNum); //찜 얻어오기
	
	public List<WishListVO> getWishList(String loginUserNum);
	
	public boolean modify(WishListVO board); //수정 
	
	public boolean remove(String wishNum); //삭제
	
	
	
}
