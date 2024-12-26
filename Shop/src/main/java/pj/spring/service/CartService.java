package pj.spring.service;

import java.util.List;
import java.util.Map;

import pj.spring.vo.ProductVO;
import pj.spring.vo.UserVO;

public interface CartService {
	
	public List<ProductVO> selectCartListUser(UserVO userVO);
	
	public ProductVO selectCartPriceUser(UserVO userVO);
	
	public int updateCartQuantityUser(String user_id, Map<String, Object> map);
}
