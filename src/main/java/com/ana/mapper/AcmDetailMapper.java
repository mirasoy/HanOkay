package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.AcmDetailPicVO;
import com.ana.domain.AcmDetailRevVO;
import com.ana.domain.AcmDetailRomVO;
import com.ana.domain.AcmDetailVO;

public interface AcmDetailMapper {
	
	public AcmDetailVO getAcm(String acmNum); // 숙소정보

	public List<AcmDetailPicVO> getPicList(String acmNum); // 숙소사진 리스트
	
	public List<AcmDetailRomVO> getRomAll(String acmNum); // 객실정보 리스트
	
	public List<AcmDetailRomVO> getRomList(@Param("acmNum") String acmNum, @Param("person") String person); // 객실정보 리스트
	
	public List<AcmDetailRevVO> getRevList(String acmNum); // 숙소리뷰 리스트
	
	public double getStisf(String acmNum); // 숙소 평균 별점
	
}
