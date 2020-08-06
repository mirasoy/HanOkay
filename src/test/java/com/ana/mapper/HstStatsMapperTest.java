package com.ana.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.MsgVO;
import com.ana.domain.RevPicVO;
import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class HstStatsMapperTest {
	
	@Setter(onMethod_= @Autowired)
	private HostStatsMapper mapper;
	
	
	
	//@Test
	public void test1() {
		
		mapper.getAllSales("U10");
	}
	
	//@Test
	public void test2() {
		mapper.getAcmSales("A10");
	}
	
	
	//@Test
	public void test3() {
		mapper.getPeriodAllSales("U10","2019/5/29","2020/4/29");
	}
	
	//@Test
	public void test4() {
		mapper.getPeriodAcmSales("A2","20190101","20200202");
	}
	

	//@Test
	public void test5() {
		mapper.getAllAcm("1234567890");
	}
	
	
	@Test
	public void test6() {
		mapper.getAcmRank("U10","STISF");
	}
	
	
	

	
	

}
