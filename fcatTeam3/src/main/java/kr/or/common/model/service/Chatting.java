package kr.or.common.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class Chatting extends TextWebSocketHandler {
	@Autowired
	private CommonService service;

	private HashMap<String, WebSocketSession> chatMemberList; // 현재 접속한 세션 목록
	private HashMap<String, String> chatRoom;// 나랑 채팅중인 채팅방

	private String sessionId; // 현재 접속한 세션 id 기록용
	// 로그인한 id, 받는 사람 id
	// 현재 선택된 대화창이면 대화 ++ / 그외는 알림 ++

	public Chatting() {
		chatMemberList = new HashMap<String, WebSocketSession>();
		sessionId = null;
		System.out.println("채팅 소켓 생성완료");
	}

	// 클라이언트 접속
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

	}

	// 웹소켓 로직
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// msg 파싱
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message.getPayload());
		// 값 추출
		String type = element.getAsJsonObject().get("type").getAsString();

		if (type.equals("conn")) {
			sessionId = element.getAsJsonObject().get("sessionId").getAsString();
			chatMemberList.put(sessionId, session);
			
		} else if (type.equals("chat")) {
			String msg = element.getAsJsonObject().get("msg").getAsString();
			String receiver = element.getAsJsonObject().get("receiver").getAsString();
			String sender = element.getAsJsonObject().get("sender").getAsString();
			
			System.out.println("메시지 보낸이 : " + sender);
			
			String sendMsg = "<div class='chat left'><span class='chatId'>" + sender + " : </span>"
					+ msg + "</div>";

			WebSocketSession s = chatMemberList.get(receiver);

			// 현재 접속한 클라이언트에 받는 사람이 있는 경우
			if (s != null) {
				TextMessage tm = new TextMessage(sendMsg);
				s.sendMessage(tm);
			}
		}
	}

	// 클라이언트 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 세션 리스트 key 확인 : 종료 된 session을 value로 가지고 있는 key 조회
		for (String key : chatMemberList.keySet()) {
			if (session.equals(chatMemberList.get(key))) { // 해당하는 key 있는 경우
				chatMemberList.remove(key); // 해당 클라이언트 제거
				//System.out.println("클라이언트 제거 성공!");
				break;
			}
		}
	}
}
