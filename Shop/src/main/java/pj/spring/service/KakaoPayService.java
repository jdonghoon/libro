package pj.spring.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;

import pj.spring.vo.KakaoPayRequest;
import pj.spring.vo.KakaoPayResponse;

@Service
public class KakaoPayService {

    private static final String KAKAO_PAY_READY_URL = "https://kapi.kakao.com/v1/payment/ready";
    private static final String ADMIN_KEY = "900f9e6e915322c671103b49f7ddbdda"; // REST API Key

    private static final String APPROVAL_URL = "http://localhost:8080/kakaoPay/success";
    private static final String CANCEL_URL = "http://localhost:8080/kakaoPay/cancel";
    private static final String FAIL_URL = "http://localhost:8080/kakaoPay/fail";

    public KakaoPayResponse kakaoPayReady(KakaoPayRequest request) {
        RestTemplate restTemplate = new RestTemplate();

        try {
            // 요청 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", "KakaoAK " + ADMIN_KEY);
            headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

            // 요청 바디 설정
            MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
            body.add("cid", "TC0ONETIME"); // 테스트용 CID
            body.add("partner_user_id", request.getUser_id());   // 사용자 ID
            body.add("item_name", request.getItemName());
            body.add("quantity", String.valueOf(request.getQuantity()));
            body.add("total_amount", String.valueOf(request.getAmount()));
            body.add("tax_free_amount", "0");
            body.add("approval_url", APPROVAL_URL);
            body.add("cancel_url", CANCEL_URL);
            body.add("fail_url", FAIL_URL);

            HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

            // API 호출
            ResponseEntity<KakaoPayResponse> response = restTemplate.postForEntity(KAKAO_PAY_READY_URL, entity, KakaoPayResponse.class);
            return response.getBody();
        } catch (HttpClientErrorException e) {
            System.err.println("HTTP 요청 오류: " + e.getResponseBodyAsString());
            throw new RuntimeException("카카오페이 API 요청 오류", e);
        } catch (HttpServerErrorException e) {
            System.err.println("카카오페이 서버 오류: " + e.getResponseBodyAsString());
            throw new RuntimeException("카카오페이 서버 호출 오류", e);
        } catch (Exception e) {
            System.err.println("카카오페이 호출 중 알 수 없는 오류 발생: " + e.getMessage());
            throw new RuntimeException("카카오페이 호출 실패", e);
        }
    }
}



