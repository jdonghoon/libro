package pj.spring.service;

import java.util.List;
import java.util.Map;

import pj.spring.vo.SearchVO;
import pj.spring.vo.UserVO;

public interface AdminService {

	public Map<String, Object> orderCount();
	public Map<String, Object> cancelCount();
	public Map<String, Object> contentCount();
	public List<UserVO> userList(Map<String,Integer> pagingParam);
	public int selectTotal();
}
