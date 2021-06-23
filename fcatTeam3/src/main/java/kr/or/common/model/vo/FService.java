package kr.or.common.model.vo;

public class FService {
	int fsNo;
	String fsWriter;
	String fsTitle;
	String fsContent;
	String fsCategory;
	int fsPrice;
	String fsWorking;
	String fsChildCategory;
	String fsPhoto;
	public FService() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getFsNo() {
		return fsNo;
	}
	public void setFsNo(int fsNo) {
		this.fsNo = fsNo;
	}
	public String getFsWriter() {
		return fsWriter;
	}
	public void setFsWriter(String fsWriter) {
		this.fsWriter = fsWriter;
	}
	public String getFsTitle() {
		return fsTitle;
	}
	public void setFsTitle(String fsTitle) {
		this.fsTitle = fsTitle;
	}
	public String getFsContent() {
		return fsContent;
	}
	public void setFsContent(String fsContent) {
		this.fsContent = fsContent;
	}
	public String getFsCategory() {
		return fsCategory;
	}
	public void setFsCategory(String fsCategory) {
		this.fsCategory = fsCategory;
	}
	public int getFsPrice() {
		return fsPrice;
	}
	public void setFsPrice(int fsPrice) {
		this.fsPrice = fsPrice;
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
	public String getFsPhoto() {
		return fsPhoto;
	}
	public void setFsPhoto(String fsPhoto) {
		this.fsPhoto = fsPhoto;
	}
	public FService(int fsNo, String fsWriter, String fsTitle, String fsContent, String fsCategory, int fsPrice,
			String fsWorking, String fsChildCategory, String fsPhoto) {
		super();
		this.fsNo = fsNo;
		this.fsWriter = fsWriter;
		this.fsTitle = fsTitle;
		this.fsContent = fsContent;
		this.fsCategory = fsCategory;
		this.fsPrice = fsPrice;
		this.fsWorking = fsWorking;
		this.fsChildCategory = fsChildCategory;
		this.fsPhoto = fsPhoto;
	}
}
