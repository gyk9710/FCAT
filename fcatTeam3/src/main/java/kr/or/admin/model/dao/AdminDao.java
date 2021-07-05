package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.Board;
import kr.or.member.model.vo.Member;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int inserBoard(Board b) {
		int result = sqlSession.insert("admin.insertBoard",b);
		return result;
	}

	public ArrayList<Board> selectBoardList(HashMap<String, Object> map) {
		List<Board> list = sqlSession.selectList("admin.boardList", map);
		return (ArrayList<Board>)list;
	}
	
	public ArrayList<Board> selectBoardClassList(HashMap<String, Object> map) {
		List<Board> list = sqlSession.selectList("admin.boardClassList" , map);
		return (ArrayList<Board>)list;
	}

	public int deleteBoard(int boardNo) {
		int result = sqlSession.delete("admin.deleteBoard", boardNo);
		return result;
	}

//	public ArrayList<Member> selectMemberList() {
//		List<Member> list = sqlSession.selectList("admin.memberList");
//		return (ArrayList<Member>)list;
//	}
	
	public ArrayList<Member> selectMemberList(HashMap<String, Object> map) {
		List<Member> list = sqlSession.selectList("admin.memberList" , map);
		return (ArrayList<Member>)list;
	}

	public int noticeCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.noticeCount");
	}

	public int faqCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.faqCount");
	}
	
	public ArrayList<Member> selectMemberGradeList(HashMap<String, Object> map) {
		List<Member> list = sqlSession.selectList("admin.memberGradeList",map);
		return (ArrayList<Member>)list;
	}

	public int adminCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.adminCount");
	}

	public int memberCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.memberCount");
	}

	public int sellerCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.sellerCount");
	}

	public int totalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.totalMemberCount");
	}

	public int totalGradeCount(int grade) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.totalGradeCount",grade);
	}

	public int updateBoard(Board b) {
		// TODO Auto-generated method stub
		return sqlSession.update("admin.updateBoard" , b);
	}

	public Board selectOneBoard(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.selectOneBoard",boardNo);
	}

	public int totalBoardCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.totalBoardCount");
	}

	public int totalBoardClassCount(int boardClass) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.totalBoardClassCount",boardClass);
	}

	public ArrayList<Board> selectBoardListPage() {
		// TODO Auto-generated method stub
		List<Board> list = sqlSession.selectList("admin.selectBoardListPage");
		return (ArrayList<Board>)list;
		
	}

	public ArrayList<Board> noticeList() {
		// TODO Auto-generated method stub
		List<Board> list = sqlSession.selectList("admin.noticeList");
		return (ArrayList<Board>)list;
	}

	public ArrayList<Board> faqList() {
		// TODO Auto-generated method stub
		List<Board> list = sqlSession.selectList("admin.faqList");
		return (ArrayList<Board>)list;
	}

	public ArrayList<Member> searchMember(String keyword) {
		// TODO Auto-generated method stub
		List<Member> list = sqlSession.selectList("admin.searchMember",keyword);
		return (ArrayList<Member>)list;
	}

}
