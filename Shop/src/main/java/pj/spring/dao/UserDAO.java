package pj.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.*;

@Repository
public class UserDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	private final String namespace = "pj.spring.mapper.userMapper";
	
	// 회원가입
	public int insert(UserVO userVO) {
		return sqlSession.insert(namespace + ".userInsert", userVO);
	}

	// 회원탈퇴
	public int deleteAccount(String user_id) {
		return sqlSession.update(namespace + ".deleteAccount", user_id);
	}
 
	// 아이디 중복 체크
	public int selectCntByUid(String user_id) {
		return sqlSession.selectOne(namespace + ".selectCntByUid", user_id);
	}

//	// 회원 로그인
//	public UserVO selectLogin(String username) {
//		return sqlSession.selectOne(namespace + ".selectUserByLogin", username);
//	}

	// 비회원 로그인
	public GuestVO selectGuestLogin(GuestVO guestVO) {
		return sqlSession.selectOne(namespace + ".selectGuestLogin", guestVO);
	}
	
	// 주소록 목록
	public List<AddressBookVO> list(String user_id) {
		return sqlSession.selectList(namespace + ".addrlistSelect", user_id);
	}

	// 주소록 등록
	public int addrinsert(AddressBookVO addressbookVO) {
		return sqlSession.insert(namespace + ".addrInsert", addressbookVO);
	}
	
	// 주소록 삭제
	public int addrdelete(String address_book_no) {
		return sqlSession.delete(namespace + ".addrDelete", address_book_no);
	}

	// 주소록 수정
	public AddressBookVO addrmodify(String address_book_no) {
		return sqlSession.selectOne(namespace + ".addrModify", address_book_no);
	}

	// 기본 주소록 업데이트
	public int updateAddrTop(String user_id) {
		return sqlSession.update(namespace + ".updateAddrTop", user_id);
	}

	// 주소록 업데이트
	public int addrmodifyOk(AddressBookVO addressbookVO) {
		return sqlSession.update(namespace + ".addrModifyOk", addressbookVO);
	}
	
	// 회원 정보
	public UserVO memberinfoselect(String user_id) {
		return sqlSession.selectOne(namespace + ".memberinfoSelect", user_id);
	}

	// 회원 정보  업데이트
	public int memberinfomodify(UserVO userVO) {
		return sqlSession.update(namespace + ".memberinfoModify", userVO);
	}

	// 문의하기
	public int insertcontact(ContactVO contactVO) {
		return sqlSession.insert(namespace + ".insertContact", contactVO);
	}
	
	// 문의하기 첨부파일
	public int insertattachment(ContactVO contactVO) {
		return sqlSession.insert(namespace + ".insertAttachment", contactVO);
	}
	
	// 문의하기 첨부파일 상세
	public int insertattachmentdetail(ContactVO contactVO) {
		return sqlSession.insert(namespace + ".insertAttachmentDetail", contactVO);
	}
	
	// 문의하기 목록
	public List<ContactVO> selectcontactlist(String user_id) {
		return sqlSession.selectList(namespace + ".selectContactList", user_id);
	}

	// 문의하기 상세
	public ContactVO selectcontact(String contact_no) {
		return sqlSession.selectOne(namespace + ".selectContact", contact_no);
	}

	// 문의하기 상세
	public List<ContactVO> selectContactAttachment(String contact_no) {
		return sqlSession.selectList(namespace + ".selectContactAttachment", contact_no);
	}

	// 문의하기 수정
	public ContactVO updatecontact(String contact_no) {
		return sqlSession.selectOne(namespace + ".updateContact", contact_no);
	}
	
	// 문의하기 없데이트
	public int updateokcontact(ContactVO contactVO) {
		return sqlSession.update(namespace + ".updateOkContact", contactVO);
	}
	
	// 문의하기 첨부파일 없데이트
	public List<ContactVO> selectattachment(String contact_no) {
		return sqlSession.selectList(namespace + ".selectAttachment", contact_no);
	}
	
	// 문의하기 첨부파일 삭제
	public int deleteAttachment(String attachment_no) {
		return sqlSession.delete(namespace + ".deleteAttachment", attachment_no);
	}
	
	// 문의하기 첨부파일 상세 삭제
	public int deleteAttachmentDetail(String attachment_no) {
		return sqlSession.delete(namespace + ".deleteAttachmentDetail", attachment_no);
	}
	
	// 문의하기 삭제
	public int deletecontact(String contact_no) {
		return sqlSession.delete(namespace + ".deleteContact", contact_no);
	}
	
	// 주문내역 목록
	public List<OrderedVO> selectorderhistory(String user_id) {
		return sqlSession.selectList(namespace + ".selectOrderhistory", user_id);
	}
	
	// 비회원 주문내역 목록
	public List<OrderedVO> selectOrderhistoryGuest(String guest_no) {
		return sqlSession.selectList(namespace + ".selectOrderhistoryGuest", guest_no);
	}
	
	// 취소 신청
	public int updateOrderstatus1(String ordered_no) {
		return sqlSession.update(namespace + ".updateOrderstatus1", ordered_no);
	}

	// 취소 신청
	public int updateOrderstatus2(String payment_no) {
		return sqlSession.update(namespace + ".updateOrderstatus2", payment_no);
	}
	
	// 배송지 변경
	public OrderedVO selectAddr(String ordered_no) {
		return sqlSession.selectOne(namespace + ".selectAddr", ordered_no);
	}
	
	// 배송지 변경
	public int updateAddr(OrderedVO orderedVO) {
		return sqlSession.update(namespace + ".updateAddr", orderedVO);
	}

	// 취소내역 목록
	public List<OrderedVO> selectorderhistorycancel(String user_id) {
		return sqlSession.selectList(namespace + ".selectOrderhistoryCancel", user_id);
	}

	// 비회원 취소내역 목록
	public List<OrderedVO> selectOrderhistoryCancelGuest(String guest_no) {
		return sqlSession.selectList(namespace + ".selectOrderhistoryCancelGuest", guest_no);
	}
	
	// 주문내역 상세
	public OrderedVO selectOrderhistorydetail(String ordered_no) {
		return sqlSession.selectOne(namespace + ".selectOrderhistorydetail", ordered_no);
	}

	// 주문내역 상세(상품)
	public List<OrderedVO> selectOrderhistorydetailp(String ordered_no) {
		return sqlSession.selectList(namespace + ".selectOrderhistorydetailp", ordered_no);
	}
	
	// 리뷰 가능한 목록
	public List<ReviewVO> selectReviewPossibleList(String user_id) {
		return sqlSession.selectList(namespace + ".selectReviewPossibleList", user_id);
	}

	// 리뷰 작성한 목록
	public List<ReviewVO> selectReviewList(String user_id) {
		return sqlSession.selectList(namespace + ".selectReviewList", user_id);
	}
	
	// 리뷰 등록 전 상품 조회
	public ProductVO selectProduct(String product_no) {
		return sqlSession.selectOne(namespace + ".selectProduct", product_no);
	}

	// 리뷰 등록
	public int insertReview(ReviewVO reviewVO) {
		return sqlSession.insert(namespace + ".insertReview", reviewVO);
	}
	
	// 리뷰 수정 전 조회
	public ReviewVO selectReview(String review_no) {
		return sqlSession.selectOne(namespace + ".selectReview", review_no);
	}

	// 리뷰 수정
	public int updateReview(ReviewVO reviewVO) {
		return sqlSession.update(namespace + ".updateReview", reviewVO);
	}

	// 리뷰  삭제 
	public int deleteReview(String review_no) {
		return sqlSession.update(namespace + ".deleteReview", review_no);
	}

	// 카트 중복 조회
	public int selectDedupeCart(CartVO cartVO) {
		return sqlSession.selectOne(namespace + ".selectDedupeCart", cartVO);
	} 
	
	// 카트 등록
	public int insertCart(CartVO cartVO) {
		return sqlSession.insert(namespace + ".insertCart", cartVO);
	}

	// 카트 등록
	public int insertCart_(CartVO cartVO) {
		return sqlSession.insert(namespace + ".insertCart_", cartVO);
	}
	
	// 위시리스트 조회
	public List<WishlistVO> selectWishlist(String user_id) {
		return sqlSession.selectList(namespace + ".selectWishlist", user_id);
	} 

	// 위시리스트 중복 조회
	public int selectDedupeWishlist(WishlistVO wishlistVO) {
		return sqlSession.selectOne(namespace + ".selectDedupeWishlist", wishlistVO);
	} 
	
	// 위시리스트 등록
	public int insertWishlist(WishlistVO wishlistVO) {
		return sqlSession.insert(namespace + ".insertWishlist", wishlistVO);
	}
	
	// 위시리스트 삭제
	public int deleteWishlist(String wishlist_no) {
		return sqlSession.delete(namespace + ".deleteWishlist", wishlist_no);
	}

	// 카트 중복 조회
	public int selectDedupeRecentlyproduct(RecentlyproductVO recentlyproductVO) {
		return sqlSession.selectOne(namespace + ".selectDedupeRecentlyproduct", recentlyproductVO);
	} 
	
	// 최근본상품 조회
	public List<RecentlyproductVO> selectRecentlyproduct(String user_id) {
		return sqlSession.selectList(namespace + ".selectRecentlyproduct", user_id);
	};
	
	// 최근본상품 등록
	public int insertRecentlyproduct(RecentlyproductVO recentlyproductVO) {
		return sqlSession.insert(namespace + ".insertRecentlyproduct", recentlyproductVO);
	};
	
	// 최근본상품 삭제
	public int deleteRecentlyproduct_(String recentlyproduct_no) {
		return sqlSession.delete(namespace + ".deleteRecentlyproduct_", recentlyproduct_no);
	};
	
	// 최근본상품 삭제
	public int deleteRecentlyproduct(RecentlyproductVO recentlyproductVO) {
		return sqlSession.delete(namespace + ".deleteRecentlyproduct", recentlyproductVO);
	};
	
	// 비회원용 상품정보
	public ReviewVO selectProductForGuest(String product_no) {
		return sqlSession.selectOne(namespace + ".selectProductForGuest", product_no);
	}
	
	// 비회원용 상품정보
	public ProductVO selectCartListGuest(String product_no) {
		return sqlSession.selectOne(namespace + ".selectCartListGuest", product_no);
	}

}
