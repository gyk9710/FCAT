package kr.or.seller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List requestServiceList(int serviceNo) {
		return sqlSession.selectList("seller.requestServiceList", serviceNo);
	}
}
