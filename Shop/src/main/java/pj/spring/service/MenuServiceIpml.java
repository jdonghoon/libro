package pj.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.MenuDAO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.ReviewVO;
import pj.spring.vo.SearchVO;

@Service
public class MenuServiceIpml implements MenuService{
	
	@Autowired
	public MenuDAO menuDAO;

	@Override
	public List<ProductVO> selectNewList(SearchVO searchVO) {

		return menuDAO.selectNewList(searchVO);
	}
	
	@Override
	public int selectTotal(SearchVO searchVO) {
		
		return menuDAO.selectTotal(searchVO);
	}
	
	@Override
	public List<ProductVO> selectBestsellerList(SearchVO searchVO) {

		return menuDAO.selectBestsellerList(searchVO);
	}

	@Override
	public List<ProductVO> selectTotalList(SearchVO searchVO) {
	
		return menuDAO.selectTotalList(searchVO);
	}
	
	@Override
	public List<ProductVO> selectRecommend() {
		
		return menuDAO.selectRecommend();
	}

	@Override
	public ProductVO selectProductDetail(int product_no) {

		return menuDAO.selectProductDetail(product_no);
	}

	@Override
	public ReviewVO selectReviewDetail(int product_no) {
		
		return menuDAO.selectReviewDetail(product_no);
	}

	

}
