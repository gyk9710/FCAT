package kr.or.seller.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class AlarmMsg extends TextWebSocketHandler {
	@Autowired
	private SellerService service;

	// 알림용 세션 리스트
	private HashMap<String, WebSocketSession> memberList;

	// 채팅방 리스트
	// private HashMap<String, ArrayList<Integer>> chatList;

	public AlarmMsg() {
		memberList = new HashMap<String, WebSocketSession>();
		System.out.println("웹소켓 생성 됨");
	}

	// 클라이언트 접속
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

	}

	// 웹 소켓 로직
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// json parse
		JsonParser parser = new JsonParser(); // parser 생성
		JsonElement element = parser.parse(message.getPayload());

		// 값 추출
		String type = element.getAsJsonObject().get("type").getAsString();//
		String memberId = element.getAsJsonObject().get("memberId").getAsString();

		// 비지니스 로직
		if (type.equals("conn")) {
			memberList.put(memberId, session); // 연결 시 세션 추가
		} else if (type.equals("alarm")) { // 알림
			// memberId의 알림 불러오기
			int alarmCount = service.selectAlarmCount(memberId);

			// 보낼 메시지
			TextMessage tm = new TextMessage(String.valueOf(alarmCount));
			// 메시지 보낼 대상 조회
			WebSocketSession s = memberList.get(memberId);

			// 해당 회원이 있는 경우 알람 수 전달
			if (s != null) {
				s.sendMessage(tm);
			}
		}
	}

	// 클라이언트 접속 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 알림용 세션 리스트 key 확인 : 종료 된 session을 value로 가지고 있는 key 조회
		for (String key : memberList.keySet()) {
			if (session.equals(memberList.get(key))) { // 해당하는 key 있는 경우
				memberList.remove(key); // 해당 클라이언트 제거
			}
		}
	}
}