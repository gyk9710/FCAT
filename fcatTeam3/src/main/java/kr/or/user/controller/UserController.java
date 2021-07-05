package kr.or.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.common.model.vo.Message;
import kr.or.user.model.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	
	@ResponseBody
	@RequestMapping(value="/sendRequest.do")
	public int sendRequest(Message msg) {
		return service.sendRequest(msg);
	}
}
