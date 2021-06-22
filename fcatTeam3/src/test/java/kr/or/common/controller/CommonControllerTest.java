package kr.or.common.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트
@WebAppConfiguration // 클래스에서 설정파일 읽어 오기
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class CommonControllerTest {
	// 로그 기록용 객체 셍성
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Autowired
	private WebApplicationContext wac; // 설정파일 읽어 올 객체
	private MockMvc mockMvc; // 테스트 요청 및 결과용 객체

	// 사전 처리
	@Before
	public void setup() {
		// 설정 정보 읽어와, 테스트 요청 및 응답 처리용 객체 생성
		mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
		logger.info("테스트 준비");
	}

	@Test
	public void insertTattleTest() {
		logger.info("신고 기능 테스트 시작");

		// test01 유저가 
		try {
			mockMvc.perform(post("/insertTattle.do").param("victimId", "test01").param("attackerId", "test02")
					.param("ttCategory", "0").param("ttContent", "신고 잘 들어 갔나요??")).andDo(print())
					.andExpect(status().isOk());
			logger.info("신고 기능 테스트 성공");
		} catch (Exception e) {
			logger.error("신고 기능 테스트 실패");
			e.printStackTrace();
		}
	}

}
