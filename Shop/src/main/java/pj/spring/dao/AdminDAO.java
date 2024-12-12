package pj.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.UserVO;

@Repository
public class AdminDAO {

	@Autowired
	public SqlSession sqlSession;
	
	private final String namespace = "pj.spring.mapper.adminMapper";
	
	public Map<String, Object> orderCount(){
		return sqlSession.selectOne(namespace + ".orderCount");
	}
	
	public Map<String, Object> cancelCount(){
		return sqlSession.selectOne(namespace + ".cancelCount");
	}
	
	public Map<String, Object> contentCount(){
		return sqlSession.selectOne(namespace + ".contentCount");
	}
	
	public List<UserVO> userList(Map<String,Integer> pagingParam){
		return sqlSession.selectList(namespace+".userList",pagingParam);
	}
	
	public int selectTotal() {
		return sqlSession.selectOne(namespace+".selectTotal");
	}
	
}
