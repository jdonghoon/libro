package pj.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.CartVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.ReviewVO;
import pj.spring.vo.SearchVO;
import pj.spring.vo.WishlistVO;

@Repository
public class MenuDAO {
	
	@Autowired
	public SqlSession sqlsession;
	
	private final String namespace = "pj.spring.mapper.menuMapper";
	
	public List<ProductVO> selectNewList(SearchVO searchVO) {
		
		return sqlsession.selectList(namespace + ".selectNewList", searchVO);
	}
	
	public int selectTotal(SearchVO searchVO) {
		return sqlsession.selectOne(namespace + ".selectTotal", searchVO);
	}
	
	public List<ProductVO> selectBestsellerList(SearchVO searchVO) {
			
		return sqlsession.selectList(namespace + ".selectBestsellerList", searchVO);
	}
	
	public List<ProductVO> selectTotalList(SearchVO searchVO) {
		
		return sqlsession.selectList(namespace + ".selectTotalList", searchVO);
	}
	
	public List<ProductVO> selectRecommend() {
		
		return sqlsession.selectList(namespace + ".selectRecommend");
	}
	
	public ProductVO selectProductDetail(int product_no) {
		
		return sqlsession.selectOne(namespace + ".selectProductDetail", product_no);
	}
	
	public ReviewVO selectReviewDetail(int product_no) {
		
		return sqlsession.selectOne(namespace + ".selectReviewDetail", product_no);
	}
	
	public int addToCart(CartVO cartVO) {
		
		return sqlsession.insert(namespace + ".addToCart", cartVO);
	}
	
	public int checkCart(CartVO cartVO) {
		
		return sqlsession.selectOne(namespace + ".checkCart", cartVO);
	}
	
	public int addToWishlist(WishlistVO wishlistVO) {
		
		return sqlsession.insert(namespace + ".addToWishlist", wishlistVO);
	}
	
	public int checkWishlist(WishlistVO wishlistVO) {
		
		return sqlsession.selectOne(namespace + ".checkWishlist", wishlistVO);
	}
}
