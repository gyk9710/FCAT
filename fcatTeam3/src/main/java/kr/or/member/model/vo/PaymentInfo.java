package kr.or.member.model.vo;

public class PaymentInfo {

	private String impCode;
	private String merchantUid;
	private String paymentName;
	private String amount;
	private String buyerEmail;
	private String buyerName;
	private String buyerPhone;
	private String buyerAddr;
	private String buyerPostcode;
	private String buyerId;
	private String sellerId;
	private int fsNo;

	public int getFsNo() {
		return fsNo;
	}

	public void setFsNo(int fsNo) {
		this.fsNo = fsNo;
	}

	public PaymentInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PaymentInfo(String impCode, String merchantUid, String paymentName, String amount, String buyerEmail,
			String buyerName, String buyerPhone, String buyerAddr, String buyerPostcode, String buyerId, String sellerId) {
		super();
		this.impCode = impCode;
		this.merchantUid = merchantUid;
		this.paymentName = paymentName;
		this.amount = amount;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerPhone = buyerPhone;
		this.buyerAddr = buyerAddr;
		this.buyerPostcode = buyerPostcode;
		this.buyerId = buyerId;
		this.sellerId = sellerId;
	}

	public String getImpCode() {
		return impCode;
	}

	public void setImpCode(String impCode) {
		this.impCode = impCode;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public String getPaymentName() {
		return paymentName;
	}

	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerPhone() {
		return buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	public String getBuyerAddr() {
		return buyerAddr;
	}

	public void setBuyerAddr(String buyerAddr) {
		this.buyerAddr = buyerAddr;
	}

	public String getBuyerPostcode() {
		return buyerPostcode;
	}

	public void setBuyerPostcode(String buyerPostcode) {
		this.buyerPostcode = buyerPostcode;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

}
