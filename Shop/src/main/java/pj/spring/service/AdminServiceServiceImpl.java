package pj.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.AdminDAO;
import pj.spring.vo.ContactAlarmVO;
import pj.spring.vo.ContactVO;
import pj.spring.vo.OrderedDetailVO;
import pj.spring.vo.OrderedVO;
import pj.spring.vo.PaymentVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.ReviewVO;
import pj.spring.vo.UserVO;

@Service
public class AdminServiceServiceImpl implements AdminService {

	@Autowired
	public AdminDAO adminDAO;
	
	// 대시보드 주문 관리  건 수
	@Override
	public Map<String, Object> orderCount() {
		return adminDAO.orderCount();
	}

	// 대시보드 취소 관리  건 수
	@Override
	public Map<String, Object> cancelCount() {
		return adminDAO.cancelCount();
	}

	// 대시보드 리뷰/문의 관리  건 수
	@Override
	public Map<String, Object> contentCount() {
		return adminDAO.contentCount();
	}
	
	// 통합 통계 메서드
	@Override
    public Map<String, Object> getSalesStatistics(Map<String, Object> params) {
		return adminDAO.getSalesStatistics(params);
	}

	// 회원 관리 list
	@Override
	public List<UserVO> userList(Map<String, Integer> pagingParam) {
		return adminDAO.userList(pagingParam);
	}
	
	// 회원 전체 수
	@Override
	public int selectTotal() {
		return adminDAO.selectTotal();
	}

	// 회원 정보 저장 (AJAX 요청 처리)
	@Override
	public int saveUserReply(UserVO userVO) {
		return adminDAO.saveUserReply(userVO);
	}
	
	// 회원 관리 검색(AJAX)
	@Override
	public List<UserVO> searchMembers(Map<String, Object> searchParams) {
		return adminDAO.searchMembers(searchParams);
	}
	
	// 상품 등록
	@Override
	public int insertProduct(ProductVO productVO) {
		return adminDAO.insertProduct(productVO);
	}

	// 상품 첨부파일
	@Override
	public int insertAttachment(ProductVO productVO) {
		return adminDAO.insertAttachment(productVO);
	}

	// 상품 첨부파일 상세
	@Override
	public int insertAttachmentDetail(ProductVO productVO) {
		return adminDAO.insertAttachmentDetail(productVO);
	}

	// 상품 관리 list
	@Override
	public List<ProductVO> productList(Map<String, Integer> pagingParam) {
		return adminDAO.productList(pagingParam);
	}

	// 상품 전체 수
	@Override
	public int productTotal() {
		return adminDAO.productTotal();
	}

	// 상품 수정 상세
	@Override
	public ProductVO productModify(int product_no) {
		return adminDAO.productModify(product_no);
	}
	
	// 수정 전 첨부파일 이름 select
	@Override	
	public List<ProductVO> productAttachmentName(int product_no) {
		return adminDAO.productAttachmentName(product_no);
	}
	
	// 상품 수정
	@Override
	public int productModifyUpdate(ProductVO productVO) {
		return adminDAO.productModifyUpdate(productVO);
	}
	
	// 상품 첨부파일 수정
	@Override
	public int updateProductAttachment(ProductVO productVO) {
		return adminDAO.updateProductAttachment(productVO);
	}
	
	// 상품 첨부파일 삭제
	@Override
	public int deleteAttachment(int attachment_no) {
		return adminDAO.deleteAttachment(attachment_no);
	}
	
	// 상품 삭제 
	@Override
	public int productDelete(ProductVO productVO) {
		return adminDAO.productDelete(productVO);
	}
	
	// 주문 관리 list
	@Override
	public List<Map<String, Object>> orderList(Map<String, Integer> pagingParam) {
		return adminDAO.orderList(pagingParam);
	}

	// 주문 관리 전체 수
	@Override
	public int orderTotal() {
		return adminDAO.orderTotal();
	}

	// ordered_status 변경 ajax
	@Override
	public int updateOrderStatus(OrderedVO orderedVO) {
		return adminDAO.updateOrderStatus(orderedVO);
	}

	// 상품주문번호 모달창
	@Override
	public Map<String, Object> getOrderDetails(String ordered_detail_no) {
		return adminDAO.getOrderDetails(ordered_detail_no);
	}
	
	// 주문 취소 관리 list
	@Override
	public List<Map<String, Object>> orderCancelList(Map<String, Integer> pagingParam) {
		return adminDAO.orderCancelList(pagingParam);
	}

	// 주문 취소 전체 수
	@Override
	public int orderCancelTotal() {
		return adminDAO.orderCancelTotal();
	}

	// payment_type 변경 ajax
	@Override
	public int updateRefundStatus(PaymentVO paymentVO) {
		return adminDAO.updateRefundStatus(paymentVO);
	}

	// 리뷰 관리 list
	@Override
	public List<Map<String, Object>> reviewList(Map<String, Integer> pagingParam) {
		return adminDAO.reviewList(pagingParam);
	}

	// 리뷰 전체 수
	@Override
	public int reviewTotal() {
		return adminDAO.reviewTotal();
	}

	// review_status 상태 변경 ajax
	@Override
	public int reviewStatus(ReviewVO reviewVO) {
		return adminDAO.reviewStatus(reviewVO);
	}
	
	// 문의관리 list
	@Override
	public List<Map<String, Object>> contactList(Map<String, Integer> pagingParam) {
		return adminDAO.contactList(pagingParam);
	}

	// 문의 전체 수
	@Override
	public int contactTotal() {
		return adminDAO.contactTotal();
	}
	
	// 문의 답변 저장 (AJAX 요청 처리)
	@Override
	public int saveContactReply(ContactVO contactVO) {
		return adminDAO.saveContactReply(contactVO);
	}
	
	// 알림 생성
	/*
	 * @Override public int insertContactAlarm(ContactAlarmVO contactAlarmVO) {
	 * return adminDAO.insertContactAlarm(contactAlarmVO); }
	 */
	
	// 관리자 알림 조회
	/*
	 * @Override public List<ContactAlarmVO> getUnreadNotifications(String user_id)
	 * { return adminDAO.getUnreadNotifications(user_id); }
	 */
	
	//매출관리 매출 합계
	//총 거래금액
	@Override
	public OrderedDetailVO orderTotalAmount() {
		return adminDAO.orderTotalAmount();
	}

	//총 결제금액
	@Override
	public PaymentVO paymentTotalAmount() {
		return adminDAO.paymentTotalAmount();
	}

	//총 판매수량
	@Override
	public OrderedDetailVO orderTotalQuantity() {
		return adminDAO.orderTotalQuantity();
	}

	//매출관리 list
	@Override
	public List<Map<String, Object>> salesList(Map<String, Integer> pagingParam) {
		return adminDAO.salesList(pagingParam);
	}

	//매출 관리 전체 수
	@Override
	public int salesTotal() {
		return adminDAO.salesTotal();
	}

	

	

	


	



	

	

}
