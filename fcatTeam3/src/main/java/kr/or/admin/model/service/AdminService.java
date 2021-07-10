package kr.or.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.Board;
import kr.or.admin.model.vo.BoardpageData;
import kr.or.admin.model.vo.JoinMember;
import kr.or.admin.model.vo.MemberPageData;
import kr.or.admin.model.vo.MemberVisitor;
import kr.or.common.model.vo.SellerAsk;
import kr.or.member.model.vo.Member;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao dao;

	public int insertBoard(Board b) {
		return dao.inserBoard(b);
	}

	//관리자페이지에서 고객센터 리스트 불러오기 + 페이지네비
	public BoardpageData selectBoardList(int reqPage) {
		//1. 한페이지에 게시물을 몇개 보여줄지 : 한 페이지당 10개씩 보여줌 
		int numPerPage = 10;		//한 페이지당 게시물 10개를 변수 처리
		//reqPage를 통해서 게시물 시작 rnum 끝 rnum 계산
		//1페이지 시작 : 1, 끝 : 10 , 2페이지 시작: 11  끝 20 , 3페이지 시작 21 끝 30 .....
		int end = reqPage*numPerPage;		//게시물 끝은 현재페이지*페이지당게시물(10)
		int start = end - numPerPage + 1 ;	//게시물 시작은 끝페이지-페이지당게시물(10)+1; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end", end);
		map.put("start", start);
		//요청한 페이지의 게시물을 조회
		ArrayList<Board> list = dao.selectBoardList(map);
		//페이지 네비게이션 제작
		//1) 전체 페이지수를 구해야함
		//전체 게시물 수 조회		select count(*)from notice; -> 전체 게시물의 갯수 조회 쿼리
		int totalCount = dao.totalBoardCount();		//전달해줄 인자 없음
		//전체 페이지 수 계산
		int totalPage = 0;  //총 페이지변수 생성
		if(totalCount%numPerPage == 0) {			//총게시물수와 페이지당게시물(10)의 몫이 0일때 (ex.총게시물 20개)
			totalPage = totalCount/numPerPage;		//총 페이지 = 총게시물20/페이지당게시물10 = 2페이지
		}else {
			totalPage = totalCount/numPerPage+1;	//몫이 0이 아닐경우 (ex.25) 총 페이지 = 총게시물25/페이지당게시물10+1 = 3페이지
		}
		//페이지 네비 길이 지정
		int pageNaviSize = 5;	// 페이지 1~5까지 출력
		//1~5페이지 요청시 페이지 네비 시작 번호 :1
		//6~10페이지 요청하면 페이지 네비 시작번호 :6
		//11~15페이지 요청하면 페이지 네비 시작번호 :11
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;	//pageNO = 요청한페이지-1/출력할페이지(5) * 출력할페이지(5)+1 (ex.요청페이지 4일때 ((4-1)/5)*5+1 = 1
		//페이지네비 시작
		String pageNavi = "<ul class='pagination justify-content-center'>";
		//페이지 네비 시작번호가 1이 아닌경우 이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/adminBoardList.do?reqPage="+(pageNo-1)+"'>&lt</a></li>";	//&lt < 이전 기호
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' href='/adminBoardList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/adminBoardList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {		
				break;
			}
		}
		//다음버튼 생성
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/adminBoardList.do?reqPage="+(pageNo)+"'>&gt</a></li>";	//&gt > 다음 기호
		}
		pageNavi += "</ul>";
		BoardpageData bpd = new BoardpageData(list,pageNavi);	//list도 리턴해줘야하고 pageNavi도 리턴해줘야 하는대 자바는 한개만 리턴가능 -> 객체만들어서 리턴
		return bpd;						
	}
	
	//관리자페이지에서 고객센터 리스트 분류별 불러오기 + 페이지네비
	public BoardpageData selectBoardClassList(int reqPage , int boardClass) {
		//1. 한페이지에 게시물을 몇개 보여줄지 : 한 페이지당 10개씩 보여줌 
		int numPerPage = 10;		//한 페이지당 게시물 10개를 변수 처리
		//reqPage를 통해서 게시물 시작 rnum 끝 rnum 계산
		//1페이지 시작 : 1, 끝 : 10 , 2페이지 시작: 11  끝 20 , 3페이지 시작 21 끝 30 .....
		int end = reqPage*numPerPage;		//게시물 끝은 현재페이지*페이지당게시물(10)
		int start = end - numPerPage + 1 ;	//게시물 시작은 끝페이지-페이지당게시물(10)+1; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end", end);
		map.put("start", start);
		map.put("boardClass", boardClass);
		//요청한 페이지의 게시물을 조회
		ArrayList<Board> list = dao.selectBoardClassList(map);
		//페이지 네비게이션 제작
		//1) 전체 페이지수를 구해야함
		//전체 게시물 수 조회		select count(*)from notice; -> 전체 게시물의 갯수 조회 쿼리
		int totalCount = dao.totalBoardClassCount(boardClass);		//전달해줄 인자 없음
		//전체 페이지 수 계산
		int totalPage = 0;  //총 페이지변수 생성
		if(totalCount%numPerPage == 0) {			//총게시물수와 페이지당게시물(10)의 몫이 0일때 (ex.총게시물 20개)
			totalPage = totalCount/numPerPage;		//총 페이지 = 총게시물20/페이지당게시물10 = 2페이지
		}else {
			totalPage = totalCount/numPerPage+1;	//몫이 0이 아닐경우 (ex.25) 총 페이지 = 총게시물25/페이지당게시물10+1 = 3페이지
		}
		//페이지 네비 길이 지정
		int pageNaviSize = 5;	// 페이지 1~5까지 출력
		//1~5페이지 요청시 페이지 네비 시작 번호 :1
		//6~10페이지 요청하면 페이지 네비 시작번호 :6
		//11~15페이지 요청하면 페이지 네비 시작번호 :11
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;	//pageNO = 요청한페이지-1/출력할페이지(5) * 출력할페이지(5)+1 (ex.요청페이지 4일때 ((4-1)/5)*5+1 = 1
		//페이지네비 시작
		String pageNavi = "<ul class='pagination justify-content-center'>";
		//페이지 네비 시작번호가 1이 아닌경우 이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/adminBoardList.do?reqPage="+(pageNo-1)+"&boardClass="+boardClass+"'>&lt</a></li>";	//&lt < 이전 기호
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' href='/adminBoardList.do?reqPage="+pageNo+"&boardClass="+boardClass+"'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/adminBoardList.do?reqPage="+pageNo+"&boardClass="+boardClass+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {		
				break;
			}
		}
		//다음버튼 생성
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/adminBoardList.do?reqPage="+(pageNo)+"&boardClass="+boardClass+"'>&gt</a></li>";	//&gt > 다음 기호
		}
		pageNavi += "</ul>";
		BoardpageData bpd = new BoardpageData(list,pageNavi);	//list도 리턴해줘야하고 pageNavi도 리턴해줘야 하는대 자바는 한개만 리턴가능 -> 객체만들어서 리턴
		return bpd;						
	}

	//고객센터 게시물 삭제
	public boolean boardDelete(String num) {
		StringTokenizer st1 = new StringTokenizer(num,"/");
		boolean result = true;
		while (st1.hasMoreTokens()) {
			int boardNo = Integer.parseInt(st1.nextToken());
			int result1 = dao.deleteBoard(boardNo);
			if(result1 == 0) {
				result = false;
				break;
			}
		}
		return result;
	}

	//관리자페이지에서 멤버리스트 불러오기 + 페이지네비
	public MemberPageData selectMemberList(int reqPage) {
		//1. 한페이지에 게시물을 몇개 보여줄지 : 한 페이지당 10개씩 보여줌 
		int numPerPage = 10;		//한 페이지당 게시물 10개를 변수 처리
		//reqPage를 통해서 게시물 시작 rnum 끝 rnum 계산
		//1페이지 시작 : 1, 끝 : 10 , 2페이지 시작: 11  끝 20 , 3페이지 시작 21 끝 30 .....
		int end = reqPage*numPerPage;		//게시물 끝은 현재페이지*페이지당게시물(10)
		int start = end - numPerPage + 1 ;	//게시물 시작은 끝페이지-페이지당게시물(10)+1; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end", end);
		map.put("start", start);
		//요청한 페이지의 게시물을 조회
		ArrayList<Member> list = dao.selectMemberList(map);
		//페이지 네비게이션 제작
		//1) 전체 페이지수를 구해야함
		//전체 게시물 수 조회		select count(*)from notice; -> 전체 게시물의 갯수 조회 쿼리
		int totalCount = dao.totalCount();		//전달해줄 인자 없음
		//전체 페이지 수 계산
		int totalPage = 0;  //총 페이지변수 생성
		if(totalCount%numPerPage == 0) {			//총게시물수와 페이지당게시물(10)의 몫이 0일때 (ex.총게시물 20개)
			totalPage = totalCount/numPerPage;		//총 페이지 = 총게시물20/페이지당게시물10 = 2페이지
		}else {
			totalPage = totalCount/numPerPage+1;	//몫이 0이 아닐경우 (ex.25) 총 페이지 = 총게시물25/페이지당게시물10+1 = 3페이지
		}
		//페이지 네비 길이 지정
		int pageNaviSize = 5;	// 페이지 1~5까지 출력
		//1~5페이지 요청시 페이지 네비 시작 번호 :1
		//6~10페이지 요청하면 페이지 네비 시작번호 :6
		//11~15페이지 요청하면 페이지 네비 시작번호 :11
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;	//pageNO = 요청한페이지-1/출력할페이지(5) * 출력할페이지(5)+1 (ex.요청페이지 4일때 ((4-1)/5)*5+1 = 1
		//페이지네비 시작
		String pageNavi = "<ul class='pagination justify-content-center'>";
		//페이지 네비 시작번호가 1이 아닌경우 이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/adminMember.do?reqPage="+(pageNo-1)+"'>&lt</a></li>";	//&lt < 이전 기호
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' href='/adminMember.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/adminMember.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {		
				break;
			}
		}
		//다음버튼 생성
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/adminMember.do?reqPage="+(pageNo)+"'>&gt</a></li>";	//&gt > 다음 기호
		}
		pageNavi += "</ul>";
		MemberPageData mpd = new MemberPageData(list,pageNavi);	//list도 리턴해줘야하고 pageNavi도 리턴해줘야 하는대 자바는 한개만 리턴가능 -> 객체만들어서 리턴
		return mpd;						
	}
	
	//관리자페이지 고객센터리스트에서 표시 될 공지사항 총 갯수 
	public int noticeCount() {
		// TODO Auto-generated method stub
		return dao.noticeCount();
	}
	
	///관리자페이지 고객센터리스트에서 표시 될 faq총 갯수
	public int faqCount() {
		// TODO Auto-generated method stub
		return dao.faqCount();
	}
	
	//관리자페이지에서 멤버 등급별 리스트 + 페이지네비
	public MemberPageData selectMemberGradeList(int reqPage , int grade) {
		//1. 한페이지에 게시물을 몇개 보여줄지 : 한 페이지당 10개씩 보여줌 
		int numPerPage = 10;		//한 페이지당 게시물 10개를 변수 처리
		//reqPage를 통해서 게시물 시작 rnum 끝 rnum 계산
		//1페이지 시작 : 1, 끝 : 10 , 2페이지 시작: 11  끝 20 , 3페이지 시작 21 끝 30 .....
		int end = reqPage*numPerPage;		//게시물 끝은 현재페이지*페이지당게시물(10)
		int start = end - numPerPage + 1 ;	//게시물 시작은 끝페이지-페이지당게시물(10)+1; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end", end);
		map.put("start", start);
		map.put("grade", grade);
		//요청한 페이지의 게시물을 조회
		ArrayList<Member> list = dao.selectMemberGradeList(map);
		//페이지 네비게이션 제작
		//1) 전체 페이지수를 구해야함
		//전체 게시물 수 조회		select count(*)from notice; -> 전체 게시물의 갯수 조회 쿼리
		int totalCount = dao.totalGradeCount(grade);		//전달해줄 인자 없음
		//전체 페이지 수 계산
		int totalPage = 0;  //총 페이지변수 생성
		if(totalCount%numPerPage == 0) {			//총게시물수와 페이지당게시물(10)의 몫이 0일때 (ex.총게시물 20개)
			totalPage = totalCount/numPerPage;		//총 페이지 = 총게시물20/페이지당게시물10 = 2페이지
		}else {
			totalPage = totalCount/numPerPage+1;	//몫이 0이 아닐경우 (ex.25) 총 페이지 = 총게시물25/페이지당게시물10+1 = 3페이지
		}
		//페이지 네비 길이 지정
		int pageNaviSize = 5;	// 페이지 1~5까지 출력
		//1~5페이지 요청시 페이지 네비 시작 번호 :1
		//6~10페이지 요청하면 페이지 네비 시작번호 :6
		//11~15페이지 요청하면 페이지 네비 시작번호 :11
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;	//pageNO = 요청한페이지-1/출력할페이지(5) * 출력할페이지(5)+1 (ex.요청페이지 4일때 ((4-1)/5)*5+1 = 1
		//페이지네비 시작
		String pageNavi = "<ul class='pagination justify-content-center'>";
		//페이지 네비 시작번호가 1이 아닌경우 이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/memberGradeList.do?reqPage="+(pageNo-1)+"&grade="+grade+"'>&lt</a></li>";	//&lt < 이전 기호
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' href='/memberGradeList.do?reqPage="+pageNo+"&grade="+grade+"'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/memberGradeList.do?reqPage="+pageNo+"&grade="+grade+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {		
				break;
			}
		}
		//다음버튼 생성
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/memberGradeList.do?reqPage="+(pageNo)+"&grade="+grade+"'>&gt</a></li>";	//&gt > 다음 기호
		}
		pageNavi += "</ul>";
		MemberPageData mpd = new MemberPageData(list,pageNavi);	//list도 리턴해줘야하고 pageNavi도 리턴해줘야 하는대 자바는 한개만 리턴가능 -> 객체만들어서 리턴
		return mpd;						
	}

	//관리자페이지 멤버리스트에서 표시 될 관리자 회원 수
	public int adminCount() {
		// TODO Auto-generated method stub
		return dao.adminCount();
	}

	//관리자페이지 멤버리스트에서 표시 될 일반회원 회원 수
	public int memberCount() {
		// TODO Auto-generated method stub
		return dao.memberCount();
	}

	//관리자페이지 멤버리스트에서 표시 될 판매자 회원 수	
	public int sellerCount() {
		// TODO Auto-generated method stub
		return dao.sellerCount();
	}

	//고객센터 게시물 수정
	public int updateBoard(Board b) {
		// TODO Auto-generated method stub
		return dao.updateBoard(b);
	}

	//고객센터 게시물 수정을 위한 게시물 한개 선택
	public Board selectOneBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectOneBoard(boardNo);
	}

	
	public ArrayList<Board> selectBoardListPage() {
		return dao.selectBoardListPage();
	}

	public ArrayList<Board> noticeList() {
		// TODO Auto-generated method stub
		return dao.noticeList();
	}

	public ArrayList<Board> faqList() {
		// TODO Auto-generated method stub
		return dao.faqList();
	}

	public ArrayList<Member> searchMember(String keyword ) {
		// TODO Auto-generated method stub
		return dao.searchMember(keyword);
	}

	public int allMemberCount() {
		// TODO Auto-generated method stub
		return dao.allMemberCount();
	}

	public int todayVisitor() {
		// TODO Auto-generated method stub
		return dao.todayVisitor();
	}

	public MemberVisitor memberVisitor() {
		// TODO Auto-generated method stub
		return dao.memberVisitor();
	}

	public ArrayList<SellerAsk> adminSeller() {
		// TODO Auto-generated method stub
		return dao.adminSeller();
	}


	public Member selectOneMember(String memberId) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(memberId);
	}

	public int updateGrade(String memberId) {
		// TODO Auto-generated method stub
		return dao.updateMember(memberId);
	}

	public int deleteSeller(int saNo) {
		// TODO Auto-generated method stub
		return dao.deleteSeller(saNo);
	}

	public int totalPayment() {
		// TODO Auto-generated method stub
		return dao.totalPayment();
	}

	public String totalPay() {
		// TODO Auto-generated method stub
		return dao.totalPay();
	}

	public JoinMember joinMember() {
		// TODO Auto-generated method stub
		return dao.joinMember();
	}
	

}
