package kr.or.common.model.vo;

public class SaveChat {
	private int scNo;
	private String scContent;
	private int scFlag;
	private String scTime;

	public SaveChat() {
		super();
	}

	public SaveChat(int scNo, String scContent, int scFlag, String scTime) {
		super();
		this.scNo = scNo;
		this.scContent = scContent;
		this.scFlag = scFlag;
		this.scTime = scTime;
	}

	public int getScNo() {
		return scNo;
	}

	public void setScNo(int scNo) {
		this.scNo = scNo;
	}

	public String getScContent() {
		return scContent;
	}

	public void setScContent(String scContent) {
		this.scContent = scContent;
	}

	public int getScFlag() {
		return scFlag;
	}

	public void setScFlag(int scFlag) {
		this.scFlag = scFlag;
	}

	public String getScTime() {
		return scTime;
	}

	public void setScTime(String scTime) {
		this.scTime = scTime;
	}

}