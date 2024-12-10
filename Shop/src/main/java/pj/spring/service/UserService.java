package pj.spring.service;

import pj.spring.vo.UserVO;

public interface UserService {
	
	// 회원가입
	public int insert(UserVO userVO);

	// 아이디 중복 체크
	public int selectCntByUid(String user_id);
	
	// 로그인
	public UserVO selectLogin(String username);
}
