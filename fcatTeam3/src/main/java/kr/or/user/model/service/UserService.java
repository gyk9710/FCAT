package kr.or.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.model.vo.Message;
import kr.or.user.model.dao.UserDao;

@Service
public class UserService {
	
	@Autowired
	private UserDao dao;
	
	public int sendRequest(Message msg) {
		// TODO Auto-generated method stub
		return dao.sendRequest(msg);
	}

	

}
