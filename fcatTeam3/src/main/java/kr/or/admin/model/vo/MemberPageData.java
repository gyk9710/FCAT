package kr.or.admin.model.vo;

import java.util.ArrayList;

import kr.or.member.model.vo.Member;

public class MemberPageData {
	private ArrayList<Member> list;
	private String PageNavi;
	public MemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberPageData(ArrayList<Member> list, String pageNavi) {
		super();
		this.list = list;
		PageNavi = pageNavi;
	}
	public ArrayList<Member> getList() {
		return list;
	}
	public void setList(ArrayList<Member> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return PageNavi;
	}
	public void setPageNavi(String pageNavi) {
		PageNavi = pageNavi;
	}
	
}
