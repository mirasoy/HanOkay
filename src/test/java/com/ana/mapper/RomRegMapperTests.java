package com.ana.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.AcmVO;
import com.ana.domain.Criteria;
import com.ana.domain.RomVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RomRegMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private RomRegMapper mapper;
	

	
	@Test
	public void testgetList() {
		mapper.getList("A1").forEach(i -> log.info(i));
	}
	
	
	
}
