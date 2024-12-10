package pj.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.HomeDAO;
import pj.spring.vo.ProductVO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	public HomeDAO homeDAO;
	
	public List<ProductVO> selectTodayBook() {
		
		return homeDAO.selectTodayBook();
	}
	
	public List<ProductVO> selectBestSellerBook() {
		
		return homeDAO.selectBestSellerBook();
	}
	
	public List<ProductVO> selectHotBook() {
		
		return homeDAO.selectHotBook();
	}
}
