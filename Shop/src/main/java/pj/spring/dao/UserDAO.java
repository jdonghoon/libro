package pj.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	public int insert(UserVO userVO) {
		
		int result = 0;
		
		result = sqlSession.insert("pj.spring.mapper.userMapper.userInsert", userVO);
		
		return result;
		
	}

//	public int update(UserVO userVO) {
//		return sqlSession.update("pj.spring.mapper.userMapper.userUpdate", userVO);
//	}

	public UserVO selectLogin(String username) {
		
		return sqlSession.selectOne("pj.spring.mapper.userMapper.selectUserByLogin", username);
		
	}
}
