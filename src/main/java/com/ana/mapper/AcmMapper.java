package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ana.domain.AcmVO;
import com.ana.domain.Criteria;
import com.ana.domain.PicVO;

public interface AcmMapper {
	
	public List<AcmVO> getList();
	
	public List<AcmVO> getSeoulList();
	
	public List<AcmVO> getListWithPaging(Criteria cri);
	
	public void insert(AcmVO acm);
	
	public void insertSelectKey(AcmVO acm);
	
	// 숙소 상세페이지: 숙소 정보 불러오기
	public AcmVO read(String acmNum);
	
	public int delete(String acmNum);
	
	public int update(AcmVO acm);
	
	public int getTotalCount(@Param("romNum") List<String> romNum, @Param("cri") Criteria cri);
	
	public List<String> getRomNum(@Param("cri") Criteria cri);
	
	//public List<String> getAcmNum(@Param("person") String person, @Param("romNum") List<String> romNum);
	
	public List<AcmVO> getListPaging(@Param("romNum") List<String> romNum, @Param("cri") Criteria cri);
	
}
