package com.ana.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CodeMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private CodeMapper mapper;
	
	@Test
	public void testGetAcmCode() { // 숙소 코드 정보
		log.info(mapper.getAcmCode());
	}
	
	@Test
	public void testGetRomCode() { // 숙소 코드 정보
		log.info(mapper.getRomCode());
	}
	
}

