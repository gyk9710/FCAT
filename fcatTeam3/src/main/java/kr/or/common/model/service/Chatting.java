package kr.or.common.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.common.model.vo.SaveChat;

public class Chatting extends TextWebSocketHandler {
	@Autowired
	private CommonService service;

	private HashMap<String, WebSocketSession> chatMemberList; // 현재 접속한 세션 목록
	// private testId
	// private HashMap<String, String> chatRoom;// 나랑 채팅중인 채팅방

	// 로그인한 id, 받는 사람 id
	// 현재 선택된 대화창이면 대화 ++ / 그외는 알림 ++

	public Chatting() {
		chatMemberList = new HashMap<String, WebSocketSession>();
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

		// 접속
		if (type.equals("conn")) {
			String sessionId = element.getAsJsonObject().get("sessionId").getAsString();
			chatMemberList.put(sessionId, session);

			// 채팅
		} else if (type.equals("chat")) {
			String msg = element.getAsJsonObject().get("msg").getAsString();
			String receiver = element.getAsJsonObject().get("receiver").getAsString();
			String sender = element.getAsJsonObject().get("sender").getAsString();
			int chatNo = element.getAsJsonObject().get("chatNo").getAsInt();
			int scFlag = element.getAsJsonObject().get("scFlag").getAsInt();

			//System.out.println("채팅방 번호 : " + chatNo);

			String sendMsg = "<div class='chat left'><span class='chatId'>" + sender + " : </span>" + msg + "</div>";

			// db에 msg 저장
			SaveChat sc = new SaveChat();
			sc.setScContent(msg);
			sc.setScNo(chatNo);
			sc.setScFlag(scFlag);
			service.insertChatMsg(sc);

			WebSocketSession s = chatMemberList.get(receiver);

			// json 테스트
			JsonObject sendJson = new JsonObject();
			sendJson.addProperty("chatNo", chatNo); // 채팅방번호
			sendJson.addProperty("msg", sendMsg); // 메시지
			sendJson.addProperty("sender", sender); // 보낸이 전송
			
			//System.out.println("jsonTest : " + sendJson);
			//System.out.println("과연 이거는? : " + new Gson().toJson(sendJson));
			
			// 현재 접속한 클라이언트에 받는 사람이 있는 경우
			if (s != null) {
				TextMessage tm = new TextMessage(new Gson().toJson(sendJson));
				s.sendMessage(tm);
			}
		} else if (type.equals("loadChat")) {
			int chatNo = element.getAsJsonObject().get("chatNo").getAsInt(); // 번호 부르기
			String sender = element.getAsJsonObject().get("sender").getAsString(); // 보낸 이
			String receiver = element.getAsJsonObject().get("receiver").getAsString(); // 받는 이
			int flag = element.getAsJsonObject().get("flag").getAsInt(); // seller 추출

			// 채팅 저장 내용 불러오기
			List<SaveChat> list = service.selectSaveChatList(chatNo);

			// 메세지 객체
			String sendMsg = null;

			// 전송 - 자기 자신에게
			WebSocketSession s = chatMemberList.get(receiver);

			JsonObject sendJson = new JsonObject();
			sendJson.addProperty("reset", "초기화"); // 채팅방번호
			// 화면 초기화
			TextMessage tm = new TextMessage(new Gson().toJson(sendJson));
			//TextMessage tm = new TextMessage("초기화"); // 메시지 전송

			if (s != null) {
				s.sendMessage(tm);
			}

			// 메세지 전송
			for (SaveChat sc : list) {
				// 구매자 인 경우
				if (flag == 0) {
					// 송신
					if (sc.getScFlag() == 0) {
						sendMsg = "<div class='chat right'>" + sc.getScContent() + "</div>";
						// 수신
					} else if (sc.getScFlag() == 1) {
						sendMsg = "<div class='chat left'><span class='chatId'>" + sender + " : </span>"
								+ sc.getScContent() + "</div>";
					}
					// 판매자인 경우
				} else if (flag == 1) {
					// 송신
					if (sc.getScFlag() == 1) {
						sendMsg = "<div class='chat right'>" + sc.getScContent() + "</div>";
					} else if (sc.getScFlag() == 0) {
						sendMsg = "<div class='chat left'><span class='chatId'>" + sender + " : </span>"
								+ sc.getScContent() + "</div>";
					}
				}

				// 현재 접속한 클라이언트에 받는 사람이 있는 경우
				if (s != null) {
					sendJson = new JsonObject();
					sendJson.addProperty("msg", sendMsg); // 채팅방번호
					sendJson.addProperty("chatNo", chatNo);
					tm = new TextMessage(new Gson().toJson(sendJson)); // 메시지 전송
					s.sendMessage(tm);
				}
			} // for
		} // loadChat
	}

	// 클라이언트 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 세션 리스트 key 확인 : 종료 된 session을 value로 가지고 있는 key 조회
		for (String key : chatMemberList.keySet()) {
			if (session.equals(chatMemberList.get(key))) { // 해당하는 key 있는 경우
				chatMemberList.remove(key); // 해당 클라이언트 제거
				// System.out.println("클라이언트 제거 성공!");
				break;
			}
		}
	}
}
