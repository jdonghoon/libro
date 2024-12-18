package pj.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.UserDAO;
import pj.spring.vo.*;

@Service // 업무로직을 담당하는 구현 객체를 스프링이 생성하여 관리
public class UserServiceImpl implements UserService {
	
	@Autowired
	public UserDAO userDAO;
	
	// 회원가입
	@Override
	public int insert(UserVO userVO){
		return userDAO.insert(userVO);
	}

	// 로그인
	@Override
	public UserVO selectLogin(String username){
		return userDAO.selectLogin(username);
	}

	// 아이디 중복 체크
	@Override
	public int selectCntByUid(String user_id) {
		return userDAO.selectCntByUid(user_id);
	}
	
	// 주소록 목록
	@Override
	public List<AddressBookVO> list(String user_id) {
		return userDAO.list(user_id);
	}

	// 주소록 등록
	@Override
	public int addrinsert(AddressBookVO addressbookVO) {
		return userDAO.addrinsert(addressbookVO);
	}

	// 주소록 삭제
	@Override
	public int addrdelete(String address_book_no) {
		return userDAO.addrdelete(address_book_no);
	}

	// 주소록 수정
	@Override
	public AddressBookVO addrmodify(String address_book_no) {
		return userDAO.addrmodify(address_book_no);
	}

	// 주소록 업데이트
	@Override
	public int addrmodifyOk(AddressBookVO addressbookVO) {
		return userDAO.addrmodifyOk(addressbookVO);
	}

	// 회원 정보
	@Override
	public UserVO memberinfoselect(String user_id) {
		return userDAO.memberinfoselect(user_id);
	}

	// 회원 정보 업데이트
	@Override
	public int memberinfomodify(UserVO userVO) {
		return userDAO.memberinfomodify(userVO);
	}

	// 문의하기
	@Override
	public int insertcontact(ContactVO contactVO) {
		return userDAO.insertcontact(contactVO);
	}

	// 문의하기 첨부파일
	@Override
	public int insertattachment(ContactVO contactVO) {
		return userDAO.insertattachment(contactVO);
	}

	// 문의하기 첨부파일 상세
	@Override
	public int insertattachmentdetail(ContactVO contactVO) {
		return userDAO.insertattachmentdetail(contactVO);
	}

	// 문의하기 목록
	@Override
	public List<ContactVO> selectcontactlist(String user_id) {
		return userDAO.selectcontactlist(user_id);
	}

	// 문의하기 상세
	@Override
	public ContactVO selectcontact(String contact_no) {
		return userDAO.selectcontact(contact_no);
	}

	// 문의하기 수정
	@Override
	public ContactVO updateContact(String contact_no) {
		return userDAO.updatecontact(contact_no);
	}

	// 문의하기 업데이트
	@Override
	public int updateokcontact(ContactVO contactVO) {
		return userDAO.updateokcontact(contactVO);
	}
	
	// 문의하기 첨부파일 업데이트
	@Override
	public List<ContactVO> selectattachment(String contact_no) {
		return userDAO.selectattachment(contact_no);
	}
	
	// 문의하기 첨부파일 상세 업데이트
	@Override
	public int deletetattachment(String attachment_no) {
		return userDAO.deleteAttachment(attachment_no);
	}
	
	// 문의하기 첨부파일 상세 업데이트
	@Override
	public int deletetattachmentdetail(String attachment_no) {
		return userDAO.deleteAttachmentDetail(attachment_no);
	}
	
	// 문의하기 삭제
	@Override
	public int deletetcontact(String contact_no) {
		return userDAO.deletecontact(contact_no);
	}
	
	// 주문내역 목록
	public List<OrderedVO> selectorderhistory(String user_id) {
		return userDAO.selectorderhistory(user_id);
	}

	// 취소내역 목록
	@Override
	public List<OrderedVO> selectorderhistorycancel(String user_id) {
		return userDAO.selectorderhistorycancel(user_id);
	}

	// 주문내역 상세
	@Override
	public OrderedVO selectorderhistorydetail(String ordered_no) {
		return userDAO.selectOrderhistorydetail(ordered_no);
	}

	// 주문내역 상세(상품)
	@Override
	public List<OrderedVO> selectorderhistorydetailp(String ordered_no) {
		return userDAO.selectOrderhistorydetailp(ordered_no);
	}

	// 리뷰 가능한 목록
	@Override
	public List<ReviewVO> selectReviewPossibleList(String user_id) {
		return userDAO.selectReviewPossibleList(user_id);
	}

	// 리뷰 작성한 목록
	@Override
	public List<ReviewVO> selectReviewList(String user_id) {
		return userDAO.selectReviewList(user_id);
	}

	// 리뷰 등록 전 상품 조회
	@Override
	public ProductVO selectProduct(String product_no) {
		return userDAO.selectProduct(product_no);
	}

	// 리뷰 등록
	@Override
	public int insertReview(ReviewVO reviewVO) {
		return userDAO.insertReview(reviewVO);
	}
	
	// 리뷰 수정 전 조회
	@Override
	public ReviewVO selectReview(String review_no) {
		return userDAO.selectReview(review_no);
	}

	// 리뷰 수정
	@Override
	public int updateReview(ReviewVO reviewVO) {
		return userDAO.updateReview(reviewVO);
	}

	// 리뷰   삭제
	@Override
	public int deleteReview(String review_no) {
		return userDAO.deleteReview(review_no);
	}
}
