package kr.or.common.model.vo;

public class Chat {
	private int chatNo;
	private String receiver;
	private String sender;

	public Chat() {
		super();
	}

	public Chat(int chatNo, String receiver, String sender) {
		super();
		this.chatNo = chatNo;
		this.receiver = receiver;
		this.sender = sender;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

}