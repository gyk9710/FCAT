package kr.or.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.common.model.service.CommonService;
import kr.or.common.model.vo.CategoryCount;
import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Tattle;

@Controller
public class CommonController {

	@Autowired
	private CommonService service;

	// 신고 접수 테스트
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
	public String search(String keyword, Model model) {
		ArrayList<FService> list = service.selectSearchedFService(keyword);
		System.out.println(list);
		CategoryCount cc = new CategoryCount();
		for (FService item : list) {
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
				
		model.addAttribute("list", list);
		model.addAttribute("count", cc);
		return "search/search";
	}
}
