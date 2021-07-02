package kr.or.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.Chat;
import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Review;
import kr.or.common.model.vo.Search;
import kr.or.common.model.vo.Tattle;

@Repository
public class CommonDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

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

	// 1:1 채팅 리스트 조회
	public List<Chat> selectChatList(String memberId) {
		return sqlSession.selectList("common.selectChatList", memberId);
	}

	public FService selectOneFService(int fsNo) {
		return sqlSession.selectOne("common.selectOneFSevice", fsNo);
	}

	public int selectOneLike(HashMap<String, String> map) {
		return sqlSession.selectOne("common.selectOneLike",map);
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

	
}
