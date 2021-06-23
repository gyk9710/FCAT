package kr.or.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.common.model.service.CommonService;
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

}
