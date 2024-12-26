package pj.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pj.spring.service.MenuService;
import pj.spring.service.UserService;
import pj.spring.util.PagingUtil;
import pj.spring.vo.CartVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.RecentlyproductVO;
import pj.spring.vo.ReviewVO;
import pj.spring.vo.SearchVO;
import pj.spring.vo.WishlistVO;

@Controller
public class MenuController {
	
	@Autowired
	public MenuService menuService;
	
	@Autowired
	public UserService userService;
	
	@RequestMapping(value = "/newList.do", method = RequestMethod.GET)
	public String newList(Model model, SearchVO searchVO, @RequestParam(value="nowPage", required = false, defaultValue="1") int nowpage, HttpServletRequest request) {
		
		/* System.out.println(searchVO.getCategoryType()); */
		
		int total = menuService.selectTotal(searchVO);
		
		PagingUtil paging = new PagingUtil(nowpage, total, 10);
		
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		
		List<ProductVO> newList = menuService.selectNewList(searchVO);
		/* System.out.println(newList.size()); */
		
		List<ProductVO> recommend = menuService.selectRecommend();
		
		model.addAttribute("paging", paging);
		model.addAttribute("newList", newList);
		model.addAttribute("recommend", recommend);
		
		return "user/menu/newList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/category.do", produces = "application/json; charset=UTF-8")
	public Map<String, Object> ajaxCategory(Model model, SearchVO searchVO, @RequestParam(value="nowPage", required = false, defaultValue="1") int nowpage) {
	    
		int total = menuService.selectTotal(searchVO);
	    
	    PagingUtil paging = new PagingUtil(nowpage, total, 10);
		
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		
	    List<ProductVO> ajaxCategory = menuService.selectNewList(searchVO);
	    
	    Map<String, Object> result = new HashMap<>();
	    result.put("categoryData", ajaxCategory);
	    result.put("paging", paging);
	    
	    return result;
	}

	@RequestMapping(value = "/bestsellerList.do", method = RequestMethod.GET)
	public String bestsellerList(Model model, SearchVO searchVO, @RequestParam(value="nowPage", required = false, defaultValue="1") int nowpage) {
		
		int total = menuService.selectTotal(searchVO);
		
		PagingUtil paging = new PagingUtil(nowpage, total, 10);
		
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		
		List<ProductVO> bestsellerList = menuService.selectBestsellerList(searchVO);
		List<ProductVO> recommend = menuService.selectRecommend();
		
		model.addAttribute("paging", paging);
		model.addAttribute("bestsellerList", bestsellerList);
		model.addAttribute("recommend", recommend);
		
		return "user/menu/bestsellerList";
	}
	
	@RequestMapping(value = "/totalList.do", method = RequestMethod.GET)
	public String totalList(Model model, SearchVO searchVO, @RequestParam(value="nowPage", required = false, defaultValue="1") int nowpage) {
		
		int total = menuService.selectTotal(searchVO);
		
		PagingUtil paging = new PagingUtil(nowpage, total, 10);
		
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		
		List<ProductVO> totalList = menuService.selectTotalList(searchVO);
		List<ProductVO> recommend = menuService.selectRecommend();
		
		model.addAttribute("paging", paging);
		model.addAttribute("totalList", totalList);
		model.addAttribute("recommend", recommend);
		
		return "user/menu/totalList";
	}
	
	
	@RequestMapping(value= "/product.do", method = RequestMethod.GET)
	public String productDetail(Model model, int product_no, RecentlyproductVO vo, HttpServletRequest request, HttpServletResponse response) {
		
		ProductVO productDetail = menuService.selectProductDetail(product_no);
		ReviewVO reviewDetail = menuService.selectReviewDetail(product_no);

		model.addAttribute("productDetail", productDetail);
		model.addAttribute("reviewDetail", reviewDetail);
		
		// 최근 본 상품 등록 로직 추가
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();

		if ("anonymousUser".equals(username)) { 
			// 비회원: 쿠키에 최근 본 상품 추가
			userService.addGuestRecentlyProductToCookies(vo.getProduct_no(), request, response);
		} else { 
			vo.setUser_id(username);
			vo.setProduct_no(vo.getProduct_no());
			vo.setRecentlyproduct_no(vo.getRecentlyproduct_no());
			int result1 = userService.selectDedupeRecentlyproduct(vo);
			System.out.println("re?" + result1);
			
			if(result1 > 0) {
				System.out.println("vo.getRecentlyproduct_no()" + vo.getRecentlyproduct_no());
				int result2 = userService.deleteRecentlyproduct(vo);
				System.out.println("최근 삭제");
			}
			
			int result3 = userService.insertRecentlyproduct(vo);
			
			if (result3 > 0) {
				System.out.println("회원 최근본상품 등록 완료");
			} else {
				System.out.println("회원 최근본상품 등록 실패");
			}
		}
		
		
		return "user/menu/productDetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addToCart.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Map<String, Object> addToCart(CartVO cartVO, @RequestParam("product_no") String product_no, HttpSession session) throws IllegalStateException, IOException {

	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String userId = authentication.getName();
	    String cartCreateId = authentication.getName();

	    System.out.println("user_id : " + userId);
	    System.out.println("cart_create_id : " + cartCreateId);
	    System.out.println("product_no : " + product_no);

	    Map<String, Object> response = new HashMap<>();

	    if (userId != null) {
	        cartVO.setUser_id(userId);
	        cartVO.setCart_create_id(cartCreateId);
	        cartVO.setProduct_no(product_no);
	        cartVO.setCart_product_quantity(1);

	        // 중복 확인
	        if (menuService.checkCart(cartVO)) {
	            response.put("success", false);
	            response.put("message", "이미 추가된 상품입니다."); // 중복 상품 메시지
	        } else {
	            int result = menuService.addToCart(cartVO);
	            if (result > 0) {
	                response.put("success", true);
	                System.out.println("success result : 성공");
	            } else {
	                response.put("success", false);
	                response.put("message", "장바구니 추가에 실패하였습니다."); // 삽입 실패 메시지
	            }
	        }
	    } else {
	        response.put("success", false);
	        response.put("message", "로그인이 필요합니다.");
	    }
	    return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "/addToWishlist.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Map<String, Object> addToWishlist(WishlistVO wishlistVO, @RequestParam("product_no") String product_no, HttpSession session) throws IllegalStateException, IOException {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userId = authentication.getName();
		String wishlistCreateId = authentication.getName();
		
		System.out.println("user_id : " + userId);
		System.out.println("wishlist_create_id : " + wishlistCreateId);
		System.out.println("product_no : " + product_no);
		
		Map<String, Object> response = new HashMap<>();
		
		if(userId != null) {
			
	        wishlistVO.setUser_id(userId);
	        wishlistVO.setWishlist_create_id(wishlistCreateId);
	        wishlistVO.setProduct_no(product_no);
	        wishlistVO.setWishlist_product_quantity(1);

	     // 중복 확인
	        if (menuService.checkWishlist(wishlistVO)) {
	            response.put("success", false);
	            response.put("message", "이미 추가된 상품입니다."); // 중복 상품 메시지
	        } else {
	            int result = menuService.addToWishlist(wishlistVO);
	            if (result > 0) {
	                response.put("success", true);
	                System.out.println("success result : 성공");
	            } else {
	                response.put("success", false);
	                response.put("message", "장바구니 추가에 실패하였습니다."); // 삽입 실패 메시지
	            }
	        }
	    } else {
	        response.put("success", false);
	        response.put("message", "로그인이 필요합니다.");
	    }
	    return response;
	}
}
