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

public class MsgMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private MsgMapper mapper;
	
	
	
	//@Test
	public void sendMsg() {
		
		MsgVO vo = new MsgVO();
		vo.setUnumTo("U2");
		vo.setUnumFrom("U3");
		vo.setMsgContent("잘지내고잇니");
		mapper.sendMsg(vo);
	}
	
	@Test
	public void marksRead() {
		
		//og.info("count "+ mapper.marksRead("M202"));
		
		mapper.readConversation("-", "2");
	}
    





	
	

	
	

}
