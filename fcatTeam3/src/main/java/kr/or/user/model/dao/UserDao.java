package kr.or.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.Message;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int sendRequest(Message msg) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertMs",msg);
	}

}
