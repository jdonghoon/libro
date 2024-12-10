package pj.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.ProductVO;

@Repository
public class HomeDAO {
	
	@Autowired
	public SqlSession sqlsession;
	
	private final String namespace = "pj.spring.mapper.homeMapper";
	
	public List<ProductVO> selectTodayBook() {
		
		return sqlsession.selectList(namespace + ".selectTodayBook");
	}
	
	public List<ProductVO> selectBestSellerBook() {
		
		return sqlsession.selectList(namespace + ".selectBestSellerBook");
	}
	
	public List<ProductVO> selectHotBook() {
		
		return sqlsession.selectList(namespace + ".selectHotBook");
	}
}
