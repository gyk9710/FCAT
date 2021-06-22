package kr.or.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.Tattle;

@Repository
public class CommonDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertTattle(Tattle t) {
		return sqlSession.insert("common.insertTattle", t);
	}
}
