package kr.or.common.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.common.model.dao.CommonDao;
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

@Service
public class CommonService {

	@Autowired
	private CommonDao dao;

	
	// 채팅 내용 저장
	@Transactional
	public void insertChatMsg(SaveChat sc) {
		dao.insertChatMsg(sc);
	}
	
	// 채팅 저장 내역 불러오기
	public List<SaveChat> selectSaveChatList(int chatNo) {
		return dao.selectSaveChatList(chatNo);
	}

	// 1:1 채팅 리스트 조회
	public List<Chat> selectChatList(String memberId) {
		return dao.selectChatList(memberId);
	}

	public int insertTattle(Tattle t) {
		return dao.insertTattle(t);
	}

	public ArrayList<FService> selectSearchedFService(Search search) {
		return dao.selectSearchedFservice(search);
	}

	public int selectSearchedCountFservice(String keyword) {
		return dao.selectSearchedCountFservice(keyword);
	}

	public void serviceLike(HashMap<String, String> map) {
		dao.serviceLike(map);
	}

	public void serviceCancelLike(HashMap<String, String> map) {
		dao.serviceCancelLike(map);
	}

	public ArrayList<Integer> selectLike(String memberId) {
		return dao.selectLike(memberId);
	}

	public ArrayList<FService> selectSearchedCategory(Search search) {
		return dao.selectSearchedCategory(search);
	}

	public ArrayList<Review> selectReview(int fsNo) {
		return dao.selectReview(fsNo);
	}

	public FService selectOneFSerivce(int fsNo) {
		return dao.selectOneFService(fsNo);
	}

	public int selectOneLike(HashMap<String, String> map) {
		return dao.selectOneLike(map);
	}

	public ArrayList<FService> selectCategory(Search search) {
		return dao.selectCategory(search);
	}

	public int selectCategoryTotalCount(String category) {
		return dao.selectCategoryTotalCount(category);
	}

	public int selectChildCategoryTotalCount(String childCategory) {
		return dao.selectChildCategoryTotalCount(childCategory);
	}

	public ArrayList<FService> selectAllCategory(Search search) {
		return dao.selectAllCategory(search);
	}

	public ArrayList<FService> selectAllChildCategory(Search search) {
		return dao.selectAllChildCategory(search);
	}

	public ArrayList<FService> selectChildCategory(Search search) {
		return dao.selectChildCategory(search);
	}

	public int selectKeyWordAndChildCategoryTotalCount(HashMap<String, String> categoryAndKeywordMap) {
		return dao.selectKeyWordAndChildCategoryTotalCount(categoryAndKeywordMap);
	}

	public ArrayList<FService> selectSearchAndChildCategory(Search search) {

		return dao.selectSearchAndChildCategory(search);
	}

	public ArrayList<FService> selectAllSearchAndChildCategory(Search search) {
		return dao.selectAllSearchAndChildCategory(search);
	}

	public void insertQuestion(HashMap<String, String> map) {
		dao.insertQuestion(map);
	}

	public ArrayList<QuestionService> selectQuestion(int fsNo) {
		return dao.selectQuestion(fsNo);
	}

	public void insertAnswer(HashMap<String, String> map) {
		dao.insertAnswer(map);
	}

	public ArrayList<QuestionService> selectAnswer(int fsNo) {
		return dao.selectAnswer(fsNo);
	}

	public void deleteComment(int qNo) {
		dao.deleteComment(qNo);

	}

	public int insertSeller(SellerAsk sa) {
		return dao.insertSeller(sa);
	}

	// 판매자 서비스 요청 리스트 불러오기
	public List<ServiceRequest> selectSellerSrList(ServiceRequestData srd) {
		return dao.selectSellerSrList(srd);
	}
	
	// 구매자 서비스 요청 리스트 불러오기
	public List<ServiceRequest> selectBuyerSrList(ServiceRequestData srd) {
		return dao.selectBuyerSrList(srd);
	}

}
