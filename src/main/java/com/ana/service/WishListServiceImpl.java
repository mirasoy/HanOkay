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
	public void register(WishListVO board) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■register......" + board);		
		mapper.insert(board);
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
	public boolean modify(WishListVO board) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■modify......" + board);
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(String wishNum) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■remove......" + wishNum);
		return mapper.delete(wishNum)==1;
	}


//
//	@Override
//	public List<AcmVO> getList(Criteria cri) {
//		log.info("get List with criteria: " + cri);
//		List<String> romNumList = mapper.getRomNum(cri.getIn(),cri.getOut());
//		List<String> acmNumList = mapper.getAcmNum(cri.getPerson(),romNumList);
//		return mapper.getListPaging(cri, acmNumList);
//	}
//
//	@Override
//	public int getTotal(Criteria cri) {
//		log.info("get total count");
//		List<String> romNumList = mapper.getRomNum(cri.getIn(),cri.getOut());
//		List<String> acmNumList = mapper.getAcmNum(cri.getPerson(),romNumList);
//		return mapper.getTotalCount(cri, acmNumList);
//	}


}
