package kr.or.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.Board;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao dao;

	public int insertBoard(Board b) {
		return dao.inserBoard(b);
	}

	public ArrayList<Board> selectBoardList() {
		// TODO Auto-generated method stub
		return dao.selectBoardList();
	}

	public int boardDelete(int boardNo) {
		int result=dao.deleteBoard(boardNo);
		return result;
	}
	
}
