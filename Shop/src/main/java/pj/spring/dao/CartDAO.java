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
	public SqlSession sqlSession;
	
	private final String namespace = "pj.spring.mapper.cartMapper";

	
	public List<ProductVO> selectCartList() {
		
		return sqlSession.selectList(namespace + ".selectCartList");
	}
	
	public ProductVO selectCartPrice(String user_id) {
		
		return sqlSession.selectOne(namespace + ".selectCartPrice", user_id);
	}
	
	public int updateCartQuantity(String user_id, Map<String, Object> map) {
		
		map.put("user_id", user_id);
        return sqlSession.update(namespace + ".updateCartQuantity", map);
    }
}
