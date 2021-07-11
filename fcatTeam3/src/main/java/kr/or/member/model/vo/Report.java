package kr.or.member.model.vo;

public class Report {
	private int reportNo;
	private String reportCategory;
	private String reportContent;
	private int reportStatus;
	private String memberId;
	private int fsNo;
	private String reportDate;
	private String reportImage;

	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Report(int reportNo, String reportCategory, String reportContent, int reportStatus, String memberId,
			int fsNo, String reportDate, String reportImage) {
		super();
		this.reportNo = reportNo;
		this.reportCategory = reportCategory;
		this.reportContent = reportContent;
		this.reportStatus = reportStatus;
		this.memberId = memberId;
		this.fsNo = fsNo;
		this.reportDate = reportDate;
		this.reportImage = reportImage;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportCategory() {
		return reportCategory;
	}

	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public int getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(int reportStatus) {
		this.reportStatus = reportStatus;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getFsNo() {
		return fsNo;
	}

	public void setFsNo(int fsNo) {
		this.fsNo = fsNo;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportImage() {
		return reportImage;
	}

	public void setReportImage(String reportImage) {
		this.reportImage = reportImage;
	}


}
