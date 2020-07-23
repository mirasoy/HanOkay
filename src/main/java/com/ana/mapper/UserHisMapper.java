package com.ana.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.ana.domain.UserHisVO;
import com.ana.domain.UserVO;

public interface UserHisMapper {
	
	/////////////////////////////////세린쨩의 영역/////////////////////////////////
	//회원의 상태코드가 변경될 때 기록을 남기는 쿼리
	public void insertStatCodeChangeHistory(@Param("userNum") String userNum,@Param("infoCode") String infoCode, @Param("changer") String changer);
	
	
	
	
	/////////////////////////////////림쨩의 영역/////////////////////////////////
	
	//숙소가 등록될때 사업자등록변화와 
	public void becomeHost(UserHisVO vo);
	
	
	
	
	
	
	
	
	
}
