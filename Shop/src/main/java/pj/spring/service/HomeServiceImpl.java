package pj.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.HomeDAO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.SearchVO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	public HomeDAO homeDAO;
	
	@Override
	public List<ProductVO> selectTodayBook() {
		
		return homeDAO.selectTodayBook();
	}
	
	@Override
	public List<ProductVO> selectBestSellerBook() {
		
		return homeDAO.selectBestSellerBook();
	}
	
	@Override
	public List<ProductVO> selectHotBook() {
		
		return homeDAO.selectHotBook();
	}
	
	@Override
	public int selectProductTotal(SearchVO searchVO) {
		
		return homeDAO.selectProductTotal(searchVO);
	}
	
	
	@Override
	public List<ProductVO> selectIndexSearch(SearchVO searchVO) {
		
		return homeDAO.selectIndexSearch(searchVO);
	}

	@Override
	public List<ProductVO> selectRecommend() {
		
		return homeDAO.selectRecommend();
	}

	@Override
	public List<ProductVO> selectCart(Map<String, Object> params) {
		
		return homeDAO.selectCart(params);
	}

	@Override
	public int deleteCart(String cart_no) {
		
		return homeDAO.deleteCart(cart_no);
	}
	
}
