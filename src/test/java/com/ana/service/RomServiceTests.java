package com.ana.service;

import static org.junit.Assert.assertNotNull;

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
public class RomServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private RomService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void testGetList() {
		service.getList("A4", "3").forEach(rom -> log.info(rom));
	}
	
	@Test
	public void testGetAll() {
		service.getAll("A1").forEach(rom -> log.info(rom));
	}

	@Test
	public void testGet() {
		log.info(service.get("A7"));
	}


}
