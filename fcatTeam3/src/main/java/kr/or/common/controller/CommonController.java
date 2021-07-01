package kr.or.common.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.common.model.service.CommonService;
import kr.or.common.model.vo.CategoryCount;
import kr.or.common.model.vo.Chat;
import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Paging;
import kr.or.common.model.vo.Search;
import kr.or.common.model.vo.Tattle;
import kr.or.member.model.vo.Member;

@Controller
public class CommonController {

	@Autowired
	private CommonService service;

	// 1:1 채팅 창 이동 - 1:1 채팅 리스트 조회
	@RequestMapping(value = "/chatList.do")
	public String chatList(Model model, String memberId){
		// 현재 로그인한 회원의 채팅 List 받아와서 전달 해야 함
		List<Chat> list = service.selectChatList(memberId);
		
		model.addAttribute("list", list);
		return "common/chatList";
	}
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
		ArrayList<Integer> likeList = new ArrayList<Integer>();
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
		ArrayList<FService> list = service.selectSearchedFService(search);
		ArrayList<FService> listForCategory = service.selectSearchedCategory(search);
		CategoryCount cc = new CategoryCount(0,0,0,0,0,0,0,0,0,0,0); 
		////////////////////////////
		for (FService item : list) {
			// 가격 천단위 포맷
			item.setFsPriceAsString(NumberFormat.getInstance().format((item.getFsPrice())));
		}
		for(FService item: listForCategory) {
			if ("레슨".equals(item.getFsCategory())) {
				cc.setLesson(cc.getLesson() + 1);
			} else if ("홈/리빙".equals(item.getFsCategory())) {
				cc.setHome(cc.getHome() + 1);
			} else if ("이벤트".equals(item.getFsCategory())) {
				cc.setBusiness(cc.getEvent() + 1);
			} else if ("비즈니스".equals(item.getFsCategory())) {
				cc.setBusiness(cc.getBusiness() + 1);
			} else if ("디자인/개발".equals(item.getFsCategory())) {
				cc.setDesign(cc.getDesign() + 1);
			} else if ("건강/미용".equals(item.getFsCategory())) {
				cc.setHealth(cc.getHealth() + 1);
			} else if ("알바".equals(item.getFsCategory())) {
				cc.setAlba(cc.getAlba() + 1);
			} else if ("기타".equals(item.getFsCategory())) {
				cc.setEtcMovie(cc.getEtc() + 1);
			}
		}
		model.addAttribute("cc",cc);
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
		CategoryCount cc = new CategoryCount();
		for (FService item : list) {
			// 가격 천단위 포맷
			item.setFsPriceAsString(NumberFormat.getInstance().format((item.getFsPrice())));
			if ("디자인/개발".equals(item.getFsCategory())) {
				cc.setDesign(cc.getDesign() + 1);
			} else if ("모바일앱개발".equals(item.getFsChildCategory())) {
				cc.setDesign((cc.getDesignApp() + 1));
			} else if ("비즈니스".equals(item.getFsCategory())) {
				cc.setBusiness(cc.getBusiness() + 1);
			} else if ("마케팅".equals(item.getFsChildCategory())) {
				cc.setBusiness(cc.getBusinessMarketing() + 1);
			}
		}
		model.addAttribute("paging", page);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("cc",cc);
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