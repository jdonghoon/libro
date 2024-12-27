package pj.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.ContactVO;
import pj.spring.vo.OrderedDetailVO;
import pj.spring.vo.OrderedVO;
import pj.spring.vo.PaymentVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.ReviewVO;
import pj.spring.vo.UserVO;

@Repository
public class AdminDAO {

	@Autowired
	public SqlSession sqlSession;

	private final String namespace = "pj.spring.mapper.adminMapper";

	// 대시보드 주문 관리 건 수
	public Map<String, Object> orderCount() {
		return sqlSession.selectOne(namespace + ".orderCount");
	}

	// 대시보드 취소 관리 건 수
	public Map<String, Object> cancelCount() {
		return sqlSession.selectOne(namespace + ".cancelCount");
	}

	// 대시보드 리뷰/문의 관리 건 수
	public Map<String, Object> contentCount() {
		return sqlSession.selectOne(namespace + ".contentCount");
	}

	// 회원 관리 list
	public List<UserVO> userList(Map<String, Integer> pagingParam) {
		return sqlSession.selectList(namespace + ".userList", pagingParam);
	}

	// 회원 전체 수
	public int selectTotal() {
		return sqlSession.selectOne(namespace + ".selectTotal");
	}

	// 상품 등록
	public int insertProduct(ProductVO productVO) {
		return sqlSession.insert(namespace + ".insertProduct", productVO);
	}

	// 상품 첨부파일
	public int insertAttachment(ProductVO productVO) {
		return sqlSession.insert(namespace + ".insertAttachment", productVO);
	}

	// 상품 첨부파일 상세
	public int insertAttachmentDetail(ProductVO productVO) {
		return sqlSession.insert(namespace + ".insertAttachmentDetail", productVO);
	}

	// 상품 관리 List
	public List<ProductVO> productList(Map<String, Integer> pagingParam) {
		return sqlSession.selectList(namespace + ".productList", pagingParam);
	}

	// 상품 전체 수
	public int productTotal() {
		return sqlSession.selectOne(namespace + ".productTotal");
	}

	// 상품 수정 상세
	public ProductVO productModify(int product_no) {
		return sqlSession.selectOne(namespace + ".productModify", product_no);
	}

	// 상품 수정
	public int productModifyUpdate(ProductVO productVO) {
		return sqlSession.update(namespace + ".productModifyUpdate", productVO);
	}
	
	// 상품 첨부파일 수정
	public int updateProductAttachment(ProductVO productVO) {
		return sqlSession.update(namespace+".updateProductAttachment", productVO);
	}

	// 상품 삭제 
	public int productDelete(ProductVO productVO) { 
		return sqlSession.update(namespace+".productDelete", productVO); 
	}
	 
	// 주문 관리 List
	public List<Map<String, Object>> orderList(Map<String, Integer> pagingParam) {
		return sqlSession.selectList(namespace + ".orderList", pagingParam);
	}

	// 주문 전체 수
	public int orderTotal() {
		return sqlSession.selectOne(namespace + ".orderTotal");
	}

	// ordered_status 변경 ajax
	public int updateOrderStatus(OrderedVO orderedVO) {
		return sqlSession.update(namespace + ".updateOrderStatus", orderedVO);
	}
	
	// 상품주문번호 모달창
	public Map<String, Object> getOrderDetails(String ordered_detail_no) {
		return sqlSession.selectOne(namespace+".getOrderDetails", ordered_detail_no);
	}
	
	// 주문 취소 관리 List
	public List<Map<String, Object>> orderCancelList(Map<String, Integer> pagingParam) {
		return sqlSession.selectList(namespace + ".orderCancelList", pagingParam);
	}

	// 주문 취소 전체 수
	public int orderCancelTotal() {
		return sqlSession.selectOne(namespace + ".orderCancelTotal");
	}

	// payment_type 변경 ajax
	public int updateRefundStatus(PaymentVO paymentVO) {
		return sqlSession.update(namespace + ".updateRefundStatus", paymentVO);
	}

	// 리뷰 관리 list
	public List<Map<String, Object>> reviewList(Map<String, Integer> pagingParam) {
		return sqlSession.selectList(namespace + ".reviewList", pagingParam);
	}

	// 리뷰 전체 수
	public int reviewTotal() {
		return sqlSession.selectOne(namespace + ".reviewTotal");
	}

	// review_status 상태 변경 ajax
	public int reviewStatus(ReviewVO reviewVO) {
		return sqlSession.update(namespace + ".reviewStatus", reviewVO);
	}

	// 문의 관리 list
	public List<Map<String, Object>> contactList(Map<String, Integer> pagingParam) {
		return sqlSession.selectList(namespace + ".contactList", pagingParam);
	}

	// 문의 전체 수
	public int contactTotal() {
		return sqlSession.selectOne(namespace + ".reviewTotal");
	}
	
	// 문의 답변 저장 (AJAX 요청 처리)
	public int saveContactReply(ContactVO contactVO) {
		return sqlSession.update(namespace+".saveContactReply", contactVO);
	}

	//매출관리 매출 합계
	//총 거래금액
	public OrderedDetailVO orderTotalAmount() {
		return sqlSession.selectOne(namespace+".orderTotalAmount");
	}
	
	//총 결제금액
	public PaymentVO paymentTotalAmount() {
		return sqlSession.selectOne(namespace+".paymentTotalAmount");
	}
	
	//총 판매수량
	public OrderedDetailVO orderTotalQuantity() {
		return sqlSession.selectOne(namespace+".orderTotalQuantity");
	}
	
	//매출관리 list
	public List<Map<String, Object>>salesList(Map<String, Integer> pagingParam) {
		return sqlSession.selectList(namespace + ".salesList", pagingParam);
	}
	
	//매출 관리 전체 수
	public int salesTotal() {
		return sqlSession.selectOne(namespace + ".salesTotal");
	}	
	
}
