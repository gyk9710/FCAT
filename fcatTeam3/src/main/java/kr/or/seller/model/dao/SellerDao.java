package kr.or.seller.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fservice.model.vo.TestService;

@Repository
public class SellerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertService(TestService ts) {
		System.out.println(ts.getFsChildCategory());
		return sqlSession.insert("seller.insertService",ts);
	}
}
