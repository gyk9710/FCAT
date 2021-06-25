package kr.or.seller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 서비스 요청 리스트 조회
	public List requestServiceList(int serviceNo) {
		return sqlSession.selectList("seller.requestServiceList", serviceNo);
	}

	// 알람 수 조회
	public int selectAlarmCount(String memberId) {
		return sqlSession.selectOne("seller.selectAlarmCount", memberId);
	}
}
