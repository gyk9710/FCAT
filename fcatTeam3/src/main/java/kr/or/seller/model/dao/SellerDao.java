package kr.or.seller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fservice.model.vo.TestService;

@Repository
public class SellerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;


	public int insertService(TestService fs) {
		System.out.println(fs.getFsChildCategory());
		return sqlSession.insert("seller.insertService",fs);
	}

	public List requestServiceList(int serviceNo) {
		return sqlSession.selectList("seller.requestServiceList", serviceNo);

	}
}
