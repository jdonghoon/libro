package pj.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.CartDAO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.UserVO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	public CartDAO cartDAO;

	@Override
	public List<ProductVO> selectCartListUser(UserVO userVO) {
		
		return cartDAO.selectCartListUser(userVO);
	}

	@Override
	public ProductVO selectCartPriceUser(UserVO userVO) {

		return cartDAO.selectCartPriceUser(userVO);
	}

	@Override
    public int updateCartQuantityUser(String user_id, Map<String, Object> map) {
		
        return cartDAO.updateCartQuantityUser(user_id, map);
	}

	
}
