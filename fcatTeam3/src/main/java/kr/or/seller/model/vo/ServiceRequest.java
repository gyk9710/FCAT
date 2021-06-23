package kr.or.seller.model.vo;

public class ServiceRequest {
	private int srNo;
	private int serviceNo;
	private String requestId;
	private String fsCategory;
	private String fsChildCategory;

	public ServiceRequest() {
		super();
	}

	public ServiceRequest(int srNo, int serviceNo, String requestId, String fsCategory, String fsChildCategory) {
		super();
		this.srNo = srNo;
		this.serviceNo = serviceNo;
		this.requestId = requestId;
		this.fsCategory = fsCategory;
		this.fsChildCategory = fsChildCategory;
	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public int getServiceNo() {
		return serviceNo;
	}

	public void setServiceNo(int serviceNo) {
		this.serviceNo = serviceNo;
	}

	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
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

}
