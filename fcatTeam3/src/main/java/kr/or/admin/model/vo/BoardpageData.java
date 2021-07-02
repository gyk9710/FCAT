package kr.or.admin.model.vo;

import java.util.ArrayList;

public class BoardpageData {
	private ArrayList<Board> list;
	private String PageNavi;
	public BoardpageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardpageData(ArrayList<Board> list, String pageNavi) {
		super();
		this.list = list;
		this.PageNavi = pageNavi;
	}
	public ArrayList<Board> getList() {
		return list;
	}
	public void setList(ArrayList<Board> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return PageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.PageNavi = pageNavi;
	}
	
}
