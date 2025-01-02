package pj.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import pj.spring.vo.GuestVO;
import pj.spring.vo.OrderedVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.RecentlyproductVO;
import pj.spring.vo.ReviewVO;
import pj.spring.vo.UserVO;
import pj.spring.vo.WishlistVO;

@Service // 업무로직을 담당하는 구현 객체를 스프링이 생성하여 관리
public class UserServiceImpl implements UserService {
	
	//-------------------------------------------------------------------------------------------------------------------------------	
	// 회원
	
	@Autowired
	public UserDAO userDAO;
	
	// 회원가입
	@Override
	public int insert(UserVO userVO){
		return userDAO.insert(userVO);
	}

	// 회원탈퇴
	@Override
	public int deleteAccount(String user_id) {
		return userDAO.deleteAccount(user_id);
	}
	
//	// 로그인
//	@Override
//	public UserVO selectLogin(String username){
//		return userDAO.selectLogin(username);
//	}
	
	// 비회원 로그인
	@Override
	public GuestVO selectGuestLogin(GuestVO guestVO) {
		return userDAO.selectGuestLogin(guestVO);
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
	
	// 기본 주소록 업데이트
	@Override
	public int updateAddrTop(String user_id) {
		return userDAO.updateAddrTop(user_id);
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

	// 문의하기 상세
	@Override
	public List<ContactVO> selectContactAttachment(String contact_no) {
		return userDAO.selectContactAttachment(contact_no);
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
	@Override
	public List<OrderedVO> selectorderhistory(String user_id) {
		return userDAO.selectorderhistory(user_id);
	}
	
	// 비회원 주문내역 목록
	@Override
	public List<OrderedVO> selectOrderhistoryGuest(String guest_no) {
		return userDAO.selectOrderhistoryGuest(guest_no);
	}
	
	// 최소 신청
	@Override
	public int updateOrderstatus1(String ordered_no) {
		return userDAO.updateOrderstatus1(ordered_no);
	}

	// 최소 신청
	@Override
	public int updateOrderstatus2(String payment_no) {
		return userDAO.updateOrderstatus2(payment_no);
	}
	
	// 배송지 변경
	@Override
	public OrderedVO selectAddr(String ordered_no) {
		return userDAO.selectAddr(ordered_no);
	}

	// 배송지 변경
	@Override
	public int updateAddr(OrderedVO orderedVO) {
		return userDAO.updateAddr(orderedVO);
	}

	// 취소내역 목록
	@Override
	public List<OrderedVO> selectorderhistorycancel(String user_id) {
		return userDAO.selectorderhistorycancel(user_id);
	}
	
	// 비회원 취소내역 목록
	@Override
	public List<OrderedVO> selectOrderhistoryCancelGuest(String guest_no) {
		return userDAO.selectOrderhistoryCancelGuest(guest_no);
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

	// 카트로 이동
	@Override
	public int insertCart(CartVO cartVO) {
		return userDAO.insertCart(cartVO);
	}

	// 카트로 이동
	@Override
	public int insertCart_(CartVO cartVO) {
		return userDAO.insertCart_(cartVO);
	}
	
	// 카트 중복 조회
	@Override
	public int selectDedupeCart(CartVO cartVO) {
		return userDAO.selectDedupeCart(cartVO);
	}

	// 위시리스트 조회
	@Override
	public List<WishlistVO> selectWishlist(String user_id) {
		return userDAO.selectWishlist(user_id);
	}
	
	// 위시리스트 중복 조회
	@Override
	public int selectDedupeWishlist(WishlistVO wishlistVO) {
		return userDAO.selectDedupeWishlist(wishlistVO);
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
	
	// 최근본상품 중복 조회
	@Override
	public int selectDedupeRecentlyproduct(RecentlyproductVO recentlyproductVO) {
		return userDAO.selectDedupeRecentlyproduct(recentlyproductVO);
	}
	
	// 최근본상품 조회
	@Override
	public List<RecentlyproductVO> selectRecentlyproduct(String user_id) {
		return userDAO.selectRecentlyproduct(user_id);
	}
	
	// 최근본상품 등록
	@Override
	public int insertRecentlyproduct(RecentlyproductVO recentlyproductVO) {
		return userDAO.insertRecentlyproduct(recentlyproductVO);
	}

	// 최근본상품 삭제
	@Override
	public int deleteRecentlyproduct(RecentlyproductVO recentlyproductVO) {
		return userDAO.deleteRecentlyproduct(recentlyproductVO);
	}
	
	// 최근본상품 삭제
	@Override
	public int deleteRecentlyproduct_(String recentlyproduct_no) {
		return userDAO.deleteRecentlyproduct_(recentlyproduct_no);
	}
	
	//-------------------------------------------------------------------------------------------------------------------------------	
	// 비회원
	
	// 최근 본 상품 조회
	@Override
	public List<RecentlyproductVO> getGuestRecentlyProductFromCookies(HttpServletRequest request) {
		List<RecentlyproductVO> list = new ArrayList<RecentlyproductVO>();
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				Cookie cookie = cookies[i];
				if (cookie.getName().startsWith("recentlyproduct_")) {
					String product_no = cookie.getValue();
					
					// product_no가 null인지 확인
					if (product_no == null || product_no.isEmpty()) {
						System.out.println("쿠키에 저장된 product_no가 비어 있습니다.");
						continue;
					}
					
					ReviewVO product = userDAO.selectProductForGuest(product_no);
					
					// product가 null인지 확인
					if (product == null) {
						System.out.println("상품 정보를 찾을 수 없습니다. product_no: " + product_no);
						continue;
					}
					
					RecentlyproductVO vo = new RecentlyproductVO();
					vo.setProduct_no(product.getProduct_no());
					vo.setProduct_name(product.getProduct_name());
					vo.setProduct_author(product.getProduct_author());
					vo.setProduct_publisher(product.getProduct_publisher());
					vo.setProduct_price(product.getProduct_price());
					vo.setReview_starrating_avg(product.getReview_starrating_avg());
					vo.setReview_cnt(product.getReview_cnt());
					vo.setReview_starrating(product.getReview_starrating());
					vo.setProduct_status(product.getProduct_status());
					vo.setAttachment_detail_new_name(product.getAttachment_detail_new_name());
					vo.setRecentlyproduct_no(cookie.getName().substring("recentlyproduct_".length()));
					
					list.add(vo);
				}
			}
		} else {
			System.out.println("요청에 쿠키가 없습니다.");
		}
		return list;
	}
	
	// 최근 본 상품 등록
	@Override
	public void addGuestRecentlyProductToCookies(String product_no, HttpServletRequest request,
			HttpServletResponse response) {
		// product_no 유효성 검사
		if (product_no == null || product_no.trim().isEmpty()) {
			System.out.println("유효하지 않은 상품 번호: " + product_no);
			return;
		}
		
		// 기존 쿠키에서 동일한 product_no가 있는지 확인 및 삭제
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().startsWith("recentlyproduct_") && product_no.equals(cookie.getValue())) {
					System.out.println("이미 등록된 상품입니다. product_no: " + product_no);
					// 기존 상품 쿠키 삭제
					cookie.setMaxAge(0); // 쿠키 삭제
					cookie.setPath("/"); // 경로 설정
					response.addCookie(cookie); // 삭제된 쿠키 응답에 추가
				}
			}
		}
		
		String recentlyproductId = UUID.randomUUID().toString();
		Cookie cookie = new Cookie("recentlyproduct_" + recentlyproductId, product_no);
		cookie.setPath("/");
		cookie.setMaxAge(60 * 60 * 24 * 7);
		cookie.setSecure(request.isSecure());
		
		// 쿠키를 응답에 추가
		response.addCookie(cookie);
		
		// HttpOnly 속성을 직접 설정
		String cookieHeader = String.format(
				"recentlyproduct_%s=%s; Path=/; Max-Age=%d; %s HttpOnly",
				recentlyproductId, product_no, 60 * 60 * 24 * 7,
				request.isSecure() ? "Secure;" : ""
				);
		response.addHeader("Set-Cookie", cookieHeader);
		
//	    // 새로운 쿠키 생성
//	    String recentlyproductId = UUID.randomUUID().toString(); // 고유한 UUID 생성
//	    Cookie cookie = new Cookie("recentlyproduct_" + recentlyproductId, product_no); // 쿠키 이름과 값 설정
//	    cookie.setPath("/"); // 모든 경로에서 유효
//	    cookie.setMaxAge(60 * 60 * 24 * 7); // 7일 유지
//	    cookie.setHttpOnly(true); // JavaScript에서 접근 불가 (보안 강화)
//	    cookie.setSecure(request.isSecure()); // HTTPS 환경에서만 전송 (보안 강화)
		
	}
	
	// 최근 본 상품 삭제
	@Override
	public void removeGuestRecentlyProductFromCookies(String recentlyproduct_no, HttpServletRequest request,
			HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		System.out.println("cookies" + cookies);
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				System.out.println("name::"+cookie.getName().startsWith("recentlyproduct_"));
				System.out.println("value::"+cookie.getValue());
				System.out.println("recentlyproduct_no::"+recentlyproduct_no);
				if (cookie.getName().startsWith("recentlyproduct_") && cookie.getValue().equals(recentlyproduct_no)) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					System.out.println("Deleting cookie: " + cookie.getName());
				}
			}
		}
	}

	// 위시리스트 조회
	@Override
	public List<WishlistVO> getGuestWishlistFromCookies(HttpServletRequest request) {
		List<WishlistVO> list = new ArrayList<WishlistVO>();
		Cookie[] cookies = request.getCookies();

	    if (cookies != null) {
	    	for (int i = cookies.length - 1; i >= 0; i--) {
	    		Cookie cookie = cookies[i];
	            if (cookie.getName().startsWith("wishlist_")) {
	            	System.out.println(cookie.getValue());
	                String product_no = cookie.getValue();
	                
	                // product_no가 null인지 확인
	                if (product_no == null || product_no.isEmpty()) {
	                    System.out.println("쿠키에 저장된 product_no가 비어 있습니다.");
	                    continue;
	                }

	                ReviewVO product = userDAO.selectProductForGuest(product_no);

	                // product가 null인지 확인
	                if (product == null) {
	                    System.out.println("상품 정보를 찾을 수 없습니다. product_no: " + product_no);
	                    continue;
	                }

					WishlistVO vo = new WishlistVO();
					vo.setProduct_no(product.getProduct_no());
					vo.setProduct_name(product.getProduct_name());
					vo.setProduct_author(product.getProduct_author());
					vo.setProduct_publisher(product.getProduct_publisher());
					vo.setProduct_price(product.getProduct_price());
					vo.setReview_starrating_avg(product.getReview_starrating_avg());
					vo.setReview_cnt(product.getReview_cnt());
					vo.setProduct_status(product.getProduct_status());
					vo.setAttachment_detail_new_name(product.getAttachment_detail_new_name());
					vo.setWishlist_no(cookie.getName().substring("wishlist_".length()));

	                list.add(vo);
	            }
	        }
	    } else {
	        System.out.println("요청에 쿠키가 없습니다.");
	    }
	    return list;
	}

	// 위시리스트 등록
	@Override
	public void addGuestWishlistToCookies(String product_no, HttpServletRequest request, HttpServletResponse response) {
		  // product_no 유효성 검사
	    if (product_no == null || product_no.trim().isEmpty()) {
	        System.out.println("유효하지 않은 상품 번호: " + product_no);
	        return;
	    }
		
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().startsWith("wishlist_") && product_no.equals(cookie.getValue())) {
	                System.out.println("이미 등록된 상품입니다. product_no: " + product_no);
	                return; // 중복된 상품이면 추가하지 않음
	            }
	        }
	    }
	    
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
	
	// 사이드 카트 조회
	@Override
	public List<ProductVO> selectCart(Map<String, Object> params, HttpServletRequest request) {
	    List<ProductVO> list = new ArrayList<ProductVO>();
	    Cookie[] cookies = request.getCookies();

	    if (cookies != null) {
	        for (int i = cookies.length - 1; i >= 0; i--) {
	            Cookie cookie = cookies[i];
	            if (cookie.getName().startsWith("cart_")) {
		            ProductVO product = userDAO.selectCartListGuest(cookie.getValue());
	
		            // 상품이 null이 아니면 CartVO에 값 설정
		            if (product != null) {
		                CartVO vo = new CartVO();
		                vo.setProduct_no(product.getProduct_no());
		                vo.setProduct_name(product.getProduct_name());
		                vo.setProduct_author(product.getProduct_author());
		                vo.setProduct_publisher(product.getProduct_publisher());
		                vo.setProduct_price(product.getProduct_price());
		                vo.setCategory_name(product.getCategory_name());
		                vo.setProduct_created_at(product.getProduct_created_at());
		                vo.setAttachment_detail_new_name(product.getAttachment_detail_new_name());
	
		                list.add(vo);
		            } else {
		                System.out.println("상품 정보를 찾을 수 없습니다. product_no: " + cookie.getValue());
		            }
		        }
	        }
	    } else {
        System.out.println("장바구니에 상품이 없습니다.");
    }
	    return list;
	}
	
	// 카트 수량 업데이트
	@Override
	public void updateCartForGuest(String product_no, int quantity, HttpServletRequest request, HttpServletResponse response) {
	    // 기존 장바구니 쿠키를 검색 및 삭제
	    Cookie[] cookies = request.getCookies();
	    String updatedCartCookieName = null;

	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().startsWith("cart_") && cookie.getValue().contains(product_no)) {
	                String cartCookieName = cookie.getName();
	                // 기존 쿠키 값을 업데이트
	                updatedCartCookieName = updateProductQuantityInCart(cartCookieName, product_no, quantity);
	                
	                // 기존 쿠키 삭제
	                cookie.setMaxAge(0);
	                cookie.setPath("/");
	                response.addCookie(cookie);
	                break;
	            }
	        }
	    }

	    // 새로운 쿠키 이름 생성 (예: cart_ + product_no)
	    String newCookieName = "cart_" + product_no + "_" + quantity;

	    Cookie newCookie = new Cookie(newCookieName, product_no);
	    newCookie.setMaxAge(60 * 60 * 24 * 7); // 7일 동안 유지
	    newCookie.setPath("/"); // 모든 경로에서 접근 가능
	    response.addCookie(newCookie);

	    System.out.println("비회원 장바구니 업데이트: " + newCookie.getName() + ", " + newCookie.getValue());
	}

	// 수량 업데이트를 처리하는 메서드
	private String updateProductQuantityInCart(String cartCookieName, String product_no, int quantity) {
	    String[] cartItems = cartCookieName.split("\\|");
	    StringBuilder updatedCart = new StringBuilder();
	    boolean isUpdated = false;

	    for (String item : cartItems) {
	        String[] itemDetails = item.split("_");
	        if (itemDetails.length < 3) continue; // 잘못된 형식의 항목은 무시

	        String itemProductNo = itemDetails[1];
	        System.out.println("itemProductNo" + itemProductNo);
	        int itemQuantity;
	        try {
	            itemQuantity = Integer.parseInt(itemDetails[2]);
	            System.out.println("itemQuantity" + itemQuantity);
	        } catch (NumberFormatException e) {
	            // 수량 값이 숫자가 아니면 무시
	            continue;
	        }

	        // 상품 번호가 일치하면 수량 업데이트
	        if (itemProductNo.equals(product_no)) {
	            itemQuantity = quantity;
	            System.out.println("itemQuantity" + itemQuantity);
	            isUpdated = true;
	        }

	        if (updatedCart.length() > 0) {
	            updatedCart.append("|");
	        }
	        updatedCart.append(itemDetails[0]).append("_").append(itemProductNo).append("_").append(itemQuantity);
	    }

	    // 기존 항목이 없다면 새 항목 추가
	    if (!isUpdated) {
	        if (updatedCart.length() > 0) {
	            updatedCart.append("|");
	        }
	        updatedCart.append("cart").append("_").append(product_no).append("_").append(quantity);
	    }

	    return updatedCart.toString();
	}

	// 카트 조회
	@Override
	public List<CartVO> getGuestCartFromCookies(HttpServletRequest request) {
	    List<CartVO> list = new ArrayList<CartVO>();
	    Cookie[] cookies = request.getCookies();

	    if (cookies != null) {
	        for (int i = cookies.length - 1; i >= 0; i--) {
	            Cookie cookie = cookies[i];
	            if (cookie.getName().startsWith("cart_")) {
	                String cartData = cookie.getName();
	                
	                if (cartData == null || cartData.isEmpty()) {
	                    continue;  // 빈 값이면 건너뛰기
	                }

	                // cartData에서 각 상품 번호와 수량을 추출
	                String[] cartItems = cartData.split("\\|");
	                for (String item : cartItems) {
	                    String[] itemDetails = item.split("_");
	                    
	                    if (itemDetails.length < 2) {
	                        System.out.println("잘못된 형식의 항목: " + item);
	                        continue;  // 잘못된 형식의 항목은 건너뜁니다.
	                    }

	                    String product_no = cookie.getValue();
	                    int quantity = 1;

	                    // 수량 정보가 있을 경우 처리
	                    if (itemDetails.length >= 3) {
	                        try {
	                            quantity = Integer.parseInt(itemDetails[2]);
	                            
	                            System.out.println("quantity : " + quantity);
	                        } catch (NumberFormatException e) {
	                            quantity = 1;  // 수량이 유효하지 않으면 기본값 1로 설정
	                        }
	                    }

	                    ProductVO product = userDAO.selectCartListGuest(product_no);

	                    // 상품이 null이 아니면 CartVO에 값 설정
	                    if (product != null) {
	                        CartVO vo = new CartVO();
	                        vo.setProduct_no(product.getProduct_no());
	                        vo.setProduct_name(product.getProduct_name());
	                        vo.setProduct_author(product.getProduct_author());
	                        vo.setProduct_publisher(product.getProduct_publisher());
	                        vo.setProduct_price(product.getProduct_price());
	                        vo.setProduct_status(product.getProduct_status());
	                        vo.setCategory_name(product.getCategory_name());
	                        vo.setProduct_created_at(product.getProduct_created_at());
	                        vo.setProduct_status(product.getProduct_status());
	                        
	                        // 수량이 없으면 기본값 1로 설정
	                        System.out.println("quantity : " + quantity);
	                        vo.setCart_product_quantity(quantity > 0 ? quantity : 1);

	                        vo.setAttachment_detail_new_name(product.getAttachment_detail_new_name());
	                        list.add(vo);
	                    } else {
	                        System.out.println("상품 정보를 찾을 수 없습니다. product_no: " + product_no);
	                    }
	                }
	            }
	        }
	    } else {
	        System.out.println("요청에 쿠키가 없습니다.");
	    }
	    return list;
	}


	// 카트  등록
	@Override
	public void addGuestCartToCookies(String product_no, HttpServletRequest request, HttpServletResponse response) {
		// product_no 유효성 검사
	    if (product_no == null || product_no.trim().isEmpty()) {
	        System.out.println("유효하지 않은 상품 번호: " + product_no);
	        return;
	    }
		
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().startsWith("cart_") && product_no.equals(cookie.getValue())) {
	                System.out.println("이미 등록된 상품입니다. product_no: " + product_no);
	                return; // 중복된 상품이면 추가하지 않음
	            }
	        }
	    }
	
		String cartId = product_no + "_1"; // 고유한 UUID 생성
		Cookie cookie = new Cookie("cart_" + cartId, String.valueOf(product_no)); // 쿠키 이름을 일관되게 설정
		cookie.setPath("/"); // 쿠키가 모든 경로에서 유효하도록 설정
		cookie.setMaxAge(60 * 60 * 24 * 7); // 7일 유지
		response.addCookie(cookie); // 쿠키를 클라이언트에 전달
	}

	// 카트 삭제
	@Override
	public int removeGuestCartFromCookies(String cart_no, HttpServletRequest request,
			HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		System.out.println("cookies" + cookies);
		if (cookies != null) {
			for (Cookie cookie : cookies) {
//				System.out.println("name::"+cookie.getName().startsWith("wishlist_"));
//				System.out.println("value::"+cookie.getValue());
//				System.out.println("wishlist_no::"+wishlist_no);
				if (cookie.getName().startsWith("cart_") && cookie.getValue().equals(cart_no)) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					System.out.println("Deleting cookie: " + cookie.getName());
				}
			}
		}
		return 1;
	}

	// 로그인 후 비회원 데이터 DB로 이동
	@Override
	public void migrateGuestDataToDB(HttpServletRequest request, String username, HttpServletResponse response) {
	    Cookie[] cookies = request.getCookies();

	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().startsWith("wishlist_")) {
	                // 쿠키의 값은 상품 번호(product_no)
	                String product_no = cookie.getValue();
	                
	               System.out.println("product_no" + product_no);
	                
	                WishlistVO wishlistVO = new WishlistVO();
	                wishlistVO.setProduct_no(product_no);
	                wishlistVO.setUser_id(username);

	                int result1 = userDAO.selectDedupeWishlist(wishlistVO);
	                
	                if(result1 == 0)
	                {
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
	                }
	            } else if (cookie.getName().startsWith("recentlyproduct_")) {
	                // 쿠키의 값은 상품 번호(product_no)
	                String product_no = cookie.getValue();
	                
	                RecentlyproductVO recentlyproductVO = new RecentlyproductVO();
	                recentlyproductVO.setProduct_no(product_no);
	                recentlyproductVO.setUser_id(username);
	                
	                int result1 = userDAO.selectDedupeRecentlyproduct(recentlyproductVO);

            		if(result1 == 0)
            		{
		                // DB에 저장할 최근본상품 객체 생성
		                RecentlyproductVO vo = new RecentlyproductVO();
		                vo.setProduct_no(product_no);
		                vo.setUser_id(username);  // 로그인한 회원의 ID
		                vo.setWishlist_create_id(username);
		                vo.setWishlist_update_id(username);
	
		                // DB에 위시리스트 저장
		                int result = userDAO.insertRecentlyproduct(vo);
		                if (result > 0) {
		                    System.out.println("비회원 최근 본 상품 DB로 이동 성공");
		                } else {
		                    System.out.println("비회원 최근 본 상품 DB로 이동 실패");
		                }
            		}
	            } else if (cookie.getName().startsWith("cart_")) {
	        	    String[] cartItems = cookie.getName().split("\\|");

	        	    for (String item : cartItems) {
	            		String[] itemDetails = item.split("_");
	            		
	            		if (itemDetails.length == 3) {  // 상품 번호와 수량이 있는 경우에만 처리
	                        String product_no = itemDetails[1];  // 상품 번호는 두 번째 항목에 있음
	                        int Cart_product_quantity = Integer.parseInt(itemDetails[2]);  // 수량 값 추출
			        	
				        	CartVO cartVO = new CartVO();
				        	cartVO.setProduct_no(product_no);
				        	cartVO.setUser_id(username);
				        	
				        	int result1 = userDAO.selectDedupeCart(cartVO);
				        	
				        	if(result1 == 0)
				        	{
				        		// DB에 저장할 카트 객체 생성
				        		CartVO vo = new CartVO();
				        		
				        		System.out.println("Cart_product_quantity" + Cart_product_quantity);
				        		vo.setCart_product_quantity(Cart_product_quantity);
				        		vo.setProduct_no(product_no);
				        		vo.setUser_id(username);  // 로그인한 회원의 ID
				        		vo.setCart_create_id(username);
				        		vo.setCart_update_id(username);
				        		
				        		// DB에 위시리스트 저장
				        		int result = userDAO.insertCart(vo);
				        		if (result > 0) {
				        			System.out.println("비회원 카트 DB로 이동 성공");
				        		} else {
				        			System.out.println("비회원 카트 DB로 이동 실패");
				        		}
				        	}
	            		}
	            	}
	            }
	        }
	    }
	}

}
