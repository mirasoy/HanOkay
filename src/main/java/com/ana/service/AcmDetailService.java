package com.ana.service;

import java.util.List;

import com.ana.domain.AcmDetailPicVO;
import com.ana.domain.AcmDetailRevVO;
import com.ana.domain.AcmDetailRomVO;
import com.ana.domain.AcmDetailVO;

public interface AcmDetailService {

	public AcmDetailVO getAcm(String acmNum); // 숙소정보

	public List<AcmDetailPicVO> getPicList(String acmNum); // 숙소사진 리스트
	
	public List<AcmDetailRomVO> getRomAll(String checkin,String checkout,String acmNum); // 객실정보 리스트
	
	public List<AcmDetailRomVO> getRomList(String checkin,String checkout,String acmNum, String person); // 객실정보 리스트
	
	public List<AcmDetailRevVO> getRevList(String acmNum); // 숙소리뷰 리스트
	
	public double getStisf(String acmNum); // 숙소 평균 별점
	
}
