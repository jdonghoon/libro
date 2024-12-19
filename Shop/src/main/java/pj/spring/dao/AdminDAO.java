package pj.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.OrderedVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.UserVO;

@Repository
public class AdminDAO {

	@Autowired
	public SqlSession sqlSession;
	
	private final String namespace = "pj.spring.mapper.adminMapper";
	
	// 대시보드 주문 관리  건 수
	public Map<String, Object> orderCount(){
		return sqlSession.selectOne(namespace + ".orderCount");
	}
	
	// 대시보드 취소 관리  건 수
	public Map<String, Object> cancelCount(){
		return sqlSession.selectOne(namespace + ".cancelCount");
	}
	
	// 대시보드 리뷰/문의 관리  건 수
	public Map<String, Object> contentCount(){
		return sqlSession.selectOne(namespace + ".contentCount");
	}
	
	// 회원 관리 list
	public List<UserVO> userList(Map<String,Integer> pagingParam){
		return sqlSession.selectList(namespace+".userList", pagingParam);
	}
	
	// 회원 전체 수
	public int selectTotal() {
		return sqlSession.selectOne(namespace+".selectTotal");
	}
	
	// 상품 등록
	public int insertProduct(ProductVO productVO){
		return sqlSession.insert(namespace+".insertProduct", productVO);
	}
	
	// 상품 첨부파일
	public int insertAttachment(ProductVO productVO){
		return sqlSession.insert(namespace+".insertAttachment", productVO);
	}
	
	// 상품 첨부파일 상세
	public int insertAttachmentDetail(ProductVO productVO){
		return sqlSession.insert(namespace+".insertAttachmentDetail", productVO);
	}
	
	// 상품 관리 List
	public List<ProductVO> productList(Map<String,Integer> pagingParam){
		return sqlSession.selectList(namespace+".productList", pagingParam);
	}
	
	// 상품 전체 수
	public int productTotal() {
		return sqlSession.selectOne(namespace+".productTotal");
	}
	
	// 상품 수정 상세
	public ProductVO productModify(int product_no) {
		return sqlSession.selectOne(namespace+".productModify", product_no);
	}
	
	// 상품 수정
	public int productModifyUpdate(ProductVO productVO) {
		return sqlSession.update(namespace+".productModifyUpdate", productVO);
	}
	
	// 상품 삭제
	public int productDelete(int product_no) {
		return sqlSession.delete(namespace+".productDelete", product_no);
	}
	
	// 주문 관리 List
	public List<Map<String, Object>> orderList(Map<String,Integer> pagingParam) {
		return sqlSession.selectList(namespace+".orderList", pagingParam);
	}
	
	// 주문 전체 수
	public int orderTotal() {
		return sqlSession.selectOne(namespace+".orderTotal");
	}
	
	// 주문 관리 상태 변경 ajax
	public int updateOrderStatus(OrderedVO oderedvo) {
		return sqlSession.update(namespace+".updateOrderStatus", oderedvo);
	}
	


}
