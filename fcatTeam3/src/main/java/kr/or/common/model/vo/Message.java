package kr.or.common.model.vo;

public class Message {
	private int msgNo;
	private String msgSender;
	private String msgReceiver;
	private String msgTitle;
	private String msgContent;
	private int msgStatus;
	private String msgDate;

	public Message() {
		super();
	}

	public Message(int msgNo, String msgSender, String msgReceiver, String msgTitle, String msgContent, int msgStatus,
			String msgDate) {
		super();
		this.msgNo = msgNo;
		this.msgSender = msgSender;
		this.msgReceiver = msgReceiver;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.msgStatus = msgStatus;
		this.msgDate = msgDate;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getMsgSender() {
		return msgSender;
	}

	public void setMsgSender(String msgSender) {
		this.msgSender = msgSender;
	}

	public String getMsgReceiver() {
		return msgReceiver;
	}

	public void setMsgReceiver(String msgReceiver) {
		this.msgReceiver = msgReceiver;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public int getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(int msgStatus) {
		this.msgStatus = msgStatus;
	}

	public String getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}

}