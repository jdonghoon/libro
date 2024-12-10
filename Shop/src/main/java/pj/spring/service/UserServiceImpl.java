package pj.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.UserDAO;
import pj.spring.vo.UserVO;

@Service // 업무로직을 담당하는 구현 객체를 스프링이 생성하여 관리
public class UserServiceImpl implements UserService {
	
	@Autowired
	public UserDAO userDAO;
	
	// 회원가입
	@Override
	public int insert(UserVO userVO){
		
		int result = 0;
		
		result = userDAO.insert(userVO);
		
		return result;
	}

	// 로그인
	@Override
	public UserVO selectLogin(String username){
		
		return userDAO.selectLogin(username);
	}

	@Override
	public int selectCntByUid(String user_id) {

		return userDAO.selectCntByUid(user_id);
	}

  }
