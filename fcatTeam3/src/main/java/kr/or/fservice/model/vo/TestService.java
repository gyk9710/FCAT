package kr.or.fservice.model.vo;

public class TestService {
	private int fsNo;
	private String fsWriter;
	private String fsTitle;
	private String fscontent;
	private String fsCategory;
	private int fsPrice;
	private String fsworking;
	private String fsChildCategory;
	public TestService() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TestService(int fsNo, String fsWriter, String fsTitle, String fscontent, String fsCategory, int fsPrice,
			String fsworking, String fsChildCategory) {
		super();
		this.fsNo = fsNo;
		this.fsWriter = fsWriter;
		this.fsTitle = fsTitle;
		this.fscontent = fscontent;
		this.fsCategory = fsCategory;
		this.fsPrice = fsPrice;
		this.fsworking = fsworking;
		this.fsChildCategory = fsChildCategory;
	}
	public int getFsNo() {
		return fsNo;
	}
	public void setFsNo(int fsNo) {
		this.fsNo = fsNo;
	}
	public String getFsWriter() {
		return fsWriter;
	}
	public void setFsWriter(String fsWriter) {
		this.fsWriter = fsWriter;
	}
	public String getFsTitle() {
		return fsTitle;
	}
	public void setFsTitle(String fsTitle) {
		this.fsTitle = fsTitle;
	}
	public String getFscontent() {
		return fscontent;
	}
	public void setFscontent(String fscontent) {
		this.fscontent = fscontent;
	}
	public String getFsCategory() {
		return fsCategory;
	}
	public void setFsCategory(String fsCategory) {
		this.fsCategory = fsCategory;
	}
	public int getFsPrice() {
		return fsPrice;
	}
	public void setFsPrice(int fsPrice) {
		this.fsPrice = fsPrice;
	}
	public String getFsworking() {
		return fsworking;
	}
	public void setFsworking(String fsworking) {
		this.fsworking = fsworking;
	}
	public String getFsChildCategory() {
		return fsChildCategory;
	}
	public void setFsChildCategory(String fsChildCategory) {
		this.fsChildCategory = fsChildCategory;
	}

}
