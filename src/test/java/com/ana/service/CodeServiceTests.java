package com.ana.service;

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
public class CodeServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private CodeService service;
	
	@Test
	public void testGetAcmCode() { // 숙소 옵션 코드
		service.getAcmCode().forEach(code -> log.info(code));
	}
	
	@Test
	public void testGetRomCode() { // 객실 옵션 코드
		service.getRomCode().forEach(code -> log.info(code));
	}
	
}
