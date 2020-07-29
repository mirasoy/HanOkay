package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ana.domain.AcmVO;
import com.ana.domain.WishListVO;

public interface WishListMapper {
	

	public List<WishListVO> getList();
	public void insert(WishListVO board);
	public void insertSelectKey(WishListVO board);
	public WishListVO read(String userNum);
	public int delete(String userNum);	
	public int update(WishListVO board);

}
