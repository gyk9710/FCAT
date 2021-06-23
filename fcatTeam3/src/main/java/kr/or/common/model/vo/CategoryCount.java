package kr.or.common.model.vo;

public class CategoryCount {
	int lesson;
	int home;
	int event;
	int business;
	int design;
	int health;
	int alba;
	int etc;
	
	int designApp;
	int etcMovie;
	int businessMarketing;
	public CategoryCount(int lesson, int home, int event, int business, int design, int health, int alba, int etc,
			int designApp, int etcMovie, int businessMarketing) {
		super();
		this.lesson = lesson;
		this.home = home;
		this.event = event;
		this.business = business;
		this.design = design;
		this.health = health;
		this.alba = alba;
		this.etc = etc;
		this.designApp = designApp;
		this.etcMovie = etcMovie;
		this.businessMarketing = businessMarketing;
	}
	public int getBusinessMarketing() {
		return businessMarketing;
	}
	public void setBusinessMarketing(int businessMarketing) {
		this.businessMarketing = businessMarketing;
	}
	public int getDesignApp() {
		return designApp;
	}
	public void setDesignApp(int designApp) {
		this.designApp = designApp;
	}
	public int getEtcMovie() {
		return etcMovie;
	}
	public void setEtcMovie(int etcMovie) {
		this.etcMovie = etcMovie;
	}
	public CategoryCount() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getLesson() {
		return lesson;
	}
	public void setLesson(int lesson) {
		this.lesson = lesson;
	}
	public int getHome() {
		return home;
	}
	public void setHome(int home) {
		this.home = home;
	}
	public int getEvent() {
		return event;
	}
	public void setEvent(int event) {
		this.event = event;
	}
	public int getBusiness() {
		return business;
	}
	public void setBusiness(int business) {
		this.business = business;
	}
	public int getDesign() {
		return design;
	}
	public void setDesign(int design) {
		this.design = design;
	}
	public int getHealth() {
		return health;
	}
	public void setHealth(int health) {
		this.health = health;
	}
	public int getAlba() {
		return alba;
	}
	public void setAlba(int alba) {
		this.alba = alba;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
}
