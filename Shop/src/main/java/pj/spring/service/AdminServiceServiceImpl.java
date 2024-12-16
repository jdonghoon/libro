package pj.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.AdminDAO;
import pj.spring.vo.ProductVO;
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

	// 상품 수정
	@Override
	public ProductVO productModify(int product_no) {
		return adminDAO.productModify(product_no);
	}
	
	// 상품 삭제
	@Override
	public int productDelete(int product_no) {
		return adminDAO.productDelete(product_no);
	}

	
	

}
