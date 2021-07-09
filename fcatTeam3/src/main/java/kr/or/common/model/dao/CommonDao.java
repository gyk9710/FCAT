package kr.or.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.Chat;
import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.QuestionService;
import kr.or.common.model.vo.Review;
import kr.or.common.model.vo.SaveChat;
import kr.or.common.model.vo.Search;
import kr.or.common.model.vo.SellerAsk;
import kr.or.common.model.vo.Tattle;
import kr.or.seller.model.vo.ServiceRequest;
import kr.or.seller.model.vo.ServiceRequestData;

@Repository
public class CommonDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 채팅 내용 저장
	public void insertChatMsg(SaveChat sc) {
		sqlSession.insert("common.insertChatMsg", sc);
	}

	// 1:1 채팅 리스트 조회
	public List<Chat> selectChatList(String memberId) {
		return sqlSession.selectList("common.selectChatList", memberId);
	}

	// 채팅 저장 내역 불러오기
	public List<SaveChat> selectSaveChatList(int chatNo) {
		return sqlSession.selectList("common.selectSaveChatList", chatNo);
	}

	public int insertTattle(Tattle t) {
		return sqlSession.insert("common.insertTattle", t);
	}

	public ArrayList<FService> selectSearchedFservice(Search search) {
		List<FService> list = sqlSession.selectList("common.selectSearchedFservice", search);
		return (ArrayList<FService>) list;
	}

	public int selectSearchedCountFservice(String keyword) {
		return sqlSession.selectOne("common.selectSearchedCountFservice", keyword);
	}

	public void serviceLike(HashMap<String, String> map) {
		sqlSession.insert("common.insertServiceLike", map);
	}

	public void serviceCancelLike(HashMap<String, String> map) {
		sqlSession.delete("common.deleteServiceLike", map);
	}

	public ArrayList<Integer> selectLike(String memberId) {
		List<Integer> likeList = sqlSession.selectList("common.selectLike", memberId);
		return (ArrayList<Integer>) likeList;
	}

	public ArrayList<FService> selectSearchedCategory(Search search) {
		List<FService> list = sqlSession.selectList("common.selectSearchedCategory", search);
		return (ArrayList<FService>) list;
	}

	public ArrayList<Review> selectReview(int fsNo) {
		List<Review> list = sqlSession.selectList("common.selectReview", fsNo);
		return (ArrayList<Review>) list;
	}

	public FService selectOneFService(int fsNo) {
		return sqlSession.selectOne("common.selectOneFSevice", fsNo);
	}

	public int selectOneLike(HashMap<String, String> map) {
		return sqlSession.selectOne("common.selectOneLike", map);
	}

	public ArrayList<FService> selectCategory(Search search) {
		List<FService> list = sqlSession.selectList("common.selectCategory", search);
		return (ArrayList<FService>) list;
	}

	public int selectCategoryTotalCount(String category) {
		return sqlSession.selectOne("common.selectCategoryTotalCount", category);
	}

	public int selectChildCategoryTotalCount(String childCategory) {
		return sqlSession.selectOne("common.selectChildCategoryTotalCount", childCategory);
	}

	public ArrayList<FService> selectAllCategory(Search search) {
		List<FService> list = sqlSession.selectList("common.selectAllCategory", search);
		return (ArrayList<FService>) list;
	}

	public ArrayList<FService> selectAllChildCategory(Search search) {
		List<FService> list = sqlSession.selectList("common.selectAllChildCategory", search);
		return (ArrayList<FService>) list;
	}

	public ArrayList<FService> selectChildCategory(Search search) {
		List<FService> list = sqlSession.selectList("common.selectChildCategory", search);
		return (ArrayList<FService>) list;
	}

	public int selectKeyWordAndChildCategoryTotalCount(HashMap<String, String> categoryAndKeywordMap) {
		return sqlSession.selectOne("common.selectKeyWordAndChildCategoryTotalCount", categoryAndKeywordMap);
	}

	public ArrayList<FService> selectSearchAndChildCategory(Search search) {
		List<FService> list = sqlSession.selectList("common.selectSearchAndChildCategory", search);
		return (ArrayList<FService>) list;
	}

	public ArrayList<FService> selectAllSearchAndChildCategory(Search search) {
		List<FService> list = sqlSession.selectList("common.selectAllSearchAndChildCategory", search);
		return (ArrayList<FService>) list;
	}

	public void insertQuestion(HashMap<String, String> map) {
		sqlSession.insert("common.insertQuestion", map);
	}

	public ArrayList<QuestionService> selectQuestion(int fsNo) {
		List<QuestionService> list = sqlSession.selectList("common.selectQuestion", fsNo);
		return (ArrayList<QuestionService>) list;
	}

	public void insertAnswer(HashMap<String, String> map) {
		sqlSession.insert("common.insertAnswer", map);
	}

	public ArrayList<QuestionService> selectAnswer(int fsNo) {
		List<QuestionService> list = sqlSession.selectList("common.selectAnswer", fsNo);
		return (ArrayList<QuestionService>) list;
	}

	public void deleteComment(int qNo) {
		sqlSession.delete("common.deleteComment", qNo);

	}

	public int insertSeller(SellerAsk sa) {
		return sqlSession.insert("common.insertSeller", sa);

	}

	public List<ServiceRequest> selectSrList(ServiceRequestData srd) {
		return sqlSession.selectList("common.selectSrList", srd);
	}

}
