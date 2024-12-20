package pj.spring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.spring.vo.*; 

public interface UserService {
	
	// 회원가입
	public int insert(UserVO userVO);

	// 로그인
	public UserVO selectLogin(String username);

	// 아이디 중복 체크
	public int selectCntByUid(String user_id);
	
	// 주소록 목록
	public List<AddressBookVO> list(String user_id);
	
	// 주소록 등록
	public int addrinsert(AddressBookVO addressbookVO);
	
	// 주소록 삭제
	public int addrdelete(String address_book_no);

	// 주소록 수정
	public AddressBookVO addrmodify(String address_book_no);

	// 주소록 업데이트
	public int addrmodifyOk(AddressBookVO addressbookVO);
	
	// 회원 정보
	public UserVO memberinfoselect(String user_id);

	// 회원 정보 업데이트
	public int memberinfomodify(UserVO userVO);
	
	// 문의하기
	public int insertcontact(ContactVO contactVO);

	// 문의하기 첨부파일
	public int insertattachment(ContactVO contactVO);

	// 문의하기 첨부파일 상세
	public int insertattachmentdetail(ContactVO contactVO);
	
	// 문의하기 목록
	public List<ContactVO> selectcontactlist(String user_id);
	
	// 문의하기 상세
	public ContactVO selectcontact(String contact_no);

	// 문의하기 수정
	public ContactVO updateContact(String contact_no);
	
	// 문의하기 없데이트
	public int updateokcontact(ContactVO contactVO);
	
	// 문의하기 첨부파일 없데이트
	public List<ContactVO> selectattachment(String contact_no);
	
	// 문의하기 첨부파일 삭제
	public int deletetattachment(String attachment_no);
	
	// 문의하기 첨부파일 상세 삭제
	public int deletetattachmentdetail(String attachment_no);
	
	// 문의하기 삭제
	public int deletetcontact(String contact_no);
	
	// 주문내역 목록
	public List<OrderedVO> selectorderhistory(String user_id);

	// 취소내역 목록
	public List<OrderedVO> selectorderhistorycancel(String user_id);

	// 주문내역 상세
	public OrderedVO selectorderhistorydetail(String ordered_no);

	// 주문내역 상세(상품)
	public List<OrderedVO> selectorderhistorydetailp(String ordered_no);
	
	// 리뷰 가능한 목록
	public List<ReviewVO> selectReviewPossibleList(String user_id);

	// 리뷰 작성한 목록
	public List<ReviewVO> selectReviewList(String user_id);
	
	// 리뷰 등록 전 상품 조회
	public ProductVO selectProduct(String product_no);
	
	// 리뷰 등록
	public int insertReview(ReviewVO reviewVO);
	
	// 리뷰 수정 전 조회
	public ReviewVO selectReview(String review_no);
	
	// 리뷰 수정
	public int updateReview(ReviewVO reviewVO);
	
	// 리뷰   삭제
	public int deleteReview(String review_no);
	
	// 위시리스트 조회
	public List<WishlistVO> selectWishlist(String user_id);
	
	// 위시리스트 등록
	public int insertWishlist(WishlistVO wishlistVO);
	
	// 위시리스트 삭제
	public int deleteWishlist(String wishlist_no);
	
	// 카트로 이동
	public int insertCart(CartVO cartVO);
	
	// 위시리스트 조회
	public List<WishlistVO> getGuestWishlistFromCookies(HttpServletRequest request);

	// 위시리스트 등록
	public void addGuestWishlistToCookies(String product_no, HttpServletRequest request, HttpServletResponse response);

	// 위시리스트 삭제
	public void removeGuestWishlistFromCookies(String wishlist_no, HttpServletRequest request, HttpServletResponse response);

	// 카트로 이동
	public void addGuestCartToCookies(String product_no, HttpServletRequest request, HttpServletResponse response);
	
	// 로그인 후 비회원 위시리스트 DB로 이동
	public void migrateGuestWishlistToDB(HttpServletRequest request, String username, HttpServletResponse response);

}
