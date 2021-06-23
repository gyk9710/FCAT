package kr.or.common.model.vo;

public class Tattle {
	private int ttNo;
	private String victimId;
	private String attackerId;
	private int ttCategory;
	private String ttContent;
	private String ttDate;

	public Tattle() {
		super();
	}

	public Tattle(int ttNo, String victimId, String attackerId, int ttCategory, String ttContent, String ttDate) {
		super();
		this.ttNo = ttNo;
		this.victimId = victimId;
		this.attackerId = attackerId;
		this.ttCategory = ttCategory;
		this.ttContent = ttContent;
		this.ttDate = ttDate;
	}

	public int getTtNo() {
		return ttNo;
	}

	public void setTtNo(int ttNo) {
		this.ttNo = ttNo;
	}

	public String getVictimId() {
		return victimId;
	}

	public void setVictimId(String victimId) {
		this.victimId = victimId;
	}

	public String getAttackerId() {
		return attackerId;
	}

	public void setAttackerId(String attackerId) {
		this.attackerId = attackerId;
	}

	public int getTtCategory() {
		return ttCategory;
	}

	public void setTtCategory(int ttCategory) {
		this.ttCategory = ttCategory;
	}

	public String getTtContent() {
		return ttContent;
	}

	public void setTtContent(String ttContent) {
		this.ttContent = ttContent;
	}

	public String getTtDate() {
		return ttDate;
	}

	public void setTtDate(String ttDate) {
		this.ttDate = ttDate;
	}

}