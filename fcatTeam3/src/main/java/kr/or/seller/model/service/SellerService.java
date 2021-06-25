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
	
	public List requestServiceList(int serviceNo) {
		return dao.requestServiceList(serviceNo);

	}
}
