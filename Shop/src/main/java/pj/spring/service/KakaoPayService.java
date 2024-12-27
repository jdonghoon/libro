package pj.spring.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import pj.spring.vo.KakaoPayRequest;
import pj.spring.vo.KakaoPayResponse;

@Service
public class KakaoPayService {

    private static final String KAKAO_PAY_READY_URL = "https://kapi.kakao.com/v1/payment/ready";
    private static final String ADMIN_KEY = "900f9e6e915322c671103b49f7ddbdda"; // REST API Key

    public KakaoPayResponse kakaoPayReady(KakaoPayRequest request) {
        RestTemplate restTemplate = new RestTemplate();

        try {
            // 요청 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", "KakaoAK " + ADMIN_KEY); // 인증 키
            headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

            // 요청 바디 설정
            MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
            body.add("cid", "TC0ONETIME"); // 테스트용 CID
			/*
			 * body.add("partner_order_id", request.getOrderId());
			 * body.add("partner_user_id", request.getUserId());
			 */
            body.add("item_name", request.getItemName());
            body.add("quantity", String.valueOf(request.getQuantity()));
            body.add("total_amount", String.valueOf(request.getAmount()));
            body.add("tax_free_amount", "0");
            body.add("approval_url", "http://localhost:8080/kakaoPay/success");
            body.add("cancel_url", "http://localhost:8080/kakaoPay/cancel");
            body.add("fail_url", "http://localhost:8080/kakaoPay/fail");

            HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

            // API 호출
            ResponseEntity<KakaoPayResponse> response = restTemplate.postForEntity(KAKAO_PAY_READY_URL, entity, KakaoPayResponse.class);

            System.out.println("Response: " + response.getBody());
            return response.getBody();
        } catch (Exception e) {
            System.err.println("카카오페이 API 호출 중 오류 발생: " + e.getMessage());
            throw new RuntimeException("카카오페이 결제 준비 중 오류 발생", e);
        }
    }
}


