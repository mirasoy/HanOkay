

package com.ana.mapper;

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
public class RomMapperTests {

	@Setter(onMethod_ = @Autowired)
	private RomMapper mapper;

	@Test
	public void testRead() {
		RomVO rom = mapper.read("R27");
		log.info(rom);
	}
	
	@Test
	public void testGetAll() {
		mapper.getAll("A4").forEach(rom -> log.info(rom));
	}
	
	@Test
	public void testGetList() {
		mapper.getList("A4", "3").forEach(rom -> log.info(rom));
	}
	
}
