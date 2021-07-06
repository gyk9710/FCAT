package kr.or.common.model.vo;

public class Chat {
	private int chatNo;
	private String buyer;
	private String seller;

	public Chat() {
		super();
	}

	public Chat(int chatNo, String buyer, String seller) {
		super();
		this.chatNo = chatNo;
		this.buyer = buyer;
		this.seller = seller;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}
}