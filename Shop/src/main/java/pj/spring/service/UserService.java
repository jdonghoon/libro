package pj.spring.service;

import java.util.List;

import pj.spring.vo.AddressBookVO;
import pj.spring.vo.UserVO;

public interface UserService {
	
	// 회원가입
	public int insert(UserVO userVO);

	// 로그인
	public UserVO selectLogin(String username);

	// 아이디 중복 체크
	public int selectCntByUid(String user_id);
	
	// 주소록 목록
	public List<AddressBookVO> list(String user_id);
	
	// 주소록 등록
	public int addrinsert(AddressBookVO addressbookVO);
}
