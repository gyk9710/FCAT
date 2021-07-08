package kr.or.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.Board;
import kr.or.admin.model.vo.BoardpageData;
import kr.or.admin.model.vo.MemberPageData;
import kr.or.admin.model.vo.MemberVisitor;
import kr.or.common.model.vo.SellerAsk;
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
		model.addAttribute("loc","/adminBoardList.do?reqPage=1");
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
		model.addAttribute("loc","/adminBoardList.do?reqPage=1");
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
		model.addAttribute("loc","/adminBoardList.do?reqPage=1");
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
	
	//관리자페이지 회원 검색
	@RequestMapping(value="searchMember.do")
	public String searchMember(Model model , String keyword ) {
		ArrayList<Member> list = service.searchMember(keyword);
		int adminCount = service.adminCount();
		int memberCount = service.memberCount();
		int sellerCount = service.sellerCount();
		model.addAttribute("list" , list);
		model.addAttribute("adminCount", adminCount);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("sellerCount", sellerCount);
		return "admin/adminMember";
	}
	
	@RequestMapping(value="/adminSeller.do")
	public String adminSeller(Model model) {
		ArrayList<SellerAsk> list = service.adminSeller();
		model.addAttribute("list",list);
		return "admin/adminSeller";
	}
	
	@Transactional
	@RequestMapping(value = "/updateGrade.do")
	public String updateGrade(Model model, String memberId , int saNo) {
		//Member member = service.selectOneMember(memberId);
		
		int result = service.updateGrade(memberId);
		int result1 = service.deleteSeller(saNo);
		if(result>0 && result1 >0) {
			model.addAttribute("msg","승인 완료 되었습니다.");
		}else {
			model.addAttribute("msg","승인 실패");
		}
		
		model.addAttribute("loc","/adminSeller.do");
		return "common/msg";
		
	}
	
	//대시보드 전체 회원수
	@ResponseBody
	@RequestMapping(value="allMemberCount.do")
	public int allMemberCount() {
		return service.allMemberCount();
	}
	
	//대시보드 오늘 방문자수
	@ResponseBody
	@RequestMapping(value="todayVisitor.do")
	public int todayVisitor() {
		return service.todayVisitor();
	}	
	
	//대시보드 방문자 차트
	@ResponseBody
	@RequestMapping(value="memberVisitor.do",produces = "application/json; charset:utf-8")
	public String memberVisitor() {
		MemberVisitor visitor = service.memberVisitor();
		return new Gson().toJson(visitor);
	}		
	
}
