package kr.or.common.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.model.dao.CommonDao;
import kr.or.common.model.vo.Chat;
import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Review;
import kr.or.common.model.vo.Search;
import kr.or.common.model.vo.Tattle;

@Service
public class CommonService {

	@Autowired
	private CommonDao dao;

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

	// 1:1 채팅 리스트 조회
	public List<Chat> selectChatList(String memberId) {
		return dao.selectChatList(memberId);
	}

	public FService selectOneFSerivce(int fsNo) {
		return dao.selectOneFService(fsNo);
	}

	public int selectOneLike(HashMap<String, String> map) {
		return dao.selectOneLike(map);
	}


}
