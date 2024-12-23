package pj.spring.service;

import java.util.List;
import java.util.Map;

import pj.spring.vo.OrderedVO;
import pj.spring.vo.PaymentVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.UserVO;

public interface AdminService {
	
	// 대시보드 주문 관리  건 수
	public Map<String, Object> orderCount();
	
	// 대시보드 취소 관리  건 수
	public Map<String, Object> cancelCount();
	
	// 대시보드 리뷰/문의 관리  건 수
	public Map<String, Object> contentCount();
	
	// 회원 관리 list
	public List<UserVO> userList(Map<String,Integer> pagingParam);
	
	// 회원 전체 수
	public int selectTotal();
	
	// 상품 등록
	public int insertProduct(ProductVO productVO);
	
	// 상품 첨부파일
	public int insertAttachment(ProductVO productVO);
	
	// 상품 첨부파일 상세
	public int insertAttachmentDetail(ProductVO productVO);
	
	// 상품 관리 list
	public List<ProductVO> productList(Map<String,Integer> pagingParam);
	
	// 상품 전체 수
	public int productTotal();
	
	// 상품 수정 상세
	public ProductVO productModify(int product_no);
	
	// 상품 수정
	public int productModifyUpdate(ProductVO productVO);
	
	/*
	 * // 상품 삭제 public int productDelete(int product_no);
	 */
	
	// 주문 관리 List
	public List<Map<String, Object>> orderList(Map<String,Integer> pagingParam);
	
	// 주문 관리 전체 수
	public int orderTotal();
	
	// ordered_status 변경 ajax
	public int updateOrderStatus(OrderedVO orderedVO);
	
	// 주문 취소 관리 List
	public List<Map<String, Object>> orderCancelList(Map<String,Integer> pagingParam);
	
	// 주문 취소 전체 수
	public int orderCancelTotal();
	
	// payment_type 변경 ajax
	public int updateRefundStatus(PaymentVO paymentVO);
	
	// 리뷰 관리 list
	public List<Map<String, Object>> reviewList(Map<String,Integer> pagingParam);
	
	// 리뷰 전체 수
	public int reviewTotal();
	
	

}
