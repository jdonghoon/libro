package pj.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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

import pj.spring.service.CartService;
import pj.spring.service.UserService;
import pj.spring.vo.CartVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.UserVO;
import pj.spring.vo.cartPrice;

@Controller
public class CartController {
	
	@Autowired
	public CartService cartService;
	
	@Autowired
	public UserService userService;
	
	@ResponseBody
	@RequestMapping(value = "/addcart.do", produces = "application/json; charset=UTF-8")
	public Map<String, Object> addCart(HttpSession session, @RequestParam("product_no") int product_no) {
		
		Map<String, Object> result = new HashMap<>();
		
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		if(loginUser == null) {
			result.put("success", false);
			result.put("message", "로그인이 필요합니다.");
			
			 return result;
		}
		
		List<Integer> cart = (List<Integer>) session.getAttribute("cart");
		if(cart == null) {
			cart = new ArrayList<>();
		}
		
		cart.add(product_no);
		session.setAttribute("cart", cart);
		
		result.put("success", true);
		return result;
	}
	
	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public String cart(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = authentication.getName();
//	    System.out.println("user_id : " + user_id);
	    
	    UserVO userVO = new UserVO();
	    userVO.setUser_id(user_id);
	    
	    if (user_id.equals("anonymousUser")) { // 비회원
	    	
			// 쿠키 가져오기
		    Cookie[] cookies = request.getCookies();
		    
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            // 쿠키 이름과 값을 출력
		            System.out.println("쿠키 이름: " + cookie.getName() + ", 쿠키 값: " + cookie.getValue());
//		            userService.removeGuestCartFromCookies(cookie.getValue(), request, response);
		        }
		    } else {
		        System.out.println("쿠키가 존재하지 않습니다.");
		    }
		    
	    	
	    	List<CartVO> list = userService.getGuestCartFromCookies(request);
	    	System.out.println("카트 갯수 : " + list.size());

	    	int cartPrice = 0;
	    	int ProductQuantity = 0;
	    	int totalProductPrice = 0;
	    	int totalProductQuantity = 0;
	    	
	    	List<cartPrice> cartPriceList = new ArrayList<cartPrice>();

	    	for (CartVO cartVO : list) {
	    		if("E".equals(cartVO.getProduct_status())) {
	    	    String productPriceStr = cartVO.getProduct_price();
	    	    int productPrice = 0;
	    	    if (productPriceStr != null && !productPriceStr.isEmpty()) {
	    	        try {
	    	            productPrice = Integer.parseInt(productPriceStr);
	    	        } catch (NumberFormatException e) {
	    	            productPrice = 0;
	    	        }
	    	    }

	    	    int productQuantity = cartVO.getCart_product_quantity();

	    	    totalProductPrice += (productPrice * productQuantity);
	    	    totalProductQuantity += productQuantity;
	    		}
	    	}
	    	cartPriceList.add(new cartPrice(totalProductPrice, totalProductQuantity));

	    	int shippingPrice = 3000;

	    	model.addAttribute("cartList", list);
	    	model.addAttribute("cartPrice", cartPriceList);
	    	
	    } else {
	    	List<ProductVO> cartList = cartService.selectCartListUser(userVO);
	    	ProductVO cartPrice = cartService.selectCartPriceUser(userVO);
	    	
	    	int shippingPrice = 3000;
	    	int totalPrice = Integer.parseInt(cartPrice.getProduct_price()) + shippingPrice;
	    	
	    	model.addAttribute("cartList", cartList);
	    	model.addAttribute("cartPrice", cartPrice);
	    	model.addAttribute("totalPrice", totalPrice);
	    }
	    
	    
	    return "user/cart/cart";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateCartQuantity.do", method = RequestMethod.POST)
    public int updateCartQuantity(@RequestParam int product_no, @RequestParam int quantity, HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = null;
		
	    if (authentication != null) {
//	    	System.out.println("Authorities: " + authentication.getAuthorities());
//	        System.out.println("Principal: " + authentication.getPrincipal());
	    	user_id = authentication.getName();
	    }
	    
	    if (user_id.equals("anonymousUser")) {
	    	
	    	userService.updateCartForGuest(Integer.toString(product_no), quantity, request, response);
	    	
	    	return 1;
	    } else {
//	    	System.out.println("cart user_id : " + user_id);
	    	
	    	Map<String, Object> map = new HashMap<>();
	    	
	    	map.put("product_no", product_no);
	    	map.put("quantity", quantity);
	    	
	    	return cartService.updateCartQuantityUser(user_id, map);
	    }
	    
    }
	
}
