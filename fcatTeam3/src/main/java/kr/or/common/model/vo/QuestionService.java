package kr.or.common.model.vo;

public class QuestionService {
	private int qNo;
	private String qContent;
	private int fsNo;
	private int qClass;
	private int qOrder;
	private int qIndex;
	private String qDate;
	private String memberId;

	public QuestionService() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QuestionService(int qNo, String qContent, int fsNo, int qClass, int qOrder, int qIndex, String qDate,
			String memberId) {
		super();
		this.qNo = qNo;
		this.qContent = qContent;
		this.fsNo = fsNo;
		this.qClass = qClass;
		this.qOrder = qOrder;
		this.qIndex = qIndex;
		this.qDate = qDate;
		this.memberId = memberId;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public int getFsNo() {
		return fsNo;
	}

	public void setFsNo(int fsNo) {
		this.fsNo = fsNo;
	}

	public int getqClass() {
		return qClass;
	}

	public void setqClass(int qClass) {
		this.qClass = qClass;
	}

	public int getqOrder() {
		return qOrder;
	}

	public void setqOrder(int qOrder) {
		this.qOrder = qOrder;
	}

	public int getqIndex() {
		return qIndex;
	}

	public void setqIndex(int qIndex) {
		this.qIndex = qIndex;
	}

	public String getqDate() {
		return qDate;
	}

	public void setqDate(String qDate) {
		this.qDate = qDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

}
