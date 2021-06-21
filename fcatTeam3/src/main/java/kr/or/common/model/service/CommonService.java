package kr.or.common.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.model.dao.CommonDao;
import kr.or.common.model.vo.Tattle;

@Service
public class CommonService {

	@Autowired
	private CommonDao dao;

	public int insertTattle(Tattle t) {
		return dao.insertTattle(t);
	}
}
