package pj.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.CartVO;
import pj.spring.vo.ProductVO;

@Repository
public class CartDAO {
	
	@Autowired
	public SqlSession sqlsession;
	
	private final String namespace = "pj.spring.mapper.cartMapper";

	
	public List<ProductVO> selectCartList() {
		
		return sqlsession.selectList(namespace + ".selectCartList");
	}
	
	public ProductVO selectCartPrice(String user_id) {
		
		return sqlsession.selectOne(namespace + ".selectCartPrice", user_id);
	}
	
	public int updateCartQuantity(Map<String, Object> map) {

	    return sqlsession.update(namespace + ".updateCartQuantity", map);
	}
}
