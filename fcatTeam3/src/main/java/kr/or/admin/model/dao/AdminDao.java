package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.Board;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int inserBoard(Board b) {
		int result = sqlSession.insert("admin.insertBoard",b);
		return result;
	}

	public ArrayList<Board> selectBoardList() {
		List<Board> list = sqlSession.selectList("admin.boardList");
		return (ArrayList<Board>)list;
	}

	public int deleteBoard(int boardNo) {
		int result = sqlSession.delete("admin.deleteBoard");
		return result;
	}
}
