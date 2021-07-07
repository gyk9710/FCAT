package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Review;
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
	
	public List<Coupon> selectAllCoupon(String memberId)
	{
		return sqlSession.selectList("member.selectAllCoupon",memberId);
	}
	public int insertCoupon(Coupon coupon)
	{
		return sqlSession.insert("member.insertCoupon",coupon);
	}

	public ArrayList<Coupon> selectCoupon(String memberId) {
		List<Coupon> list = sqlSession.selectList("member.selectCoupon",memberId);
		return (ArrayList<Coupon>) list;
	}

	public ArrayList<Integer> selectMemberLike(String memberId) {
		List<Integer> list = sqlSession.selectList("member.selectMemberLike",memberId);
		return (ArrayList<Integer>) list;
	}

	public FService selectServiceLike(Integer item) {
		return sqlSession.selectOne("member.selectServiceLike",item);
	}

	public Member selectOneId(Member m) {
		return sqlSession.selectOne("member.selectOneId",m);
	}

	public int updateMember(Member m) {
		return sqlSession.update("member.updateOneMember",m);
	}

}
