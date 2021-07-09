package kr.or.seller.model.vo;

public class ServiceRequestData {
	private String fsWriter;
	private int srState;

	public ServiceRequestData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ServiceRequestData(String fsWriter, int srState) {
		super();
		this.fsWriter = fsWriter;
		this.srState = srState;
	}

	public String getFsWriter() {
		return fsWriter;
	}

	public void setFsWriter(String fsWriter) {
		this.fsWriter = fsWriter;
	}

	public int getSrState() {
		return srState;
	}

	public void setSrState(int srState) {
		this.srState = srState;
	}

}
