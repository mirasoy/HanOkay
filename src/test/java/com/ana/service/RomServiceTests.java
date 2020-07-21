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
	public void testRegister() {
		RomVO rom = new RomVO();
		rom.setAcmNum("A123");
		rom.setRomName("test");
		rom.setRomCapa(99);
		rom.setBedType("싱글사이즈");
		rom.setBedCnt(1);
		rom.setRomSize(1);
		rom.setRomPrice(99999);
		rom.setRomPurl("test");
		service.register(rom);
		log.info("생성된 숙소의 번호: " + rom.getRomNum());
	}

	@Test
	public void testGet() {
		log.info(service.get("A7"));
	}

	@Test
	public void testDelete() {
		// 게시물의 존재 여부를 확인하고 테스트할 것
		log.info("REMOVE RESULT: " + service.remove("A2"));
	}

	@Test
	public void testUpdate() {
		RomVO rom = service.get("R20");
		if (rom == null)
			return;
		rom.setAcmNum("A123");
		rom.setRomName("수정");
		rom.setRomCapa(99);
		rom.setBedType("싱글사이즈");
		rom.setBedCnt(1);
		rom.setRomSize(1);
		rom.setRomPrice(99999);
		rom.setRomPurl("test");
		log.info("MODIFY RESULT: " + service.modify(rom));
	}

}
