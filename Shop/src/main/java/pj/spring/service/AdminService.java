package pj.spring.service;

import java.util.List;
import java.util.Map;

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
	
	
}
