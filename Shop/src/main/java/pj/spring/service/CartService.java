package pj.spring.service;

import java.util.List;
import java.util.Map;

import pj.spring.vo.ProductVO;

public interface CartService {
	
	public List<ProductVO> selectCartList();
	
	public ProductVO selectCartPrice(String user_id);
	
	public int updateCartQuantity(String user_id, Map<String, Object> map);
}
