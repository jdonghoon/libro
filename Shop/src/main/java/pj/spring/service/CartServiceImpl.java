package pj.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.CartDAO;
import pj.spring.vo.ProductVO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	public CartDAO cartDAO;

	@Override
	public List<ProductVO> selectCartList() {
		
		return cartDAO.selectCartList();
	}

	@Override
	public ProductVO selectCartPrice(String user_id) {

		return cartDAO.selectCartPrice(user_id);
	}

	@Override
    public int updateCartQuantity(String user_id, Map<String, Object> map) {
		
        return cartDAO.updateCartQuantity(user_id, map);
	}

}
