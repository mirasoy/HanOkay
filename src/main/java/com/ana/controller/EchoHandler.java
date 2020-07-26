package com.ana.controller;

import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
//웹 소켓 세션을 저장할 리스트 생성
	private List<WebSocketSession> sessionList = new ArrayList();

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
//※클라이언트 연결 된 후
//WebSocketSession을 매개 변수로 받고 클라이언트가 연결된 후 
//해당 클라이언트의 정보를 가져와 연결확인 작업을한다.
//클라이언트의 세션을 세션 저장 리스트에 add()로 추가 한다.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		
		sessionList.add(session);
		
		logger.info("{} 연결됨",session.getId());
		
	}

//※클라이언트와 연결이 끊어진 경우
//add()와 반대로 remove()를 이용해서 세션리스트에서 제거한다.
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결끊김",session.getId());
	}

// 웹 소켓 서버로 데이터를 전송했을 경우
//연결된 모든 클라이언트에게 메시지 전송 : 리스트
//연결된 모든 사용자에게 보내야 하므로 for문으로 세션리스트에 있는 모든 세션들을 돌면서
// sendMessage()를 이용해 데이터를 주고 받는다.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
	}
	
	
}