package pj.spring.service;

import pj.spring.vo.UserVO;

public interface UserService {
	
	// 회원가입
	public int insert(UserVO userVO);

//	// 로그인
	public UserVO selectLogin(String username);

}
