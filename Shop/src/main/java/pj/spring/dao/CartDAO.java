package pj.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.ProductVO;
import pj.spring.vo.UserVO;

@Repository
public class CartDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	private final String namespace = "pj.spring.mapper.cartMapper";

	
	public List<ProductVO> selectCartListUser(UserVO userVO) {
		
		return sqlSession.selectList(namespace + ".selectCartListUser", userVO);
	}
	
	public ProductVO selectCartPriceUser(UserVO userVO) {
		
		return sqlSession.selectOne(namespace + ".selectCartPriceUser", userVO);
	}
	
	public int updateCartQuantityUser(String user_id, Map<String, Object> map) {
		
		map.put("user_id", user_id);
        return sqlSession.update(namespace + ".updateCartQuantityUser", map);
    }
}
