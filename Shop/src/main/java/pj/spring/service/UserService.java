package pj.spring.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.spring.vo.*; 

public interface UserService {

	//-------------------------------------------------------------------------------------------------------------------------------	
	// 회원
	
	// 회원가입
	public int insert(UserVO userVO);
	
	// 회원탈퇴
	public int deleteAccount(String user_id); 

//	// 로그인
//	public UserVO selectLogin(String username);
	
	// 비회원 로그인
	public GuestVO selectGuestLogin(GuestVO guestVO);

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

	// 기본 주소록 업데이트
	public int updateAddrTop(String user_id);
	
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

	// 문의하기 상세
	public List<ContactVO> selectContactAttachment(String contact_no);

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
	
	// 비회원 주문내역 목록
	public List<OrderedVO> selectOrderhistoryGuest(String guest_no);
	
	// 취소 신청
	public int updateOrderstatus1(String ordered_no);

	// 취소 신청
	public int updateOrderstatus2(String payment_no);
	
	// 배송지 변경
	public OrderedVO selectAddr(String ordered_no);
	
	// 배송지 변경
	public int updateAddr(OrderedVO orderedVO);

	// 취소내역 목록
	public List<OrderedVO> selectorderhistorycancel(String user_id);
	
	// 비회원 취소내역 목록
	public List<OrderedVO> selectOrderhistoryCancelGuest(String guest_no);

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
	
	// 카트 중복 조회
	public int selectDedupeCart(CartVO cartVO);

	// 카트 등록
	public int insertCart(CartVO cartVO);

	// 카트 등록
	public int insertCart_(CartVO cartVO);

	// 위시리스트 중복 조회
	public int selectDedupeWishlist(WishlistVO wishlistVO);
	
	// 위시리스트 등록
	public int insertWishlist(WishlistVO wishlistVO);
	
	// 위시리스트 삭제
	public int deleteWishlist(String wishlist_no);
	
	// 최근본상품 중복 조회
	public int selectDedupeRecentlyproduct(RecentlyproductVO recentlyproductVO);
	
	// 최근본상품 조회
	public List<RecentlyproductVO> selectRecentlyproduct(String user_id);
	
	// 최근본상품 등록
	public int insertRecentlyproduct(RecentlyproductVO recentlyproductVO);
	
	// 최근본상품 삭제
	public int deleteRecentlyproduct(RecentlyproductVO recentlyproductVO);
	
	// 최근본상품 삭제
	public int deleteRecentlyproduct_(String recentlyproduct_no);
	
	//-------------------------------------------------------------------------------------------------------------------------------	
	// 비회원
	
	// 최근 본 상품 조회
	public List<RecentlyproductVO> getGuestRecentlyProductFromCookies(HttpServletRequest request);
	
	// 최근 본 상품 등록
	public void addGuestRecentlyProductToCookies(String product_no, HttpServletRequest request, HttpServletResponse response);
	
	// 최근 본 상품 삭제
	public void removeGuestRecentlyProductFromCookies(String recentlyproduct_no, HttpServletRequest request, HttpServletResponse response);

	// 위시리스트 조회
	public List<WishlistVO> getGuestWishlistFromCookies(HttpServletRequest request);

	// 위시리스트 등록
	public void addGuestWishlistToCookies(String product_no, HttpServletRequest request, HttpServletResponse response);

	// 위시리스트 삭제
	public void removeGuestWishlistFromCookies(String wishlist_no, HttpServletRequest request, HttpServletResponse response);
	
	// 사이드 카트 조회
	public List<ProductVO> selectCart(Map<String, Object> params, HttpServletRequest request);

	// 카트 수량 업데이트
	public void updateCartForGuest(String product_no, int quantity, HttpServletRequest request, HttpServletResponse response);

	// 카트 조회
	public List<CartVO> getGuestCartFromCookies(HttpServletRequest request);
	
	// 카트 등록
	public void addGuestCartToCookies(String product_no, HttpServletRequest request, HttpServletResponse response);
	
	// 카트 삭제
	public int removeGuestCartFromCookies(String cart_no, HttpServletRequest request, HttpServletResponse response);

	// 로그인 후 비회원 위시리스트 DB로 이동
	public void migrateGuestDataToDB(HttpServletRequest request, String username, HttpServletResponse response);

}
