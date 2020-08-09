package com.ana.mapper;

import static org.junit.Assert.assertTrue;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.ChatRomVO;
import com.ana.domain.MsgVO;
import com.ana.domain.RevPicVO;
import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class ChatRomMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ChatRomMapper mapper;

	// @Test
	public void startChat() {

		ChatRomVO vo = new ChatRomVO();
		vo.setParticipant1("U2");
		vo.setParticipant2("U4");
		vo.setLstaccessor("U2");
		vo.setLastchat("잘지내고잇니");
		mapper.startChat(vo);
	}

	// @Test
	public void updateChatrom() {

		log.info("update cnt >> " + mapper.updateChatrom("만날수없어 만나고싶은데", "U1", "CH1"));

	}

	//Test
	public void readChatlist() {
		log.info("update cnt >> " + mapper.readChatlist("U1"));
	}
	@Test
	public void findChatRom() {
		//log.info("update cnt >> " + mapper.findChatRom("U111","U10").getChatromnum()==null);
		assertTrue(mapper.findChatRom("U111","U10").size()==0);
	}

}
