package pj.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.AddressBookVO;
import pj.spring.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	private final String namespace = "pj.spring.mapper.userMapper";
	
	// 회원가입
	public int insert(UserVO userVO) {
		
		return sqlSession.insert(namespace + ".userInsert", userVO);
		
	}

	// 아이디 중복 체크
	public int selectCntByUid(String user_id) {
		
		return sqlSession.selectOne(namespace + ".selectCntByUid", user_id);
		
	}

	// 로그인
	public UserVO selectLogin(String username) {
		
		return sqlSession.selectOne(namespace + ".selectUserByLogin", username);
		
	}
	
	// 주소록 목록
	public List<AddressBookVO> list(String user_id) {
		
		return sqlSession.selectList(namespace + ".addrlistSelect", user_id);
		
	}

	// 주소록 등록
	public int addrinsert(AddressBookVO addressbookVO) {
		
		return sqlSession.insert(namespace + ".addrInsert", addressbookVO);
		
	}
	
}
