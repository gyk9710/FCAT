package kr.or.seller.model.vo;

public class TestMember {
	private String memberId;
	private int pfNo;
	private int grade;

	public TestMember() {
		super();
	}

	public TestMember(String memberId, int pfNo, int grade) {
		super();
		this.memberId = memberId;
		this.pfNo = pfNo;
		this.grade = grade;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getPfNo() {
		return pfNo;
	}

	public void setPfNo(int pfNo) {
		this.pfNo = pfNo;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

}