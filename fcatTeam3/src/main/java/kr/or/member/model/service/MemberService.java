package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.model.vo.FService;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Coupon;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public Member selectOneMember(Member m) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(m);
	}

	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return dao.insertMember(m);
	}
	
	public int deleteMember(String memberId) {
		// TODO Auto-generated method stub
		return dao.deleteMember(memberId);
	}
	
	public int insertCoupon(String memberId)
	{
		Coupon coupon = new Coupon();
		
		coupon.setMemberId(memberId);
		coupon.setCouponName("가입자쿠폰");
		coupon.setCouponContent("첫 가입에 대한 쿠폰입니다");
		coupon.setCouponDiscount("10");
		coupon.setCouponStatus("Y");
		
		return dao.insertCoupon(coupon);
	}

	
	public List<Coupon> selectAllCoupon(String memberId)
	{
		return dao.selectAllCoupon(memberId);
	}

	public ArrayList<Coupon> selectCoupon(String memberId) {
		return dao.selectCoupon(memberId);
	}

	public ArrayList<Integer> selectMemberLike(String memberId) {
		return dao.selectMemberLike(memberId);
	}

	public FService selectServiceLike(Integer item) {
		return dao.selectServiceLike(item);
	}

	public Member selectOneId(Member m) {
		return dao.selectOneId(m);
	}

	public int updateMember(Member m) {
		return dao.updateMember(m);
	}

	
}