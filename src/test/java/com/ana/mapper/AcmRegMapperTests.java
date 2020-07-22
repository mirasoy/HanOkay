package com.ana.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.AcmVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AcmRegMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private AcmRegMapper mapper;

	
	@Test
	public void testInsertSelectKey() {
		AcmVO acm = new AcmVO();
		acm.setAcmName("새로 추가한 숙소 select key");
		acm.setAcmCity("서울시");
		acm.setAcmDistr("새로운 숙소 동");
		acm.setAcmDetailaddr("새로운 숙소 상세주소");
		acm.setBizRegnum("1234512345");
		acm.setCheckinTime("AM11");
		acm.setCheckoutTime("PM04");
		acm.setRepPhone("02333");
		acm.setAcmType("multi");
		acm.setAcmEmail("02@naver.com");
		acm.setAcmPurl("/img");
		acm.setAcmPname("acm0.png");
		
		acm.setLatitude("36.7307216");
		acm.setLongitude("128.6216116");
		acm.setAcmActi("숙소미인증");
		acm.setAcmStatus("숙소미인증");
		
		acm.setSubPhone("01032373247");
		acm.setAcmFax("020000");
		
		
		mapper.newAcmReg(acm);
		
		log.info(acm);
	}
   

}
