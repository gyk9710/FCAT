package kr.or.common.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Tattle;

@Repository
public class CommonDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertTattle(Tattle t) {
		return sqlSession.insert("common.insertTattle", t);
	}

	public ArrayList<FService> selectSearchedFservice(String keyword) {
		
		List<FService> list = sqlSession.selectList("common.selectSearchedFservice", keyword);
		return (ArrayList<FService>)list;
	}
}
