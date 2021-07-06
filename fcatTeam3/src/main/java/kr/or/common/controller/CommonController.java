package kr.or.common.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.common.model.service.CommonService;
import kr.or.common.model.vo.Chat;
import kr.or.common.model.vo.CountCategory;
import kr.or.common.model.vo.FService;
import kr.or.common.model.vo.Paging;
import kr.or.common.model.vo.QuestionService;
import kr.or.common.model.vo.Review;
import kr.or.common.model.vo.Search;
import kr.or.common.model.vo.SellerAsk;
import kr.or.common.model.vo.Tattle;
import kr.or.member.model.vo.Member;

@Controller
public class CommonController {

	@Autowired
	private CommonService service;

	// 1:1 채팅 창 이동 - 1:1 채팅 리스트 조회
	@RequestMapping(value = "/chatList.do")
	public String chatList(Model model, String memberId) {
		// 현재 로그인한 회원의 채팅 List 받아와서 전달 해야 함
		List<Chat> list = service.selectChatList(memberId);

		model.addAttribute("list", list);
		return "common/chatList";
	}

	//판매자 전환신청 페이지 이동
	@RequestMapping (value = "/sellerAskFrm.do")
	public String sellerAskFrm() {
		return "seller/sellerAskFrm";
	}
	//판매자 전환 신청
	@RequestMapping (value = "/sellerAsk.do")
	public String insertSeller(SellerAsk sa,MultipartFile file, HttpServletRequest request, Model model) {
		if(file.isEmpty()) {
			//첨부파일이 없는경우
		}else {
			//첨부파일이 있는경우 파일처리
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/seller/");
			String filename = file.getOriginalFilename();
			// 유저가 올린 파일명을 마지막 . 기준으로 분리 test.txt ->test_1.txt img01.jpg -> img01_1.jpg
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			
			String filepath= null;
			
			int count = 0;
			while (true) {
				if (count == 0) {
					filepath = onlyFilename + extention; // test.txt1
				} else {
					filepath = onlyFilename + "_" + count + extention; // test_1.txt
				}
				File checkFile = new File(savePath + filepath);
				if (!checkFile.exists()) {
					break;
				}
				count++;

			}
			sa.setSaProfile(filepath);
			System.out.println("filepath  :" + filepath) ;
			System.out.println(savePath);
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
		int result = service.insertSeller(sa);
		if(result>0) {
			model.addAttribute("msg","판매자 전환 신청이 완료되었습니다");
		}
		else {
			model.addAttribute("msg","판매자 전환 신청이 실패했습니다.");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	// 신고 접수
	@Transactional
	@RequestMapping(value = "/insertTattle.do")
	public String insertTattle(Model model, Tattle t) {
		int result = service.insertTattle(t); // 신고 접수

		if (result > 0) { // 성공
			model.addAttribute("msg", "신고가 접수되었습니다.");
		} else { // 실패
			model.addAttribute("msg", "신고를 접수 할 수 없습니다.");
		}
		model.addAttribute("loc", "/");

		return "common/msg.jsp";
	}

	@RequestMapping(value = "/search.do")
	public String search(String keyword, HttpSession session, Model model, Paging page) {
//			@RequestParam(value = "nowPage", required = false) String nowPage) {
		Search search = new Search();
		Review review = new Review();
		ArrayList<Integer> likeList = new ArrayList<Integer>();
		ArrayList<FService> list = new ArrayList<FService>();
		if ((Member) session.getAttribute("m") != null) {
			Member member = (Member) session.getAttribute("m");
			likeList = service.selectLike(member.getMemberId());
			model.addAttribute("likeList", likeList);
		}
		int total = service.selectSearchedCountFservice(keyword);
		page = new Paging(total, 1);
		search.setStart(page.getStart());
		search.setEnd(page.getEnd());
		search.setKeyword(keyword);
		search.setSearchCount(NumberFormat.getInstance().format(total));
		list = service.selectSearchedFService(search);
		ArrayList<FService> listForCategory = service.selectSearchedCategory(search);
		CountCategory cc = new CountCategory();
		for (FService item : list) {

			// 가격 천단위 포맷
			item.setFsPriceAsString(NumberFormat.getInstance().format((item.getFsPrice())));

		}
//		 카테고리, 리뷰점수 설정
		for (FService item : listForCategory) {
			// 전체 별점 필터 용
			// 리뷰점수 가져와 객체에 넣기
			ArrayList<Review> reviewList = service.selectReview(item.getFsNo());
			for (Review rev : reviewList) {
				if (rev.getFsNo() == item.getFsNo()) {
					item.setReviewScore(item.getReviewScore() + rev.getReviewScore());
					item.setReviewCount(item.getReviewCount() + 1);
				}
			}
			item.setReviewScore(Math.round(item.getReviewScore() / item.getReviewCount() * 100) / 100.0);
			item.setReviewScoreAsStar((review.xxx(item.getReviewScore())));
			if (Double.isNaN(item.getReviewScoreAsStar())) {
				item.setReviewScoreAsStar(0);
			}
//			while(item.getFsNo()==review.get)
//			item.setReviewScore();
			for (Entry<String, Integer> mother : cc.getMotherCategory().entrySet()) {
				if (mother.getKey().equals(item.getFsCategory())) {
					mother.setValue((mother.getValue() + 1));
					for (HashMap<String, Integer> childListItem : cc.getChildCategory()) {
						for (Entry<String, Integer> child : childListItem.entrySet()) {
							if (child.getKey().equals(item.getFsChildCategory())) {
								child.setValue(child.getValue() + 1);
							}
						}
					}
				}
			}
		}
		model.addAttribute("cc", cc);
		model.addAttribute("paging", page);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("listForCategory", listForCategory);
		return "search/search";
	}

	@RequestMapping(value = "/searchList.do")
	public String search(String keyword, Model model, Paging page, HttpSession session,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		Search search = new Search();
		Review review = new Review();
		ArrayList<Integer> likeList = new ArrayList<Integer>();
		if ((Member) session.getAttribute("m") != null) {
			Member member = (Member) session.getAttribute("m");
			likeList = service.selectLike(member.getMemberId());
			model.addAttribute("likeList", likeList);
		}
		int total = service.selectSearchedCountFservice(keyword);
		page = new Paging(total, Integer.parseInt(nowPage));
		search.setStart(page.getStart());
		search.setEnd(page.getEnd());
		search.setKeyword(keyword);
		search.setSearchCount(NumberFormat.getInstance().format(total));
		ArrayList<FService> list = service.selectSearchedFService(search);
		CountCategory cc = new CountCategory();
		ArrayList<FService> listForCategory = service.selectSearchedCategory(search);
		for (FService item : list) {
			// 가격 천단위 포맷
			item.setFsPriceAsString(NumberFormat.getInstance().format((item.getFsPrice())));
		}
//		 카테고리, 리뷰점수 설정
		for (FService item : listForCategory) {
			// 전체 별점 필터 용
			// 리뷰점수 가져와 객체에 넣기
			ArrayList<Review> reviewList = service.selectReview(item.getFsNo());
			for (Review rev : reviewList) {
				if (rev.getFsNo() == item.getFsNo()) {
					item.setReviewScore(item.getReviewScore() + rev.getReviewScore());
					item.setReviewCount(item.getReviewCount() + 1);
				}
			}
			item.setReviewScore(Math.round(item.getReviewScore() / item.getReviewCount() * 100) / 100.0);
			item.setReviewScoreAsStar((review.xxx(item.getReviewScore())));
			if (Double.isNaN(item.getReviewScoreAsStar())) {
				item.setReviewScoreAsStar(0);
			}
//			while(item.getFsNo()==review.get)
//			item.setReviewScore();
			for (Entry<String, Integer> mother : cc.getMotherCategory().entrySet()) {
				if (mother.getKey().equals(item.getFsCategory())) {
					mother.setValue((mother.getValue() + 1));
					for (HashMap<String, Integer> childListItem : cc.getChildCategory()) {
						for (Entry<String, Integer> child : childListItem.entrySet()) {
							if (child.getKey().equals(item.getFsChildCategory())) {
								child.setValue(child.getValue() + 1);
							}
						}
					}
				}
			}
		}
		model.addAttribute("paging", page);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("cc", cc);
		model.addAttribute("listForCategory", listForCategory);
		return "search/search";
	}

	@ResponseBody
	@RequestMapping(value = "/serviceLike.do")
	public String searchLike(String memberId, String fsNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("fsNo", fsNo);
		service.serviceLike(map);
		return "/";
	}

	@ResponseBody
	@RequestMapping(value = "/serviceCancelLike.do")
	public String serviceCancelLike(String memberId, String fsNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("fsNo", fsNo);
		service.serviceCancelLike(map);
		return "/";
	}

	@RequestMapping(value = "mypage.do")
	public String mypage() {
		return "/common/mypage";
	}
	@RequestMapping(value = "/serviceDetail.do")
	public String serviceDetail(int fsNo, Model model, HttpSession session) {
		FService fservice = service.selectOneFSerivce(fsNo);
		ArrayList<Review> reviewList = service.selectReview(fsNo);
		ArrayList<QuestionService> questionList = service.selectQuestion(fsNo);
		ArrayList<QuestionService> answerList = service.selectAnswer(fsNo);
		int like = 0;
		Review review = new Review();
		double score = 0;
		int count = 0;
		double starScore;
		if ((Member) session.getAttribute("m") != null) {
			Member member = (Member) session.getAttribute("m");
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberId", member.getMemberId());
			map.put("fsNo", Integer.toString(fsNo));
			try {
				like = service.selectOneLike(map);
			} catch (Exception e) {
			}
			if (like != 0) {
				model.addAttribute("like", like);
			}
		}
		for (Review rev : reviewList) {
			score = (score + rev.getReviewScore());
			count++;
		}
		for(QuestionService item : questionList) {
			System.out.println(item.getqContent());
		}
		score = Math.round(score / count * 100) / 100.0;
		starScore = ((review.xxx(score)));
		fservice.setFsPriceAsString(NumberFormat.getInstance().format((fservice.getFsPrice())));
		model.addAttribute("fs", fservice);
		session.setAttribute("fs", fservice);
		model.addAttribute("questionList", questionList);
		model.addAttribute("answerList", answerList);
		model.addAttribute("score", score);
		model.addAttribute("starScore", starScore);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("count", count);
		return "search/serviceDetail";
	}

	@RequestMapping(value = "/categorySearch.do")
	public String categorySearch(String category, String childCategory, Model model, Paging page, HttpSession session,
			String keyword, @RequestParam(value = "nowPage", required = false) String nowPage) {
		ArrayList<FService> list = new ArrayList<FService>();
		ArrayList<FService> listForCategory = new ArrayList<FService>();
		int total = 0;
		Search search = new Search();
		Review review = new Review();
		ArrayList<Integer> likeList = new ArrayList<Integer>();
		HashMap<String,String> categoryAndKeywordMap = new HashMap<String, String>();
		if ((Member) session.getAttribute("m") != null) {
			Member member = (Member) session.getAttribute("m");
			likeList = service.selectLike(member.getMemberId());
			model.addAttribute("likeList", likeList);
		}
		if (category != null && childCategory == null) {
			total = service.selectCategoryTotalCount(category);
		} else if (childCategory != null && keyword == null) {
			total = service.selectChildCategoryTotalCount(childCategory);
		} else if (childCategory != null && keyword != null) {
			categoryAndKeywordMap.put("childCategory", childCategory);
			categoryAndKeywordMap.put("keyword", keyword);
			total = service.selectKeyWordAndChildCategoryTotalCount(categoryAndKeywordMap);
		}
		page = new Paging(total, Integer.parseInt(nowPage));
		search.setStart(page.getStart());
		search.setEnd(page.getEnd());
		search.setSearchCount(NumberFormat.getInstance().format(total));
		// 상위카테고리 값만 받아온 경우
		if (category != null  && childCategory == null) {
			search.setKeyword(category);
			list = service.selectCategory(search);
			listForCategory = service.selectAllCategory(search);
			model.addAttribute("category" ,category);
			// 자식카테고리까지 받아 온  경우
		}else if (childCategory != null && keyword == null) {
			search.setKeyword(childCategory);
			list = service.selectChildCategory(search);
			listForCategory = service.selectAllChildCategory(search);
			model.addAttribute("category" , category);
			model.addAttribute("childCategory" , childCategory);
			//검색 시 추천 카테고리 클릭 한 경우
		}else if (childCategory != null && keyword != null) {
			search.setKeyword(keyword);
			search.setChildCategory(childCategory);
			list = service.selectSearchAndChildCategory(search);
			listForCategory = service.selectAllSearchAndChildCategory(search);
			model.addAttribute("category",category);
			model.addAttribute("childCategory",childCategory);
			model.addAttribute("keyword",keyword);
		}
		CountCategory cc = new CountCategory();

		for (FService item : list) {
			// 가격 천단위 포맷
			item.setFsPriceAsString(NumberFormat.getInstance().format((item.getFsPrice())));
		}
//		 카테고리, 리뷰점수 설정
		for (FService item : listForCategory) {
			// 전체 별점 필터 용
			// 리뷰점수 가져와 객체에 넣기
			ArrayList<Review> reviewList = service.selectReview(item.getFsNo());
			for (Review rev : reviewList) {
				if (rev.getFsNo() == item.getFsNo()) {
					item.setReviewScore(item.getReviewScore() + rev.getReviewScore());
					item.setReviewCount(item.getReviewCount() + 1);
				}
			}
			item.setReviewScore(Math.round(item.getReviewScore() / item.getReviewCount() * 100) / 100.0);
			item.setReviewScoreAsStar((review.xxx(item.getReviewScore())));
			if (Double.isNaN(item.getReviewScoreAsStar())) {
				item.setReviewScoreAsStar(0);
			}
//			while(item.getFsNo()==review.get)
//			item.setReviewScore();
			for (Entry<String, Integer> mother : cc.getMotherCategory().entrySet()) {
				if (mother.getKey().equals(item.getFsCategory())) {
					mother.setValue((mother.getValue() + 1));
					for (HashMap<String, Integer> childListItem : cc.getChildCategory()) {
						for (Entry<String, Integer> child : childListItem.entrySet()) {
							if (child.getKey().equals(item.getFsChildCategory())) {
								child.setValue(child.getValue() + 1);
							}
						}
					}
				}
			}
		}
		model.addAttribute("paging", page);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("cc", cc);
		model.addAttribute("listForCategory", listForCategory);
		return "search/categorySearch";
	}
	@ResponseBody
	@RequestMapping(value = "/insertQuestion.do")
	public String insertQuestion(String memberId, String fsNo, String getToday, String comment) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("fsNo", fsNo);
		map.put("getToday", getToday);
		map.put("comment", comment);
		service.insertQuestion(map);
		return "/";
	}
	@ResponseBody
	@RequestMapping(value = "/insertAnswer.do")
	public String insertAnswer(String memberId, String fsNo, String getToday, String comment, String qNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("fsNo", fsNo);
		map.put("getToday", getToday);
		map.put("comment", comment);
		map.put("qNo", qNo);
		service.insertAnswer(map);
		return "/";
	}
	@ResponseBody
	@RequestMapping(value = "/deleteComment.do")
	public String deleteComment(int qNo) {
		service.deleteComment(qNo);
		return "/";
	}
}