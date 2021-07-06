package kr.or.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.member.model.dao.MemberDao;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Coupon;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.PaymentInfo;
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/login";
	}
	
	@RequestMapping(value="/login.do")
	public String login(Member m,HttpSession session,Model model) {
		Member member = service.selectOneMember(m);
		if(member!=null) {
			session.setAttribute("m", member);
			model.addAttribute("msg", "로그인 성공");
			List<Coupon> list=service.selectAllCoupon(member.getMemberId());
			session.setAttribute("coupon", list);
			
		}else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 입력해주세요");			
		}
		model.addAttribute("loc", "/");
		return "common/msg";
		
	}
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/joinCheck.do")
	public String joinCheck() {
		return "member/joinCheck";
	}
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	@RequestMapping(value="/join.do")
	public String join(Member m,HttpServletRequest request, Model model) {
		String addr=
				request.getParameter("addr1")+" "+
				request.getParameter("addr2")+" "+
				request.getParameter("addr3");
		m.setMemberAddr(addr);
		
		String email=
				m.getMemberEmail()+
				request.getParameter("selectEmail");
		m.setMemberEmail(email);
		
		int result = service.insertMember(m);
		if(result>0) {
			model.addAttribute("msg","회원가입 성공");
			service.insertCoupon(m.getMemberId());
		}else {
			model.addAttribute("msg","회원가입 실패");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	@RequestMapping(value="/idCheck.do")
	@ResponseBody
	public String idCheck(Member m) {
		Member member=service.selectOneMember(m);
		if(member==null)
			return "1";
		return "0";
		
	}
	
	
	
			
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(HttpSession session,Model model) {
		Member m=(Member)session.getAttribute("m");
		int result=service.deleteMember(m.getMemberId());
		if(result>0) {
			session.invalidate();
			model.addAttribute("msg","bye bye");			
		}else {
			model.addAttribute("msg","에러발생");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	@RequestMapping(value="/getCouponList.do",produces = "application/json;charset=utf-8")
	@ResponseBody //
	public String getCouponList(String memberId)
	{
		List<Coupon> list=service.selectAllCoupon(memberId);
		System.out.println(memberId);
		for(int i=0;i<list.size();++i)
		System.out.println(list.get(0).getCouponName());
		return new Gson().toJson(list);
	}
	@RequestMapping(value="/couponChange.do")
	@ResponseBody
	public String couponChange(String couponName, Member m) {		
		Coupon coupon =service.selectAllCoupon(m.getMemberId(), couponName);
		return new Gson().toJson(coupon);
	}
	@RequestMapping(value="/payment1.do")
	public String payment1(HttpSession session) {
		return "member/payment1";
	}
	@RequestMapping(value="/afterpayment.do")
	public String afterpayment(HttpServletRequest request) {
		Coupon coupon=new Coupon();
		coupon.setCouponName(request.getParameter("couponName"));
		coupon.setMemberId(request.getParameter("memberId"));
		
		System.out.println(request.getParameter("impCode")+" "+
		 request.getParameter("merchantUid")+" "+
		 request.getParameter("paymentName")+" "+
		 request.getParameter("amount")+" "+
		 request.getParameter("buyerEmail")+" "+
		 request.getParameter("buyerName")+" "+
		 request.getParameter("buyerPhone")+" "+
		 request.getParameter("buyerAddr")+" "+
		 request.getParameter("buyerPostcode")+" "+
		 request.getParameter("buyerId")+" "+
		 request.getParameter("sellerId"));
		
		PaymentInfo paymentInfo=new PaymentInfo();
		paymentInfo.setImpCode(request.getParameter("impCode"));
		paymentInfo.setMerchantUid(request.getParameter("merchantUid"));
		paymentInfo.setPaymentName(request.getParameter("paymentName"));
		paymentInfo.setAmount(request.getParameter("amount"));
		paymentInfo.setBuyerEmail(request.getParameter("buyerEmail"));
		paymentInfo.setBuyerName(request.getParameter("buyerName"));
		paymentInfo.setBuyerPhone(request.getParameter("buyerPhone"));
		paymentInfo.setBuyerAddr(request.getParameter("buyerAddr"));
		paymentInfo.setBuyerPostcode(request.getParameter("buyerPostcode"));
		paymentInfo.setBuyerId(request.getParameter("buyerId"));
		paymentInfo.setSellerId(request.getParameter("sellerId"));

		

		
		int result1=service.insertPaymentInfo(paymentInfo);
		if(result1>0) {
			System.out.println("거래내역 삽입 완료");
		}else {
			 System.out.println("거래내역 삽입 실패");			
		}
		
		int result = service.deleteCoupon(coupon);
		if(result>0) {
			System.out.println("쿠폰삭제 완료");
		}else {
			 System.out.println("쿠폰삭제 못했어요");			
		}
		return "redirect:/";
	}
	@RequestMapping(value="/main.do")
	public String main() {
		return "redirect:/";
	}
	
	@RequestMapping(value = "/userMyPage.do")
	public String userMyPage(HttpSession session,Model model) {
		Member m=(Member)session.getAttribute("m");
		ArrayList<Coupon> couponList = service.selectCoupon(m.getMemberId());
		ArrayList<Integer> likeList = service.selectMemberLike(m.getMemberId());
		model.addAttribute("couponList",couponList);
		return "member/myPage";
	}
	

}






















