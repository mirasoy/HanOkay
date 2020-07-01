package com.ana.service;

import static org.junit.Assert.assertNotNull;

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
public class AcmOptionServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private AcmOptionService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void testGetList() {
		service.getList("A1").forEach(option -> log.info(option));
	}

	@Test
	public void testRegister() {
		AcmOptionVO option = new AcmOptionVO();
		option.setAcmNum("A123");
		option.setAcmOptcode("TEST");
		service.register(option);
		log.info("생성된 숙소의 번호: " + option.getAcmOptcode());
	}

	//@Test
	public void testGet() {
		log.info(service.get("A1"));
	}

	//@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove("A2", "ACM_OPT_TEST"));
	}

	@Test
	public void testUpdate() {
		AcmOptionVO option = service.get("R20");
		if (option == null)
			return;
		option.setAcmNum("A123");
		option.setAcmOptcode("TEST");
		log.info("MODIFY RESULT: " + service.modify(option));
	}

}
