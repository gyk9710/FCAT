package kr.or.common.model.vo;

public class Search {
	int end;
	int start;
	String keyword;
	String searchCount;
	public Search(int end, int start, String keyword, String searchCount) {
		super();
		this.end = end;
		this.start = start;
		this.keyword = keyword;
		this.searchCount = searchCount;
	}
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getSearchCount() {
		return searchCount;
	}
	public void setSearchCount(String searchCount) {
		this.searchCount = searchCount;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
