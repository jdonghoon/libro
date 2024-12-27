package pj.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
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

import pj.spring.service.PaymentService;
import pj.spring.vo.CartSummary;
import pj.spring.vo.UserVO;

@Controller
public class PaymentCotroller {
	
	@Autowired
	public PaymentService paymentService;
	    
	@RequestMapping(value="payment.do", method = RequestMethod.GET)
	public String goPayment(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = authentication.getName();
	    System.out.println(user_id);
	    
	    UserVO userInfo = paymentService.selectPaymentInfo(user_id);
	    
	    String user_phone = userInfo.getUser_phone().replace(",", "-");
	    String address_book_phone = userInfo.getAddress_book_phone().replace(",", "-");
	    
	    userInfo.setUser_phone(user_phone);
	    userInfo.setAddress_book_phone(address_book_phone);
	    
	    List<UserVO> addressInfo = paymentService.selectAddressBook(user_id);
	    
	    for (UserVO address : addressInfo) {
	        String updatedPhone = address.getAddress_book_phone().replace(",", "-");
	        address.setAddress_book_phone(updatedPhone);
	    }

	    model.addAttribute("userInfo", userInfo);
	    model.addAttribute("addressInfo", addressInfo);
		
		return "user/payment/payment";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateCartSummary.do", method = RequestMethod.POST)
	public void updateCartSummary(HttpSession session,
	                              @RequestParam int totalQuantity,
	                              @RequestParam int totalPrice,
	                              @RequestParam int shippingFee,
	                              @RequestParam String displayProductName) {
	    CartSummary cartSummary = new CartSummary(totalQuantity, totalPrice, shippingFee, displayProductName);
	    session.setAttribute("cartSummary", cartSummary);
	}


}
