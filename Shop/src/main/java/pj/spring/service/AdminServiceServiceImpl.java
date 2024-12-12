package pj.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.AdminDAO;
import pj.spring.vo.SearchVO;
import pj.spring.vo.UserVO;

@Service
public class AdminServiceServiceImpl implements AdminService {

	@Autowired
	public AdminDAO adminDAO;
	
	@Override
	public Map<String, Object> orderCount() {
		return adminDAO.orderCount();
	}

	@Override
	public Map<String, Object> cancelCount() {
		return adminDAO.cancelCount();
	}

	@Override
	public Map<String, Object> contentCount() {
		return adminDAO.contentCount();
	}

	@Override
	public List<UserVO> userList(Map<String, Integer> pagingParam) {
		return adminDAO.userList(pagingParam);
	}
	
	@Override
	public int selectTotal() {
		return adminDAO.selectTotal();
	}
	
	

}
