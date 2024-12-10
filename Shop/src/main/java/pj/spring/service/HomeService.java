package pj.spring.service;

import java.util.List;

import pj.spring.vo.ProductVO;

public interface HomeService {
	
	public List<ProductVO> selectTodayBook();
	
	public List<ProductVO> selectBestSellerBook();
	
	public List<ProductVO> selectHotBook();
}
