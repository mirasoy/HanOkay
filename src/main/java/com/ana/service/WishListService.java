package com.ana.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.BookingVO;
import com.ana.domain.WishListVO;

public interface WishListService {

	public int register(WishListVO board); // 찜 추가하기
	
	public WishListVO get(String loginUserNum); //찜 얻어오기
	
	public List<WishListVO> getWishList(String loginUserNum);
	
	public int modify(WishListVO board); //수정 
	
	public boolean remove(String wishNum); //삭제

	public int removeAjax(String wishNum);
	
	public int countCart(WishListVO wish); //장바구니에 동일한 상품이 있는지 확인
	
	public List<WishListVO> drawValue(@Param("loginUserNum")String loginUserNum, @Param("acmNum") String acmNum);
	
}
