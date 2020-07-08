

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
	public void testInsert() {
		RomVO rom = new RomVO();
		rom.setRomNum("R999");
		rom.setAcmNum("A999");
		rom.setRomName("테스트 객실 이름");
		rom.setRomCapa(9);
		rom.setBedType("테스트 객실 타입");
		rom.setBedCnt(9);
		rom.setRomSize(99);
		rom.setRomPrice(9999);
		rom.setRomPurl("테스트 사진 URL");
		rom.setRomLoca("테스트 객실 위치");

		mapper.insert(rom);

		log.info(rom);
	}

	@Test
	public void testRead() {
		RomVO rom = mapper.read("R27");
		log.info(rom);
	}

	@Test
	public void testUpdate() {
		RomVO rom = new RomVO();

		rom.setRomNum("R27");
		rom.setAcmNum("A999");
		rom.setRomName("수정테스트");
		rom.setRomCapa(9);
		rom.setBedType("수정테스트");
		rom.setBedCnt(9);
		rom.setRomSize(99);
		rom.setRomPrice(9999);
		rom.setRomPurl("수정테스트");
		rom.setRomLoca("수정테스트");

		int count = mapper.update(rom);

		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■UPDATE COUNT: " + count);
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
