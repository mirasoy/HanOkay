package com.ana.service;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.RomVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RomRegServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private RomRegService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void testRegister() {

	}


}
