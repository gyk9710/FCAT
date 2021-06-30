package kr.or.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.Board;

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
	//회원리스트 이동 수정해야함
	@RequestMapping(value="/adminMember.do")
	public String adminMember() {
		return "admin/adminMember";
	}
	//고객센터 리스트 페이지
	@RequestMapping(value="/adminBoardList")
	public String adminBoardList(Model model) {
		ArrayList<Board> list = service.selectBoardList();
		model.addAttribute("list",list);
		return "admin/adminBoardList";
	}
	
	//고객센터 글쓰기 페이지 이동
	@RequestMapping(value="/adminBoardWriteFrm.do")
	public String adminBoardWrite() {
		return "admin/adminBoardWriteFrm";
	}
	@RequestMapping(value="/boardList.do")
	public String boardList(Model model) {
		ArrayList<Board> list = service.selectBoardList();
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
		model.addAttribute("loc","/");
		return "common/msg";
	}
	//고객센터 글 삭제
	@RequestMapping(value="adminBoardDelete.do")
	public String adminBoardDelete(int boardNo , Model model) {
		int result = service.boardDelete(boardNo);
		if(result>0) {
			model.addAttribute("msg","삭제완료");
		}else {
			model.addAttribute("msg","삭제실패");
		}
		model.addAttribute("loc","/adminBoardList.do");
		return "common/msg";
	}
}
