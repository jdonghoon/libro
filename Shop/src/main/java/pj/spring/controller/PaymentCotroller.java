package pj.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pj.spring.service.PaymentService;
import pj.spring.vo.UserVO;

@Controller
public class PaymentCotroller {
	
	@Autowired
	public PaymentService paymentService;
	
	@RequestMapping(value="payment.do", method = RequestMethod.GET)
	public String goPayment(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = authentication.getName();
	    System.out.println(user_id);
	    
	    UserVO userInfo = paymentService.selectPaymentInfo(user_id);
	    
	    String user_phone = userInfo.getUser_phone().replace(",", "-");
	    String address_book_phone = userInfo.getAddress_book_phone().replace(",", "-");
	    System.out.println(user_phone);
	    
	    userInfo.setUser_phone(user_phone);
	    userInfo.setAddress_book_phone(address_book_phone);
	    
	    model.addAttribute("userInfo", userInfo);
		
		return "user/payment/payment";
	}

}
