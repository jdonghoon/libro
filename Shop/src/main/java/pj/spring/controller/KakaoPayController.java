package pj.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pj.spring.service.KakaoPayService;
import pj.spring.service.PaymentService;
import pj.spring.vo.KakaoPayResponse;
import pj.spring.vo.OrderedVO;

@Controller
@RequestMapping("/kakaoPay")
public class KakaoPayController {

    private static final Logger log = LoggerFactory.getLogger(KakaoPayController.class);

    private final KakaoPayService kakaoPayService;
    
    public PaymentService paymentService;

    @Autowired
    public KakaoPayController(KakaoPayService kakaoPayService) {
        this.kakaoPayService = kakaoPayService;
    }

    /**
     * 카카오페이 결제 준비 요청
     * 사용자로부터 결제 정보를 받아 카카오페이에 요청을 보냅니다.
     * @param paymentData 결제 정보 데이터
     * @param session HTTP 세션
     * @return 카카오페이 결제 준비 응답
     */
    @PostMapping("/ready")
    @ResponseBody
    public ResponseEntity<?> kakaoPayReady(@RequestBody Map<String, Object> paymentData, HttpSession session) {
        try {
            log.info("카카오페이 요청 데이터: {}", paymentData);

            // 결제 데이터 유효성 검증
            if (!paymentData.containsKey("amount")) {
                return ResponseEntity.badRequest().body("Invalid payment data");
            }

            // 현재 인증된 사용자 ID 가져오기
            String userId = getAuthenticatedUserId();
            // 파트너 주문 번호 생성 (UUID 사용)
            String partnerOrderId = UUID.randomUUID().toString();

            // 카카오페이 요청 데이터 생성
            Map<String, Object> kakaoPayRequest = createKakaoPayRequest(paymentData, userId, partnerOrderId);

            // 카카오페이에 결제 준비 요청
            KakaoPayResponse response = kakaoPayService.kakaoPayReady(kakaoPayRequest);

            // 세션에 TID 및 주문 번호 저장
            session.setAttribute("tid", response.getTid());
            session.setAttribute("partner_order_id", partnerOrderId);

            return ResponseEntity.ok(response); // 성공 응답 반환
        } catch (Exception e) {
            log.error("카카오페이 준비 요청 실패: {}", e.getMessage(), e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("결제 요청 중 오류가 발생했습니다.");
        }
    }

    /**
     * 카카오페이 결제 승인 요청
     * 결제가 성공적으로 승인되었는지 확인하고 결과를 반환합니다.
     * @param pgToken 카카오페이 PG 토큰
     * @param session HTTP 세션
     * @param model UI에 전달할 데이터
     * @return 결제 성공 또는 오류 페이지
     */
    @GetMapping("/success")
    public String paymentSuccess(@RequestParam("pg_token") String pgToken, HttpSession session, Model model) {
        try {
            // 세션에서 TID와 주문 번호 조회
            String tid = (String) session.getAttribute("tid");
            String partnerOrderId = (String) session.getAttribute("partner_order_id");

            // 세션 데이터 유효성 검증
            validateSessionData(tid, partnerOrderId);

            // 현재 인증된 사용자 ID 가져오기
            String userId = getAuthenticatedUserId();

            // 결제 승인 요청 데이터 생성
            Map<String, String> approvalRequest = createApprovalRequest(tid, partnerOrderId, userId, pgToken);

            // 카카오페이에 결제 승인 요청
            KakaoPayResponse approvalResponse = kakaoPayService.kakaoPayApprove(approvalRequest);
            log.info("카카오페이 승인 응답: {}", approvalResponse);

            // 주문 데이터를 데이터베이스에 저장
			/*
			 * OrderedVO order = new OrderedVO(); order.setOrdered_no(partnerOrderId); // 주문
			 * 번호 order.setOrdered_date(new
			 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())); // 주문 날짜
			 * order.setOrdered_status("결제 완료"); // 주문 상태 order.setOrdered_address((String)
			 * session.getAttribute("deliveryAddress")); // 배송지
			 * order.setOrdered_name((String) session.getAttribute("deliveryName")); // 주문자
			 * 이름 order.setOrdered_phone((String) session.getAttribute("deliveryPhone")); //
			 * 주문자 휴대폰 order.setOrdered_note((String) session.getAttribute("deliveryMemo"));
			 * // 배송 메모 order.setOrdered_create_id(userId); // 생성자 ID
			 * order.setUser_id(userId); // 사용자 ID
			 */
            // 데이터베이스에 저장
			/* paymentService.insertOrder(order); */

            // 모델에 데이터 추가
			/* model.addAttribute("order", order); */
            // 승인 응답을 모델에 추가하여 성공 페이지에 전달
            model.addAttribute("approvalResponse", approvalResponse);

            return "user/payment/paymentSuccess"; // 결제 성공 페이지로 이동
        } catch (Exception e) {
            log.error("결제 승인 중 오류 발생: {}", e.getMessage(), e);
            model.addAttribute("errorMessage", e.getMessage());
            return "user/payment/paymentError"; // 오류 페이지로 이동
        }
    }

    
    /**
     * 공통 세션 데이터 검증 및 조회 메서드
     */
    private String getSessionAttribute(HttpSession session, String attributeName) {
        Object value = session.getAttribute(attributeName);
        if (value == null) {
            log.error("{} 세션 데이터가 누락되었습니다.", attributeName);
            throw new RuntimeException(attributeName + " 세션 데이터가 누락되었습니다.");
        }
        return value.toString();
    }
    
    /**
     * 현재 인증된 사용자 ID를 반환
     * @return 사용자 ID
     */
    private String getAuthenticatedUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userId = authentication.getName();
        if (userId == null) {
            throw new RuntimeException("User ID가 세션에 없습니다.");
        }
        return userId;
    }

    /**
     * 세션 데이터의 유효성을 검증
     * @param tid TID (Transaction ID)
     * @param partnerOrderId 파트너 주문 번호
     */
    private void validateSessionData(String tid, String partnerOrderId) {
        if (tid == null || partnerOrderId == null) {
            throw new RuntimeException("세션 데이터가 유효하지 않습니다.");
        }
    }

    /**
     * 카카오페이 준비 요청 데이터 생성
     * @param paymentData 결제 정보 데이터
     * @param userId 사용자 ID
     * @param partnerOrderId 파트너 주문 번호
     * @return 카카오페이 준비 요청 데이터
     */
    private Map<String, Object> createKakaoPayRequest(Map<String, Object> paymentData, String userId, String partnerOrderId) {
        Map<String, Object> kakaoPayRequest = new HashMap<>();
        kakaoPayRequest.put("cid", "TC0ONETIME");
        kakaoPayRequest.put("partner_order_id", partnerOrderId);
        kakaoPayRequest.put("partner_user_id", userId);
        kakaoPayRequest.put("item_name", paymentData.get("itemName"));
        kakaoPayRequest.put("quantity", paymentData.get("quantity"));
        kakaoPayRequest.put("total_amount", paymentData.get("amount"));
        kakaoPayRequest.put("vat_amount", 0);
        kakaoPayRequest.put("tax_free_amount", 0);
        kakaoPayRequest.put("approval_url", "http://localhost:8080/controller/kakaoPay/success");
        kakaoPayRequest.put("cancel_url", "http://localhost:8080/controller/kakaoPay/cancel");
        kakaoPayRequest.put("fail_url", "http://localhost:8080/controller/kakaoPay/fail");
        return kakaoPayRequest;
    }

    /**
     * 카카오페이 승인 요청 데이터 생성
     * @param tid TID (Transaction ID)
     * @param partnerOrderId 파트너 주문 번호
     * @param userId 사용자 ID
     * @param pgToken PG 토큰
     * @return 승인 요청 데이터
     */
    private Map<String, String> createApprovalRequest(String tid, String partnerOrderId, String userId, String pgToken) {
        Map<String, String> approvalRequest = new HashMap<>();
        approvalRequest.put("cid", "TC0ONETIME");
        approvalRequest.put("tid", tid);
        approvalRequest.put("partner_order_id", partnerOrderId);
        approvalRequest.put("partner_user_id", userId);
        approvalRequest.put("pg_token", pgToken);
        return approvalRequest;
    }
}
