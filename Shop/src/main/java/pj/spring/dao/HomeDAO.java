package pj.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.ProductVO;
import pj.spring.vo.SearchVO;

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
	
	public int selectProductTotal(SearchVO searchVO) {
		
		return sqlsession.selectOne(namespace + ".selectProductTotal");
	}
	
	public List<ProductVO> selectIndexSearch(SearchVO searchVO) {
		
		return sqlsession.selectList(namespace + ".selectIndexSearch", searchVO); 
	}
	
	public List<ProductVO> selectRecommend() {
		
		return sqlsession.selectList(namespace + ".selectRecommend");
	}
	
	public List<ProductVO> selectCart(Map<String, Object> params) {
		
		return sqlsession.selectList(namespace + ".selectCart", params);
	}
	
	public int deleteCart(String cart_no) {
		
		return sqlsession.delete(namespace + ".deleteCart", cart_no);
	}
}
