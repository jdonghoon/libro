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

import pj.spring.vo.KakaoPayResponse;

@Service
public class KakaoPayService {

    private static final Logger log = LoggerFactory.getLogger(KakaoPayService.class);

    // 카카오페이 결제 준비 URL 및 인증 키
    private static final String KAKAO_PAY_READY_URL = "https://kapi.kakao.com/v1/payment/ready";
    private static final String KAKAO_PAY_APPROVE_URL = "https://kapi.kakao.com/v1/payment/approve";
    private static final String ADMIN_KEY = "KakaoAK 34f631e3b17f6fdd4b5e2ad359e5a088";

    /**
     * 카카오페이 결제 준비 요청
     * @param requestParams 결제 준비 요청 데이터
     * @return KakaoPayResponse 카카오페이 결제 준비 응답 데이터
     */
    public KakaoPayResponse kakaoPayReady(Map<String, Object> requestParams) {
        try {
            RestTemplate restTemplate = new RestTemplate();

            // HTTP 요청 헤더 설정
            HttpHeaders headers = createHeaders();

            // HTTP 요청 바디 설정
            MultiValueMap<String, String> body = createReadyRequestBody(requestParams);

            // HTTP 요청 객체 생성
            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);

            // 카카오페이 API 호출
            ResponseEntity<KakaoPayResponse> response = restTemplate.postForEntity(
                KAKAO_PAY_READY_URL, request, KakaoPayResponse.class
            );

            // 응답 데이터 확인
            if (response.getBody() == null) {
                log.error("카카오페이 응답이 null입니다.");
                throw new RuntimeException("카카오페이 응답이 null입니다.");
            }

            log.info("카카오페이 준비 응답 데이터: {}", response.getBody());
            return response.getBody();
        } catch (HttpClientErrorException e) {
            log.error("HTTP 에러 발생: {}", e.getResponseBodyAsString());
            throw new RuntimeException("카카오페이 요청 실패: " + e.getResponseBodyAsString());
        } catch (Exception e) {
            log.error("카카오페이 준비 API 호출 중 예외 발생", e);
            throw new RuntimeException("카카오페이 준비 API 호출 실패");
        }
    }

    /**
     * 카카오페이 결제 승인 요청
     * @param requestParams 결제 승인 요청 데이터
     * @return KakaoPayResponse 카카오페이 승인 응답 데이터
     */
    public KakaoPayResponse kakaoPayApprove(Map<String, String> requestParams) {
        try {
            RestTemplate restTemplate = new RestTemplate();

            // HTTP 요청 헤더 설정
            HttpHeaders headers = createHeaders();

            // HTTP 요청 바디 설정
            MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
            requestParams.forEach(body::add);

            // HTTP 요청 객체 생성
            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);

            // 카카오페이 API 호출
            ResponseEntity<KakaoPayResponse> response = restTemplate.postForEntity(
                KAKAO_PAY_APPROVE_URL, request, KakaoPayResponse.class
            );

            log.info("카카오페이 승인 요청 데이터: {}", requestParams);
            log.info("카카오페이 승인 응답 데이터: {}", response.getBody());
            return response.getBody();
        } catch (Exception e) {
            log.error("카카오페이 승인 API 호출 실패", e);
            throw new RuntimeException("카카오페이 승인 요청 실패");
        }
    }

    /**
     * 결제 상태 확인 (임시 로직)
     * @param tid TID (Transaction ID)
     * @return boolean 결제가 승인되었는지 여부
     */
    public boolean isPaymentAlreadyApproved(String tid) {
        // 실제 결제 상태를 확인하는 로직 구현 필요
        return false; // 예제: 항상 미승인 상태로 반환
    }

    /**
     * HTTP 요청 헤더 생성
     * @return HttpHeaders 설정된 요청 헤더
     */
    private HttpHeaders createHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.set("Authorization", ADMIN_KEY);
        return headers;
    }

    /**
     * 결제 준비 요청 데이터 생성
     * @param requestParams 요청 데이터
     * @return MultiValueMap<String, String> 결제 준비 요청 바디
     */
    private MultiValueMap<String, String> createReadyRequestBody(Map<String, Object> requestParams) {
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("cid", "TC0ONETIME");
        body.add("partner_order_id", requestParams.get("partner_order_id").toString());
        body.add("partner_user_id", requestParams.get("partner_user_id").toString());
        body.add("item_name", requestParams.get("item_name").toString());
        body.add("quantity", requestParams.get("quantity").toString());
        body.add("total_amount", requestParams.get("total_amount").toString());
        body.add("vat_amount", "0");
        body.add("tax_free_amount", "0");
        body.add("approval_url", requestParams.get("approval_url").toString());
        body.add("cancel_url", requestParams.get("cancel_url").toString());
        body.add("fail_url", requestParams.get("fail_url").toString());
        return body;
    }
}
