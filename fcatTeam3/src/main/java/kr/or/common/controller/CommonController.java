package kr.or.common.controller;

import java.text.NumberFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.common.model.service.CommonService;
import kr.or.common.model.vo.CategoryCount;
import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Paging;
import kr.or.common.model.vo.Search;
import kr.or.common.model.vo.Tattle;

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
	public String search(String keyword, Model model, Paging page) {
//			@RequestParam(value = "nowPage", required = false) String nowPage) {
		int total = service.selectSearchedCountFservice(keyword);
		page = new Paging(total, 1);
		Search search = new Search();
		search.setStart(page.getStart());
		search.setEnd(page.getEnd());
		search.setKeyword(keyword);
		search.setSearchCount(NumberFormat.getInstance().format(total));
		ArrayList<FService> list = service.selectSearchedFService(search);
		CategoryCount cc = new CategoryCount();
		for (FService item : list) {
			//가격 천단위 포맷
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
		return "search/search";
	}
	@RequestMapping(value = "/searchList.do")
	public String search(String keyword, Model model, Paging page,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		int total = service.selectSearchedCountFservice(keyword);
		page = new Paging(total, Integer.parseInt(nowPage));
		Search search = new Search();
		search.setStart(page.getStart());
		search.setEnd(page.getEnd());
		search.setKeyword(keyword);
		search.setSearchCount(NumberFormat.getInstance().format(total));
		ArrayList<FService> list = service.selectSearchedFService(search);
		CategoryCount cc = new CategoryCount();
		for (FService item : list) {
			//가격 천단위 포맷
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
		return "search/search";
	}
}