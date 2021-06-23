package kr.or.seller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.fservice.model.vo.TestService;
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
		return "seller/serviceFrm"; //web-inf/view 뒤에 .jsp자동
	}
	
	@RequestMapping(value="/service.do")
	public String service(TestService ts, Model model) {
		int result = service.insertService(ts);
		if(result>0) {
			model.addAttribute("msg","서비스등록을 요청하였습니다");
		}
		else {
			model.addAttribute("msg","서비스등록을 실패하였습니다");
		}
		model.addAttribute("loc","/");
		return "common/msg";
		
	}
	

}