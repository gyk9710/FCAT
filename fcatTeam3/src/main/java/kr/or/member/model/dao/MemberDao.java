package kr.or.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Coupon;
import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectOneMember(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneMember",m);
	}

	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertMember",m);
	}
	
	

	public int deleteMember(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.deleteMember",memberId);
	}
	/*
	public List<Coupon> selectAllCoupon(String memberId)
	{
		return sqlSession.selectList("member.selectAllCoupon",memberId);
	}
	public int insertCoupon(Coupon coupon)
	{
		return sqlSession.insert("member.insertCoupon",coupon);
	}
*/
}
