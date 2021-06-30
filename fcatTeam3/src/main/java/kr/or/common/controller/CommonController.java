package kr.or.common.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.common.model.service.CommonService;
import kr.or.common.model.vo.CountCategory;
import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Paging;
import kr.or.common.model.vo.Review;
import kr.or.common.model.vo.Search;
import kr.or.common.model.vo.Tattle;
import kr.or.member.model.vo.Member;

@Controller
public class CommonController {

	@Autowired
	private CommonService service;

	// 신고 접수
	@Transactional
	@RequestMapping(value = "/insertTattle.do")
	public String insertTattle(Model model, Tattle t) {
		int result = service.insertTattle(t); // 신고 접수

		if (result > 0) { // 성공
			model.addAttribute("msg", "신고가 접수되었습니다.");
		} else { // 실패
			model.addAttribute("msg", "신고를 접수 할 수 없습니다.");
		}
		model.addAttribute("loc", "/");

		return "common/msg.jsp";
	}

	@RequestMapping(value = "/search.do")
	public String search(String keyword, HttpSession session, Model model, Paging page) {
//			@RequestParam(value = "nowPage", required = false) String nowPage) {
		Search search = new Search();
		Review review = new Review();
		ArrayList<Integer> likeList = new ArrayList<Integer>();
		ArrayList<FService> list = new ArrayList<FService>();
		if ((Member) session.getAttribute("m") != null) {
			Member member = (Member) session.getAttribute("m");
			likeList = service.selectLike(member.getMemberId());
			model.addAttribute("likeList", likeList);
		}
		int total = service.selectSearchedCountFservice(keyword);
		page = new Paging(total, 1);
		search.setStart(page.getStart());
		search.setEnd(page.getEnd());
		search.setKeyword(keyword);
		search.setSearchCount(NumberFormat.getInstance().format(total));
		list = service.selectSearchedFService(search);
		ArrayList<FService> listForCategory = service.selectSearchedCategory(search);
		CountCategory cc = new CountCategory();
		for (FService item : list) {
			
			// 가격 천단위 포맷
			item.setFsPriceAsString(NumberFormat.getInstance().format((item.getFsPrice())));
			
		}
//		 카테고리, 리뷰점수 설정
		for (FService item : listForCategory) {
			//전체 별점 필터 용
			//리뷰점수 가져와 객체에 넣기
			ArrayList<Review> reviewList = service.selectReview(item.getFsNo());
			for(Review rev : reviewList) {
				if (rev.getFsNo()==item.getFsNo()) {
					item.setReviewScore(item.getReviewScore()+ rev.getReviewScore());
					item.setReviewCount(item.getReviewCount()+1);
				}
			}
			item.setReviewScore(Math.round(item.getReviewScore()/item.getReviewCount()*100)/100.0);
			item.setReviewScoreAsStar((review.xxx(item.getReviewScore())));
			if(Double.isNaN(item.getReviewScoreAsStar())) {
				item.setReviewScoreAsStar(0);
			}
			System.out.println("fsNo: " + item.getFsNo());
			System.out.println("star: " + item.getReviewScoreAsStar());
//			while(item.getFsNo()==review.get)
//			item.setReviewScore();
			for (Entry<String, Integer> mother : cc.getMotherCategory().entrySet()) {
				if (mother.getKey().equals(item.getFsCategory())) {
					mother.setValue((mother.getValue() + 1));
					for (HashMap<String, Integer> childListItem : cc.getChildCategory()) {
						for (Entry<String, Integer> child : childListItem.entrySet()) {
							if (child.getKey().equals(item.getFsChildCategory())) {
								child.setValue(child.getValue() + 1);
							}
						}
					}
				}
			}
		}
		model.addAttribute("cc", cc);
		model.addAttribute("paging", page);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("listForCategory", listForCategory);
		return "search/search";
	}

	@RequestMapping(value = "/searchList.do")
	public String search(String keyword, Model model, Paging page, HttpSession session,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		Search search = new Search();
		ArrayList<Integer> likeList = new ArrayList<Integer>();
		if ((Member) session.getAttribute("m") != null) {
			Member member = (Member) session.getAttribute("m");
			likeList = service.selectLike(member.getMemberId());
			model.addAttribute("likeList", likeList);
		}
		int total = service.selectSearchedCountFservice(keyword);
		page = new Paging(total, Integer.parseInt(nowPage));
		search.setStart(page.getStart());
		search.setEnd(page.getEnd());
		search.setKeyword(keyword);
		search.setSearchCount(NumberFormat.getInstance().format(total));
		ArrayList<FService> list = service.selectSearchedFService(search);
		CountCategory cc = new CountCategory();
		ArrayList<FService> listForCategory = service.selectSearchedCategory(search);
		for (FService item : list) {
			// 가격 천단위 포맷
			item.setFsPriceAsString(NumberFormat.getInstance().format((item.getFsPrice())));
		}
//		 카테고리 설정
		for (FService item : listForCategory) {
			for (Entry<String, Integer> mother : cc.getMotherCategory().entrySet()) {
				if (mother.getKey().equals(item.getFsCategory())) {
					mother.setValue((mother.getValue() + 1));
					for (HashMap<String, Integer> childListItem : cc.getChildCategory()) {
						for (Entry<String, Integer> child : childListItem.entrySet()) {
							if (child.getKey().equals(item.getFsChildCategory())) {
								child.setValue(child.getValue() + 1);
							}
						}
					}
				}
			}
		}
		model.addAttribute("paging", page);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("cc", cc);
		return "search/search";
	}

	@ResponseBody
	@RequestMapping(value = "/serviceLike.do")
	public String searchLike(String memberId, String fsNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("fsNo", fsNo);
		service.serviceLike(map);
		return "/";
	}

	@ResponseBody
	@RequestMapping(value = "/serviceCancelLike.do")
	public String serviceCancelLike(String memberId, String fsNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("fsNo", fsNo);
		service.serviceCancelLike(map);
		return "/";
	}

}