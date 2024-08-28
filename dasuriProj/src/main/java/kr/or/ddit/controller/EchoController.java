package kr.or.ddit.controller;

import java.util.ArrayList;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EchoController extends TextWebSocketHandler {

	// 로그인중인 유저
	ArrayList<WebSocketSession> users = new ArrayList<WebSocketSession>();

	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {	
		log.info("Connection Success"); //sysout으로 대체하셔도 무관합니다. 콘솔 확인 편의성을 위해 사용했습니다.
		users.add(session);
	}

	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload(); //메시지
		
		if (msg != null) {
			log.info("send Message :: " + msg);

			for (int i = 0; i < users.size(); i ++) { //모두에게 발송				
				((WebSocketSession)users.get(i)).sendMessage(new TextMessage(msg));
			}
		}
	}

	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("Connection Close");
		users.remove(session);
	}

	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log.info("Session Error");
	}
}