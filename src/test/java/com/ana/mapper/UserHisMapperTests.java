package com.ana.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.ana.domain.UserHisVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserHisMapperTests {

	@Setter(onMethod_ = { @Autowired })
	private UserHisMapper userHisMapper;
	
	@Test
	public void testLeaveStatCodeChangeHistory() {
		userHisMapper.insertStatCodeChangeHistory("U110","512", "U110");
		
	}
}
