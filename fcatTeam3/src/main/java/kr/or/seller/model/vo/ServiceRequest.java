package kr.or.seller.model.vo;

public class ServiceRequest {
	// service_request 테이블
	private int srNo;
	private int fsNo;
	private String requestId;
	private int srState;

	// join용 컬럼 - 카테고리 + 서비스 제목 + 서비스 제공자
	private String fsCategory;
	private String fsChildCategory;
	private String fsTitle;
	private String fsWriter;

	public ServiceRequest() {
		super();
	}

	public ServiceRequest(int srNo, int fsNo, String requestId, int srState, String fsCategory, String fsChildCategory,
			String fsTitle, String fsWriter) {
		super();
		this.srNo = srNo;
		this.fsNo = fsNo;
		this.requestId = requestId;
		this.srState = srState;
		this.fsCategory = fsCategory;
		this.fsChildCategory = fsChildCategory;
		this.fsTitle = fsTitle;
		this.fsWriter = fsWriter;
	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public int getFsNo() {
		return fsNo;
	}

	public void setFsNo(int fsNo) {
		this.fsNo = fsNo;
	}

	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public int getSrState() {
		return srState;
	}

	public void setSrState(int srState) {
		this.srState = srState;
	}

	public String getFsCategory() {
		return fsCategory;
	}

	public void setFsCategory(String fsCategory) {
		this.fsCategory = fsCategory;
	}

	public String getFsChildCategory() {
		return fsChildCategory;
	}

	public void setFsChildCategory(String fsChildCategory) {
		this.fsChildCategory = fsChildCategory;
	}

	public String getFsTitle() {
		return fsTitle;
	}

	public void setFsTitle(String fsTitle) {
		this.fsTitle = fsTitle;
	}

	public String getFsWriter() {
		return fsWriter;
	}

	public void setFsWriter(String fsWriter) {
		this.fsWriter = fsWriter;
	}

}