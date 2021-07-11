package kr.or.seller.model.vo;

public class ServiceRequestData {
	private String fsWriter;
	private String requestId;
	private int srState;

	public ServiceRequestData() {
		super();
	}

	public ServiceRequestData(String fsWriter, String requestId, int srState) {
		super();
		this.fsWriter = fsWriter;
		this.requestId = requestId;
		this.srState = srState;
	}

	public String getFsWriter() {
		return fsWriter;
	}

	public void setFsWriter(String fsWriter) {
		this.fsWriter = fsWriter;
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