package kr.or.seller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

}