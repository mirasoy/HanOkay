package com.ana.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ana.domain.RevPicVO;
import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;

public interface RevService {
	//등록하기
	public void register(RevVO post);
	//사진 등록하기
	//public void registerPhoto(RevVO post);
	//리뷰가져오기
	public RevVO get(String postNum);
	//예약번호로 리뷰가져오기
	public RevVO getByBooknum(String bookNum);
	//리뷰수정하기
	public boolean modify(RevVO post);
	//리뷰삭제하기
	public boolean remove(String postNum);
	//완료된 나의 예약가져오기
	public List<RevVO> getUserList(String loginUser);
	//모든 리뷰 가져오기 (모든 유저)
	public List<RevVO> getList();
	
	public List<RevPicVO> getPhoto(String pstNum);

	//insert photo
	public void registerPicture(List<RevPicVO> picList) ;
	
	//revome all photo in review
	public boolean removeAllPhoto(String pstNum);
	
	//user가 쓴 리뷰의 총 갯수를 가져오는 메서드(세린)
	public int getMyReviewCount(HttpSession session);
}
