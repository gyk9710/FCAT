package kr.or.seller.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.fservice.model.vo.TestService;
import kr.or.seller.model.dao.SellerDao;

@Service
public class SellerService {

	@Autowired
	private SellerDao dao;


	public int insertService(TestService ts) {

		// TODO Auto-generated method stub
		return dao.insertService(ts);
	}
	
	// 서비스 요청 리스트 조회
	public List requestServiceList(int serviceNo) {
		return dao.requestServiceList(serviceNo);

	}

	// 알람 수 조회
	public int selectAlarmCount(String memberId) {
		return dao.selectAlarmCount(memberId);
	}
}
