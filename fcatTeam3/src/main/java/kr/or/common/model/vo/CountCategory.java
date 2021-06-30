package kr.or.common.model.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class CountCategory {

	private HashMap<String, Integer> motherCategory;
	private ArrayList<HashMap<String, Integer>> childCategory;
	private HashMap<String, Integer> lesson;
	private HashMap<String, Integer> home;
	private HashMap<String, Integer> event;
	private HashMap<String, Integer> business;
	private HashMap<String, Integer> design;
	private HashMap<String, Integer> health;
	private HashMap<String, Integer> alba;
	private HashMap<String, Integer> etc;

	public CountCategory() {
		super();

		etc = new HashMap<String, Integer>() {
			{
				put("맞춤옷제작", 0);
				put("패키지여행", 0);
				put("재무설계", 0);
				put("커스텀제작", 0);
				put("이모티콘제작", 0);
				put("악기조율", 0);
			}
		};
		event = new HashMap<String, Integer>() {
			{
				put("결혼식사회", 0);
				put("댄스공연", 0);
				put("행사MC", 0);
				put("파티기획", 0);
				put("영상편집", 0);
				put("의상대여", 0);
			}
		};
		lesson = new HashMap<String, Integer>() {
			{
				put("보컬레슨", 0);
				put("기타레슨", 0);
				put("수학과외", 0);
				put("영어과외", 0);
				put("PT", 0);
				put("골프레슨", 0);
			}
		};
		home = new HashMap<String, Integer>() {
			{
				put("집인테리어", 0);
				put("조명인테리어", 0);
				put("타일시공", 0);
				put("도배장판시공", 0);
				put("해충방역", 0);
				put("세탁기청소", 0);
			}
		};
		business = new HashMap<String, Integer>() {
			{
				put("회계/세무", 0);
				put("영상광고", 0);
				put("출판", 0);
				put("나레이션/더빙", 0);
				put("블로그마케팅", 0);
				put("현수막제작", 0);
			}
		};
		design = new HashMap<String, Integer>() {
			{
				put("제품디자인", 0);
				put("프레젠테이션디자인", 0);
				put("일러스트디자인", 0);
				put("로고디자인", 0);
				put("라벨디자인", 0);
				put("간판디자인", 0);
			}
		};
		health = new HashMap<String, Integer>() {
			{
				put("심리검사", 0);
				put("언어치료", 0);
				put("연극치료", 0);
				put("독서치료", 0);
				put("네일", 0);
				put("피부관리", 0);
			}
		};
		alba = new HashMap<String, Integer>() {
			{
				put("편의점알바", 0);
				put("배달알바", 0);
				put("포장알바", 0);
				put("사무보조알바", 0);
				put("서빙알바", 0);
				put("행사스텝", 0);
			}
		};
		motherCategory = new LinkedHashMap<String, Integer>() {
			{
				put("레슨", 0);
				put("홈/리빙", 0);
				put("이벤트", 0);
				put("비즈니스", 0);
				put("디자인/개발", 0);
				put("건강/미용", 0);
				put("알바", 0);
				put("기타", 0);
			}
		};

		childCategory = new ArrayList<HashMap<String, Integer>>();
		childCategory.add(lesson);
		childCategory.add(home);
		childCategory.add(event);
		childCategory.add(business);
		childCategory.add(design);
		childCategory.add(health);
		childCategory.add(alba);
		childCategory.add(etc);

	}

	public CountCategory(HashMap<String, Integer> motherCategory, ArrayList<HashMap<String, Integer>> childCategory,
			HashMap<String, Integer> lesson, HashMap<String, Integer> home, HashMap<String, Integer> event,
			HashMap<String, Integer> business, HashMap<String, Integer> design, HashMap<String, Integer> health,
			HashMap<String, Integer> alba, HashMap<String, Integer> etc) {
		super();
		this.motherCategory = motherCategory;
		this.childCategory = childCategory;
		this.lesson = lesson;
		this.home = home;
		this.event = event;
		this.business = business;
		this.design = design;
		this.health = health;
		this.alba = alba;
		this.etc = etc;
	}

	public HashMap<String, Integer> getMotherCategory() {
		return motherCategory;
	}

	public void setMotherCategory(HashMap<String, Integer> motherCategory) {
		this.motherCategory = motherCategory;
	}

	public ArrayList<HashMap<String, Integer>> getChildCategory() {
		return childCategory;
	}

	public void setChildCategory(ArrayList<HashMap<String, Integer>> childCategory) {
		this.childCategory = childCategory;
	}

	public HashMap<String, Integer> getLesson() {
		return lesson;
	}

	public void setLesson(HashMap<String, Integer> lesson) {
		this.lesson = lesson;
	}

	public HashMap<String, Integer> getHome() {
		return home;
	}

	public void setHome(HashMap<String, Integer> home) {
		this.home = home;
	}

	public HashMap<String, Integer> getEvent() {
		return event;
	}

	public void setEvent(HashMap<String, Integer> event) {
		this.event = event;
	}

	public HashMap<String, Integer> getBusiness() {
		return business;
	}

	public void setBusiness(HashMap<String, Integer> business) {
		this.business = business;
	}

	public HashMap<String, Integer> getDesign() {
		return design;
	}

	public void setDesign(HashMap<String, Integer> design) {
		this.design = design;
	}

	public HashMap<String, Integer> getHealth() {
		return health;
	}

	public void setHealth(HashMap<String, Integer> health) {
		this.health = health;
	}

	public HashMap<String, Integer> getAlba() {
		return alba;
	}

	public void setAlba(HashMap<String, Integer> alba) {
		this.alba = alba;
	}

	public HashMap<String, Integer> getEtc() {
		return etc;
	}

	public void setEtc(HashMap<String, Integer> etc) {
		this.etc = etc;
	}

}

//상위카테고리 해쉬로
//하위카테고리도 해쉬인데 어레이 리스트로 함 감싸자
//최소 2, 3 개의 정보가 있어야 연결이 가능 value를 객체로 선