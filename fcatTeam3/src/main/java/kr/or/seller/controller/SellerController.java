package kr.or.seller.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.common.model.vo.FService;
import kr.or.fservice.model.vo.TestService;
import kr.or.seller.model.service.SellerService;
import kr.or.seller.model.vo.ServiceRequest;

@Controller
public class SellerController {

	@Autowired
	private SellerService service;

	// 테스트용 seller 마이 페이지
	@RequestMapping(value = "/sellerPage.do")
	public String dealChat() {
		return "seller/mypage";
	}

	@RequestMapping(value = "/serviceFrm.do")
	public String insertService() {
		return "seller/serviceFrm"; // web-inf/view 뒤에 .jsp자동
	}

	
	@RequestMapping (value = "/fserviceFrm.do")
	public String fserviceFrm() {
		return "seller/fserviceFrm";
	}
	@RequestMapping (value = "/fservice.do")
	public String service(Model model, FService fs,MultipartFile file, HttpServletRequest request  ) {
		
		System.out.println("title : "+fs.getFsTitle());
		
		
		
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
			fs.setFsPhoto(filepath);
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
			
		int result = service.insertService(fs);
		if(result>0) {
			model.addAttribute("msg","서비스등록을 요청하였습니다");
		}
		else {
			model.addAttribute("msg","서비스등록을 실패하였습니다");
		}
		model.addAttribute("loc","/");
		return "common/msg";
		
	}

	// 서비스 요청 리스트 조회
	@RequestMapping(value = "/requestServiceList.do")
	public String requestServiceList(Model model, int serviceNo) {
		// 서비스 요청 리스트
		List<ServiceRequest> list = service.requestServiceList(serviceNo);

		model.addAttribute("list", list);
		model.addAttribute("serviceNo", serviceNo);

		return "seller/requestServiceList";
	}

	// 서비스 요청 리스트 삭제 - 승인 / 반려
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/confirmRequestService.do")
	public int confirmRequestService(int srNo) {
		return service.confirmRequestService(srNo);
	}

}