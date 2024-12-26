package pj.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import pj.spring.vo.ProductVO;
import pj.spring.vo.UserVO;

@Controller
public class CartController {
	
	@Autowired
	public CartService cartService;
	
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
	public String cart(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = authentication.getName();
	    System.out.println("user_id : " + user_id);
	    
	    UserVO userVO = new UserVO();
	    userVO.setUser_id(user_id);
	    
	    List<ProductVO> cartList = cartService.selectCartListUser(userVO);
	    ProductVO cartPrice = cartService.selectCartPriceUser(userVO);
	    
	    int shippingPrice = 3000;
	    int totalPrice = Integer.parseInt(cartPrice.getProduct_price()) + shippingPrice;
	    
	    model.addAttribute("cartList", cartList);
	    model.addAttribute("cartPrice", cartPrice);
	    model.addAttribute("totalPrice", totalPrice);
	    
	    return "user/cart/cart";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateCartQuantity.do", method = RequestMethod.POST)
    public int updateCartQuantity(@RequestParam int product_no, @RequestParam int quantity) throws IllegalStateException, IOException {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = null;
		
	    if (authentication != null) {
	    	System.out.println("Authorities: " + authentication.getAuthorities());
	        System.out.println("Principal: " + authentication.getPrincipal());
	    	user_id = authentication.getName();
	    }
	    
	    System.out.println("cart user_id : " + user_id);
	    
        Map<String, Object> map = new HashMap<>();
        
        map.put("product_no", product_no);
        map.put("quantity", quantity);
        
        return cartService.updateCartQuantityUser(user_id, map);
    }
	
}
