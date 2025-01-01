package pj.spring.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import pj.spring.controller.KakaoPayController;
import pj.spring.vo.KakaoPayResponse;

@Service
public class KakaoPayService {
	private static final Logger log = LoggerFactory.getLogger(KakaoPayController.class);
	
    private static final String KAKAO_PAY_URL = "https://kapi.kakao.com/v1/payment/ready";
    private static final String ADMIN_KEY = "KakaoAK 34f631e3b17f6fdd4b5e2ad359e5a088";

    public KakaoPayResponse kakaoPayReady(Map<String, Object> requestParams) {
        try {
            RestTemplate restTemplate = new RestTemplate();

            // 요청 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
            headers.set("Authorization", ADMIN_KEY);

            // 요청 바디 설정
            MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
            // 필요한 필드만 명시적으로 추가
            body.add("cid", "TC0ONETIME");
            body.add("partner_order_id", requestParams.get("partner_order_id").toString());
            body.add("partner_user_id", requestParams.get("partner_user_id").toString());
            body.add("item_name", requestParams.get("item_name").toString());
            body.add("quantity", requestParams.get("quantity").toString());
            body.add("total_amount", requestParams.get("total_amount").toString());
            body.add("vat_amount", "0"); // 고정값
            body.add("tax_free_amount", "0"); // 고정값
            body.add("approval_url", requestParams.get("approval_url").toString());
            body.add("cancel_url", requestParams.get("cancel_url").toString());
            body.add("fail_url", requestParams.get("fail_url").toString());

            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);

            // 카카오페이 API 호출
            String kakaoPayUrl = KAKAO_PAY_URL;
            ResponseEntity<KakaoPayResponse> response = restTemplate.postForEntity(kakaoPayUrl, request, KakaoPayResponse.class);

            if (response.getBody() == null) {
                log.error("카카오페이 응답이 null입니다.");
                throw new RuntimeException("카카오페이 응답이 null입니다.");
            }
            log.info("카카오페이 응답: {}", response.getBody());
            return response.getBody();
        } catch (HttpClientErrorException e) {
            log.error("HTTP 에러 발생: {}", e.getResponseBodyAsString());
            throw new RuntimeException("카카오페이 요청 실패: " + e.getResponseBodyAsString());
        } catch (Exception e) {
            log.error("카카오페이 API 호출 중 예외 발생", e);
            throw new RuntimeException("카카오페이 API 호출 실패");
        }
    }
    
    public KakaoPayResponse kakaoPayApprove(Map<String, String> requestParams) {
        try {
            RestTemplate restTemplate = new RestTemplate();

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
            headers.set("Authorization", "KakaoAK YOUR_ADMIN_KEY");

            MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
            requestParams.forEach((key, value) -> body.add(key, value));

            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);
            ResponseEntity<KakaoPayResponse> response = restTemplate.postForEntity("https://kapi.kakao.com/v1/payment/approve", request, KakaoPayResponse.class);

            return response.getBody();
        } catch (Exception e) {
            log.error("카카오페이 승인 API 호출 실패", e);
            throw new RuntimeException("카카오페이 승인 요청 실패");
        }
    }
}





