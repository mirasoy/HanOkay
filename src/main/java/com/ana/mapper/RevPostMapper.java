package com.ana.mapper;

import java.util.List;

import com.ana.domain.RevDetailVO;
import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;

public interface RevPostMapper {

	public List<RevVO> getList();
	//모든 리뷰목록 > 거의 사용하지 않는 부분 
	
	public List<RevVO> getMyList(String loginUser);
	//자신의 모든 예약목록=(숙박완료된) 받아오기
		
	public void insert(RevVO RevVO);
	//리뷰입력하기
	
	public RevVO read(String pstNum);
	//리뷰읽어오기	
	
	public RevVO readByBookNum(String bookNum);
	//예약넘버로 불러오기
	
	public int delete(String pstNum);
	//리뷰 삭제하기
	
	public int update(RevPostVO repost);
	//리뷰수정하기 

	public List<RevPostVO> getAcmList(String acmNum);
	

}
