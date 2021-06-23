package kr.or.seller.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.seller.model.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService service;

	// 테스트용 seller 마이 페이지
	@RequestMapping(value = "/sellerPage.do")
	public String dealChat() {
		return "seller/mypage";
	}

	@RequestMapping(value = "/serviceFrm.do")
	public String insertService() {
		return "seller/serviceFrm";
	}

	// 서비스 요청 리스트 조회
	@RequestMapping(value = "/requestServiceList.do")
	public String requestServiceList(Model model, int serviceNo) {
		// 서비스 요청 리스트
		List list = service.requestServiceList(serviceNo);

		model.addAttribute("list", list);

		return "seller/requestServiceList";
	}

}