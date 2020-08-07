package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.RevDetailVO;
import com.ana.domain.RevPicVO;
import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;

public interface RevPostMapper {

	// 숙소 상세페이지: 숙소에 해당하는 리뷰 목록 불러오기
	public List<RevVO> getList();
	
	public List<RevVO> getUserBookingACList(String loginUser);
	//자신의 모든 예약목록=(숙박완료된) 받아오기
		
	public void insert(RevVO revVO);
	//리뷰입력하기
	
	public RevVO read(String pstNum);
	//리뷰읽어오기	
	
	public RevVO readByBookNum(String bookNum);
	//예약넘버로 불러오기
	
	public int delete(String pstNum);
	//리뷰 삭제하기
	
	public int update(RevVO repost);
	//리뷰수정하기 

	public List<RevPostVO> getAcmList(String acmNum);

	//사진가져오기
	public List<RevPicVO> getPhoto(String pstNum);
	//사진등록하기
	public void insertPhoto(RevPicVO revPicVO);
	//사진삭제하기
	public int deletePhoto(RevPicVO revPicVO);
	//리뷰의 모든사진삭제
	public int deleteAllPhoto(String pstNum);
	//user가 쓴 리뷰의 총 갯수(세린
	public int getMyReviewCount(String userNum);
	
	
}
