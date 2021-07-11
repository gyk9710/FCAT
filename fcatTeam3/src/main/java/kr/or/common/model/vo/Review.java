package kr.or.common.model.vo;

public class Review {
	private int reviewNo;
	private int fsNo;
	private String fsWorking;
	private String fsChildCategory;
	private float reviewScore;
	private String reviewTitle;
	private String reviewContent;
	private String reviewPhoto;
	private String reviewDate;
	private String today;

	public double xxx(double x) {
		return Math.ceil(x * 2) / 2;
	}

	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNo, int fsNo, String fsWorking, String fsChildCategory, float reviewScore,
			String reviewTitle, String reviewContent, String reviewPhoto, String reviewDate, String today) {
		super();
		this.reviewNo = reviewNo;
		this.fsNo = fsNo;
		this.fsWorking = fsWorking;
		this.fsChildCategory = fsChildCategory;
		this.reviewScore = reviewScore;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewPhoto = reviewPhoto;
		this.reviewDate = reviewDate;
		this.today = today;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getFsNo() {
		return fsNo;
	}

	public void setFsNo(int fsNo) {
		this.fsNo = fsNo;
	}

	public String getFsWorking() {
		return fsWorking;
	}

	public void setFsWorking(String fsWorking) {
		this.fsWorking = fsWorking;
	}

	public String getFsChildCategory() {
		return fsChildCategory;
	}

	public void setFsChildCategory(String fsChildCategory) {
		this.fsChildCategory = fsChildCategory;
	}

	public float getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(float reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewPhoto() {
		return reviewPhoto;
	}

	public void setReviewPhoto(String reviewPhoto) {
		this.reviewPhoto = reviewPhoto;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

}
