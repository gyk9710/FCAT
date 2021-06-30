package kr.or.seller.model.service;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.common.model.vo.Message;

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
		String type = element.getAsJsonObject().get("type").getAsString();

		// 비지니스 로직
		if (type.equals("conn")) {
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			memberList.put(memberId, session); // 연결 시 세션 추가

		} else if (type.equals("alarm")) { // 알림
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			sendAlarmCount(memberId); // 알람 수 조회 후 전송

		} else if (type.equals("confirm")) { // 서비스 요청 리스트 확인
			// 값 추출
			String msgReceiver = element.getAsJsonObject().get("msgReceiver").getAsString();
			String msgSender = element.getAsJsonObject().get("msgSender").getAsString();
			String msgTitle = element.getAsJsonObject().get("msgTitle").getAsString();
			String msgContent = element.getAsJsonObject().get("msgContent").getAsString();

			// 메시지 전달용
			Message msg = new Message();
			msg.setMsgReceiver(msgReceiver);
			msg.setMsgSender(msgSender);
			msg.setMsgTitle(msgTitle);
			msg.setMsgContent(msgContent);

			// 서비스 수락 / 거절 MSG 보내기
			int result = service.sendConfirmMsg(msg);

			if (result > 0) {
				sendAlarmCount(msgReceiver);
				// System.out.println("여기 들어오니?");
				// System.out.println("받는 사람 : " + msgReceiver);
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

	// memberId로 알림 조회 후 msg 푸쉬
	private void sendAlarmCount(String memberId) {
		// memberId의 알림 불러오기
		int alarmCount = service.selectAlarmCount(memberId);
		// 보낼 메시지
		TextMessage tm = new TextMessage(String.valueOf(alarmCount));
		// 메시지 보낼 대상 조회
		WebSocketSession s = memberList.get(memberId);

		// 해당 회원이 있는 경우 알림 수 전달
		if (s != null) {
			try {
				//System.out.println("알림 수 : " + tm);
				s.sendMessage(tm);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}