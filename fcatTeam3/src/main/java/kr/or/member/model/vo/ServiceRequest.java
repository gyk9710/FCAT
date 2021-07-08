package kr.or.member.model.vo;

public class ServiceRequest {
	private int srNo;
	private int srServiceNo;
	private String srRequestId;
	private int srState;	
	
	public ServiceRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ServiceRequest(int srNo, int srServiceNo, String srRequestId, int srState) {
		super();
		this.srNo = srNo;
		this.srServiceNo = srServiceNo;
		this.srRequestId = srRequestId;
		this.srState = srState;
	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public int getSrServiceNo() {
		return srServiceNo;
	}

	public void setSrServiceNo(int srServiceNo) {
		this.srServiceNo = srServiceNo;
	}

	public String getSrRequestId() {
		return srRequestId;
	}

	public void setSrRequestId(String srRequestId) {
		this.srRequestId = srRequestId;
	}

	public int getSrState() {
		return srState;
	}

	public void setSrState(int srState) {
		this.srState = srState;
	}
	
	
}
