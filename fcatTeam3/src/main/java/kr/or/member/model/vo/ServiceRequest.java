package kr.or.member.model.vo;

public class ServiceRequest {
	private int srNo;
	private int fsNo;
	private String requestId;
	private int srState;	
	
	public ServiceRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ServiceRequest(int srNo, int fsNo, String requestId, int srState) {
		super();
		this.srNo = srNo;
		this.fsNo = fsNo;
		this.requestId = requestId;
		this.srState = srState;
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

	
	
	
}
