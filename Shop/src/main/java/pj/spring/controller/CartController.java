package pj.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pj.spring.service.CarService;
import pj.spring.vo.UserVO;

@Controller
public class CartController {
	
	@Autowired
	public CarService carService;
	
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
}
