package pj.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID; 

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.UserDAO;
import pj.spring.vo.AddressBookVO;
import pj.spring.vo.CartVO;
import pj.spring.vo.ContactVO;
import pj.spring.vo.OrderedVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.ReviewVO;
import pj.spring.vo.UserVO;
import pj.spring.vo.WishlistVO;

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

	// 위시리스트 조회
	@Override
	public List<WishlistVO> selectWishlist(String user_id) {
		return userDAO.selectWishlist(user_id);
	}

	// 위시리스트 등록
	@Override
	public int insertWishlist(WishlistVO wishlistVO) {
		return userDAO.insertWishlist(wishlistVO);
	}

	// 위시리스트 삭제
	@Override
	public int deleteWishlist(String wishlist_no) {
		return userDAO.deleteWishlist(wishlist_no);
	}

	// 카트로 이동
	@Override
	public int insertCart(CartVO cartVO) {
		return userDAO.insertCart(cartVO);
	}

	// 위시리스트 조회
	@Override
	public List<WishlistVO> getGuestWishlistFromCookies(HttpServletRequest request) {
		List<WishlistVO> list = new ArrayList<>();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().startsWith("wishlist_")) {
		
					String product_no = cookie.getValue();

					ReviewVO product = userDAO.selectProductForGuest(product_no);
					
					WishlistVO vo = new WishlistVO();
					vo.setProduct_no(product.getProduct_no());
					vo.setAttachment_detail_new_name(product.getAttachment_detail_new_name());
					vo.setProduct_name(product.getProduct_name());
					vo.setProduct_author(product.getProduct_author());
					vo.setProduct_publisher(product.getProduct_publisher());
					vo.setReview_starrating(product.getReview_starrating());
					vo.setWishlist_no(cookie.getName().substring("wishlist_".length()));
//					System.out.println("비회원 위시번호 : " + vo.getWishlist_no());
					list.add(vo);
				}	
			}
		}
		return list;
	}

	// 위시리스트 등록
	@Override
	public void addGuestWishlistToCookies(String product_no, HttpServletRequest request, HttpServletResponse response) {
		String wishlistId = UUID.randomUUID().toString(); // 고유한 UUID 생성
		Cookie cookie = new Cookie("wishlist_" + wishlistId, String.valueOf(product_no)); // 쿠키 이름을 일관되게 설정
		cookie.setPath("/"); // 쿠키가 모든 경로에서 유효하도록 설정
		cookie.setMaxAge(60 * 60 * 24 * 7); // 7일 유지
		response.addCookie(cookie); // 쿠키를 클라이언트에 전달
	}

	// 위시리스트 삭제
	@Override
	public void removeGuestWishlistFromCookies(String wishlist_no, HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		System.out.println("cookies" + cookies);
		if (cookies != null) {
			for (Cookie cookie : cookies) {
//				System.out.println("name::"+cookie.getName().startsWith("wishlist_"));
//				System.out.println("value::"+cookie.getValue());
//				System.out.println("wishlist_no::"+wishlist_no);
				if (cookie.getName().startsWith("wishlist_") && cookie.getValue().equals(wishlist_no)) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					System.out.println("Deleting cookie: " + cookie.getName());
				}
			}
		}
	}

	// 카트로 이동
	@Override
	public void addGuestCartToCookies(String product_no, HttpServletRequest request, HttpServletResponse response) {
	    Cookie cookie = new Cookie("cart_" + UUID.randomUUID(), product_no);
	    cookie.setPath("/");
	    cookie.setMaxAge(60 * 60 * 24 * 7); // 7일 유지
	    response.addCookie(cookie);
	}

	// 로그인 후 비회원 위시리스트 DB로 이동
	@Override
	public void migrateGuestWishlistToDB(HttpServletRequest request, String username, HttpServletResponse response) {
	    Cookie[] cookies = request.getCookies();

	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().startsWith("wishlist_")) {
	                // 쿠키의 값은 상품 번호(product_no)
	                String product_no = cookie.getValue();

	                // DB에 저장할 위시리스트 객체 생성
	                WishlistVO vo = new WishlistVO();
	                vo.setProduct_no(product_no);
	                vo.setUser_id(username);  // 로그인한 회원의 ID
	                vo.setWishlist_create_id(username);
	                vo.setWishlist_update_id(username);

	                // DB에 위시리스트 저장
	                int result = userDAO.insertWishlist(vo);
	                if (result > 0) {
	                    System.out.println("비회원 위시리스트 DB로 이동 성공");
	                } else {
	                    System.out.println("비회원 위시리스트 DB로 이동 실패");
	                }

	                // 쿠키 삭제
	                cookie.setMaxAge(0);  // 쿠키 만료 시간 0으로 설정하여 삭제
	                cookie.setPath("/");
	                response.addCookie(cookie);  // 삭제된 쿠키를 클라이언트로 전송
	                System.out.println("쿠키 삭제: " + cookie.getName());
	            }
	        }
	    }
	}

//	@Override
//	public List<WishlistVO> getGuestRecentlyProductFromCookies(HttpServletRequest request) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void addGuestRecentlyProductToCookies(String product_no, HttpServletRequest request,
//			HttpServletResponse response) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void removeGuestRecentlyProductFromCookies(String wishlist_no, HttpServletRequest request,
//			HttpServletResponse response) {
//		// TODO Auto-generated method stub
//		
//	}


}
