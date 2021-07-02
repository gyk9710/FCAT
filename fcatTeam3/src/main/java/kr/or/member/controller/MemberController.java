package kr.or.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Coupon;
import kr.or.member.model.vo.Member;
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
			//List<Coupon> list=service.selectAllCoupon(member.getMemberId());
			//session.setAttribute("coupon", list);
			
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
			//service.insertCoupon(m.getMemberId());
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
	
	@RequestMapping(value="/payment.do")
	public String payment(HttpSession session) {
		return "member/payment";
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
	
}






















