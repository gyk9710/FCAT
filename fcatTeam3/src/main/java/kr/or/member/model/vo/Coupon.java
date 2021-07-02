package kr.or.member.model.vo;

public class Coupon {
	private int couponNo;
	private String couponName;
	private String couponContent;
	private String memberId;
	private String couponDiscount;
	private String startDate;
	private String endDate;
	private String couponStatus;
	
	public Coupon() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Coupon(int couponNo, String couponName, String couponContent, String memberId, String couponDiscount, String startDate,
			String endDate, String couponStatus) {
		super();
		this.couponNo = couponNo;
		this.couponName = couponName;
		this.couponContent = couponContent;
		this.memberId = memberId;
		this.couponDiscount = couponDiscount;
		this.startDate = startDate;
		this.endDate = endDate;
		this.couponStatus = couponStatus;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}



	public String getCouponName() {
		return couponName;
	}
	
	public String getMemberId() {
		return memberId;
	}



	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public String getCouponContent() {
		return couponContent;
	}



	public void setCouponContent(String couponContent) {
		this.couponContent = couponContent;
	}



	public String getCouponDiscount() {
		return couponDiscount;
	}



	public void setCouponDiscount(String couponDiscount) {
		this.couponDiscount = couponDiscount;
	}



	public String getStartDate() {
		return startDate;
	}



	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}



	public String getCouponStatus() {
		return couponStatus;
	}



	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}
	
}
