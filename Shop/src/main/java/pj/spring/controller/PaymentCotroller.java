package pj.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	    
	@PostMapping("/directPurchase.do")
	public String directPurchase(@RequestBody Map<String, Object> requestData, HttpSession session, Model model) {
	    // 상품 데이터 추출
	    int productNo = (int) requestData.get("productNo");
	    String productName = (String) requestData.get("productName");
	    int productPrice = (int) requestData.get("productPrice");
	    int quantity = (int) requestData.get("quantity");

	    // 구매 정보 생성
	    Map<String, Object> purchaseInfo = new HashMap<>();
	    purchaseInfo.put("product_no", productNo);
	    purchaseInfo.put("product_name", productName);
	    purchaseInfo.put("product_price", productPrice);
	    purchaseInfo.put("quantity", quantity);
	    purchaseInfo.put("total_price", productPrice * quantity);

	    // 세션에 저장
	    session.setAttribute("directPurchase", purchaseInfo);

	    // payment.jsp로 리다이렉트
	    return "redirect:/payment";
	}


	
	@RequestMapping(value="payment.do", method = RequestMethod.GET)
	public String goPayment(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = authentication.getName();
	    System.out.println("사용자 ID: " + user_id);

	    UserVO userInfo = paymentService.selectPaymentInfo(user_id);

	    if (userInfo == null) {
	        model.addAttribute("error", "사용자 정보를 찾을 수 없습니다.");
	        return "error"; // 에러 페이지로 이동
	    }

	    // 전화번호 데이터 처리
	    String user_phone = userInfo.getUser_phone().replace(",", "-");
	    String address_book_phone = userInfo.getAddress_book_phone().replace(",", "-");

	    userInfo.setUser_phone(user_phone);
	    userInfo.setAddress_book_phone(address_book_phone);

	    // 배송지 정보
	    List<UserVO> addressInfo = paymentService.selectAddressBook(user_id);
	    for (UserVO address : addressInfo) {
	        String updatedPhone = address.getAddress_book_phone().replace(",", "-");
	        address.setAddress_book_phone(updatedPhone);
	    }

	    model.addAttribute("userInfo", userInfo);
	    model.addAttribute("addressInfo", addressInfo);

	    return "user/payment/payment";
	}
	
	@PostMapping("/updateCartSummary.do")
	@ResponseBody
	public String updateCartSummary(
	    @RequestParam int totalQuantity,
	    @RequestParam int totalPrice,
	    @RequestParam int shippingFee,
	    @RequestParam String displayProductName,
	    HttpSession session) {

	    CartSummary cartSummary = new CartSummary();
	    cartSummary.setTotalQuantity(totalQuantity);
	    cartSummary.setTotalPrice(totalPrice);
	    cartSummary.setShippingFee(shippingFee);
	    cartSummary.setDisplayProductName(displayProductName);

	    session.setAttribute("cartSummary", cartSummary);

	    return "Cart summary updated successfully.";
	}




}
