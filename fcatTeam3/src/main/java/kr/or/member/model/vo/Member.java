package kr.or.member.model.vo;

import java.sql.Date;

public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberAddr;
	private String memberEmail;
	private String enrollDate;
	private int grade;
	private int pfNo;
		
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String memberId, String memberPw, String memberName, String memberPhone, String memberAddr,
			String memberEmail, String enrollDate, int grade, int pfNo) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberAddr = memberAddr;
		this.memberEmail = memberEmail;
		this.enrollDate = enrollDate;
		this.grade = grade;
		this.pfNo = pfNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getPfNo() {
		return pfNo;
	}

	public void setPfNo(int pfNo) {
		this.pfNo = pfNo;
	}
	
	
	
}
