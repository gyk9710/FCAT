package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class OneToOneChat extends TextWebSocketHandler{
	
	private ArrayList<WebSocketSession> sessionTemp;
	private ArrayList<WebSocketSession> sessionListBuyer;
	
	private ArrayList<WebSocketSession> sessionListCsManager;
	
	private HashMap<WebSocketSession,String> memberList;
	
	private HashMap<WebSocketSession,WebSocketSession> oneToOneRoom;
	
	public OneToOneChat() {
		sessionTemp=new ArrayList<WebSocketSession>();
		sessionListBuyer=new ArrayList<WebSocketSession>();
		sessionListCsManager=new ArrayList<WebSocketSession>();
		memberList=new HashMap<WebSocketSession, String>();
		oneToOneRoom=new HashMap<WebSocketSession,WebSocketSession>(); 
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	System.out.println("클라이언트 접속");
	sessionTemp.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		
		JsonParser parser = new JsonParser();
		JsonElement element= parser.parse(message.getPayload());
		String type=element.getAsJsonObject().get("type").getAsString();
		String msg=element.getAsJsonObject().get("msg").getAsString();	
		
		
		System.out.println(type+","+msg);
		if(type.equals("csEnter"))
		{
			sessionListCsManager.add(session);
			sessionTemp.remove(session);
			memberList.put(session,msg);
			int count=sessionListBuyer.size();
			if(count>0)
			{
				WebSocketSession buyerSession=sessionListBuyer.get(0);
				String sendMessage="<p>"+msg+"님의 채팅방에"+ memberList.get(buyerSession) +"님이 참여했습니다.</p>";
				oneToOneRoom.put(session,buyerSession);
				oneToOneRoom.put(buyerSession,session);
				
				sessionListCsManager.remove(session);
				sessionListBuyer.remove(buyerSession);
				TextMessage tm=new TextMessage(sendMessage);
				buyerSession.sendMessage(tm);
				session.sendMessage(tm);
			}
		}
		
		if(type.equals("enter"))
		{
			sessionListBuyer.add(session);
			sessionTemp.remove(session);
			memberList.put(session,msg);
			int count=sessionListCsManager.size();
			System.out.println(count);
			if(count>0)
			{
				WebSocketSession csSession=sessionListCsManager.get(0);
				String sendMessage="<p>"+memberList.get(csSession)+"님의 채팅방에"+ msg +"님이 참여했습니다.</p>";				oneToOneRoom.put(session,csSession);
				oneToOneRoom.put(csSession,session);
				sessionListCsManager.remove(csSession);
				sessionListBuyer.remove(session);
				TextMessage tm=new TextMessage(sendMessage);
				csSession.sendMessage(tm);
				session.sendMessage(tm);
			}
		}
		
		if(type.equals("chat"))
		{
			WebSocketSession target=oneToOneRoom.get(session);
			if(target==null)
				return;
			String sendMessage="<div class='chat left'><span>"+memberList.get(session)+" : "+msg+"</span></div>";
			TextMessage tm=new TextMessage(sendMessage);
			target.sendMessage(tm);
		}
		
		
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String sendMessage="<p>"+memberList.get(session)+"님이 퇴장하셨습니다</p>";
		WebSocketSession target=oneToOneRoom.get(session);
		if(target!=null)
		{
		oneToOneRoom.replace(target, null);
		TextMessage tm=new TextMessage(sendMessage);
		target.sendMessage(tm);
		}
		
		oneToOneRoom.remove(session);
		memberList.remove(session);
		sessionListCsManager.remove(session);
		sessionListBuyer.remove(session);
		System.out.println("클라이언트 종료");
	}
}
