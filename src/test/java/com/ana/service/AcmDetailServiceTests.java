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
public class AcmDetailServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private AcmDetailService service;
	
	@Test
	public void testGetAcm() { // 숙소정보
		log.info(service.getAcm("A1"));
	}
	
	@Test
	public void testGetPicList() { // 숙소사진 리스트
		service.getPicList("A1").forEach(pic -> log.info(pic));
	}
	
	@Test
	public void testGetRomAll() { // 객실정보 리스트
		service.getRomAll("A1").forEach(rom -> log.info(rom));
	}
	
	@Test
	public void testGetRomList() { // 객실정보 리스트
		service.getRomList("A1", "1").forEach(rom -> log.info(rom));
	}
	
	@Test
	public void testGetRevList() {  // 숙소리뷰 리스트
		service.getRevList("A1").forEach(rev -> log.info(rev));
	}

	@Test
	public void testGetStisf() {  // 숙소 평균 별점
		log.info(service.getStisf("A1"));
	}
}
