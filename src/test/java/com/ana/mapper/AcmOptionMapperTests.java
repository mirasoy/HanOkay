package com.ana.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.AcmOptionVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AcmOptionMapperTests {

	@Setter(onMethod_ = @Autowired)
	private AcmOptionMapper mapper;

	@Test
	public void testInsert() {
		AcmOptionVO option = new AcmOptionVO();
		option.setAcmNum("A99");
		option.setAcmOptcode("AC_OPT_TES");
		mapper.insert(option);
		log.info(option);
	}

	//@Test
	public void testRead() {
		AcmOptionVO option = mapper.read("A2");
		log.info(option);
	}

	//@Test
	public void testDelete() {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■DELETE COUNT: " + mapper.delete("A99","AC_OPT_TEST"));
	}

	@Test
	public void testGetList() {
		mapper.getList("A3").forEach(option -> log.info(option));
	}
}
