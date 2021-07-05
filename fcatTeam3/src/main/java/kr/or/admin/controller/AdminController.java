package kr.or.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.Board;
import kr.or.admin.model.vo.BoardpageData;
import kr.or.admin.model.vo.MemberPageData;
import kr.or.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//관리자페이지 이동
	@RequestMapping(value="/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}

	//회원리스트
	@RequestMapping(value="/adminMember.do")
	public String adminMember(Model model, int reqPage) {
		MemberPageData mpd = service.selectMemberList(reqPage);
		int adminCount = service.adminCount();
		int memberCount = service.memberCount();
		int sellerCount = service.sellerCount();
		model.addAttribute("list",mpd.getList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		model.addAttribute("adminCount", adminCount);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("sellerCount", sellerCount);
		return "admin/adminMember";
	}

	//회원 등급별 리스트 조회 
	@RequestMapping(value="/memberGradeList.do")
	public String memberGradeList(Model model,  int reqPage , int grade) {
		MemberPageData mpd= service.selectMemberGradeList(reqPage,grade);
		int adminCount = service.adminCount();
		int memberCount = service.memberCount();
		int sellerCount = service.sellerCount();
		model.addAttribute("list",mpd.getList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		model.addAttribute("adminCount", adminCount);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("sellerCount", sellerCount);
		return "admin/adminMember";
	}	

	
	//고객센터 리스트 페이지
	@RequestMapping(value="/adminBoardList.do")
	public String adminBoardList(Model model , int reqPage) {
		BoardpageData bpd = service.selectBoardList(reqPage);
		int noticeCount = service.noticeCount();
		int faqCount = service.faqCount();
		model.addAttribute("list", bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("noticeCount", noticeCount);
		model.addAttribute("faqCount", faqCount);
		return "admin/adminBoardList";
	}
	
	//고객센터 분류별 리스트 페이지
	@RequestMapping(value="/adminBoardClassList")
	public String adminBoardClassList(Model model , int boardClass , int reqPage) {
		BoardpageData bpd = service.selectBoardClassList(reqPage,boardClass);
		int noticeCount = service.noticeCount();
		int faqCount = service.faqCount();
		model.addAttribute("list", bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		model.addAttribute("noticeCount", noticeCount);
		model.addAttribute("faqCount", faqCount);
		return "admin/adminBoardList";
	}

	
	//고객센터 글쓰기 페이지 이동
	@RequestMapping(value="/adminBoardWriteFrm.do")
	public String adminBoardWrite() {
		return "admin/adminBoardWriteFrm";
	}
	
	//고객센터 게시물 수정 페이지 이동
	@RequestMapping(value="/adminBoardUpdateFrm.do")
	public String adminBoardUpdateFrm(Model model , int boardNo) {
		Board board = service.selectOneBoard(boardNo);
		model.addAttribute("board",board);
		return "admin/adminBoardUpdateFrm";
	}
	
	//고객센터 게시물 수정 
	@RequestMapping(value="/adminBoardUpdate.do")
	public String adminBoardUpdate(Board b , Model model) {
		int result = service.updateBoard(b);
		if(result>0) {
			model.addAttribute("msg","수정완료");
		}else {
			model.addAttribute("msg","수정실패");
		}
		model.addAttribute("loc","/adminBoardList.do");
		return "common/msg";
	}
	
	
	//홈페이지 고객센터 이동
	@RequestMapping(value="/boardList.do")
	public String boardList(Model model) {
		ArrayList<Board> list = service.selectBoardListPage();
		model.addAttribute("list",list);
		return "board/boardList";
	}
	
	
	//고객센터 글쓰기
	@RequestMapping(value="/adminboardWrite.do")
	public String adminboardWrite(Board b, Model model) {
		int result = service.insertBoard(b);
		if(result>0) {
			model.addAttribute("msg","작성완료");
		}else {
			model.addAttribute("msg","작성실패");
		}
		model.addAttribute("loc","/adminBoardList.do");
		return "common/msg";
	}

	//고객센터 게시물 삭제
	@RequestMapping(value="adminBoardDelete.do")
	public String adminBoardDelete(String num , Model model) {
		boolean result = service.boardDelete(num);
		if(result) {
			model.addAttribute("msg","삭제완료");
		}else {
			model.addAttribute("msg","삭제실패");
		}
		model.addAttribute("loc","/adminBoardList.do");
		return "common/msg";
	}
	@RequestMapping(value="noticeList.do")
	public String noticeList(Model model) {
		ArrayList<Board> list = service.noticeList();
		model.addAttribute("list",list);
		return "board/noticeList";
	}
	
	@RequestMapping(value="faqList.do")
	public String faqList(Model model) {
		ArrayList<Board> list = service.faqList();
		model.addAttribute("list",list);
		return "board/faqList";
	}
}
