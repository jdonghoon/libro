package pj.spring.service;

import java.util.List;

import pj.spring.vo.ProductVO;
import pj.spring.vo.SearchVO;

public interface HomeService {
	
	public List<ProductVO> selectTodayBook();
	
	public List<ProductVO> selectBestSellerBook();
	
	public List<ProductVO> selectHotBook();
	
	public int selectProductTotal(SearchVO searchVO);
	
	public List<ProductVO> selectIndexSearch(SearchVO searchVO);
	
	public List<ProductVO> selectRecommend();
	
	public List<ProductVO> selectCart();
	
	public int deleteCart(String cart_no);
}
