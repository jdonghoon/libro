package pj.spring.service;

import java.util.List;

import pj.spring.vo.CartVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.ReviewVO;
import pj.spring.vo.SearchVO;
import pj.spring.vo.WishlistVO;

public interface MenuService {
	
	public List<ProductVO> selectNewList(SearchVO searchVO);
	
	public int selectTotal(SearchVO searchVO);
	
	public List<ProductVO> selectBestsellerList(SearchVO searchVO);
	
	public List<ProductVO> selectTotalList(SearchVO searchVO);
	
	public List<ProductVO> selectRecommend();
	
	public ProductVO selectProductDetail(int product_no);
	
	public ReviewVO selectReviewDetail(int product_no);
	
	public int addToCart(CartVO cartVO);
	
	public boolean checkCart(CartVO cartVO);
	
	public int addToWishlist(WishlistVO wishlistVO);
	
	public boolean checkWishlist(WishlistVO wishlistVO);
	
}
