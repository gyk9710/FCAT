package kr.or.seller.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Message;
import kr.or.fservice.model.vo.TestService;
import kr.or.seller.model.dao.SellerDao;
import kr.or.seller.model.vo.ServiceRequest;

@Service
public class SellerService {

	@Autowired
	private SellerDao dao;

	

	// 서비스 요청 리스트 조회
	public List<ServiceRequest> requestServiceList(int serviceNo) {
		return dao.requestServiceList(serviceNo);

	}

	// 알람 수 조회
	public int selectAlarmCount(String memberId) {
		return dao.selectAlarmCount(memberId);
	}

	// 서비스 요청 리스트 삭제 - 승인 / 반려
	public int confirmRequestService(int srNo) {
		return dao.confirmRequestService(srNo);
	}

	// 서비스 수락 / 거절 MSG 보내기
	public int sendConfirmMsg(Message msg) {
		return dao.sendConfirmMsg(msg);
	}

	public int insertService(FService fs) {
		return dao.insertService(fs);
	}

	public List myserviceList(FService fs) {
		System.out.println(fs.getFsWriter());
		return dao.myserviceList(fs);
	}

	public List mydeleteList(FService fs) {
		
		return dao.mydeleteList(fs);
	}

	public int myserviceDelete(int fsNo) {
		return dao.myserviceDelete(fsNo);
	}

	public FService selectMyservice(int fsNo) {
		return dao.selectMyservice(fsNo);
	}

	public int updateMyservice(FService fs) {
		return dao.updateMyservice(fs);
		
	}
}
