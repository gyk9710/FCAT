package kr.or.seller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Message;
import kr.or.fservice.model.vo.TestService;
import kr.or.seller.model.vo.ServiceRequest;

@Repository
public class SellerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 서비스 요청 리스트 조회
	public List<ServiceRequest> requestServiceList(int serviceNo) {
		return sqlSession.selectList("seller.requestServiceList", serviceNo);

	}

	// 알람 수 조회
	public int selectAlarmCount(String memberId) {
		return sqlSession.selectOne("seller.selectAlarmCount", memberId);
	}

	// 서비스 요청 리스트 삭제 - 승인 / 반려
	public int confirmRequestService(int srNo) {
		return sqlSession.delete("seller.confirmRequestService", srNo);
	}

	// 서비스 수락 / 거절 MSG 보내기
	public int sendConfirmMsg(Message msg) {
		return sqlSession.insert("seller.sendConfirmMsg", msg);
	}

	public int insertService(FService fs) {
		return sqlSession.insert("seller.insertService",fs);
	}

	public List myserviceList(FService fs) {
		
		String writer = fs.getFsWriter();
		return sqlSession.selectList("seller.myserviceList",writer);
	}
}
