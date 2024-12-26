package pj.spring.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import pj.spring.vo.KakaoPayReadyRequest;
import pj.spring.vo.KakaoPayReadyResponse;

@Service
public class KakaoPayService {

	/*
	 * private final RestTemplate restTemplate;
	 * 
	 * private static final String KAKAO_PAY_READY_URL =
	 * "https://kapi.kakao.com/v1/payment/ready"; private static final String
	 * AUTHORIZATION = "DEV4585768F73DA4201B5949323CE5E29D49E2B4"; // 실제 Admin Key
	 * 설정
	 * 
	 * // 생성자 public KakaoPayService(RestTemplate restTemplate) { this.restTemplate
	 * = restTemplate; }
	 * 
	 * public KakaoPayReadyResponse readyToPay(KakaoPayReadyRequest request) {
	 * HttpHeaders headers = new HttpHeaders(); headers.add("Authorization",
	 * AUTHORIZATION); headers.add("Content-Type",
	 * "application/x-www-form-urlencoded;charset=utf-8");
	 * 
	 * HttpEntity<KakaoPayReadyRequest> body = new HttpEntity<>(request, headers);
	 * 
	 * try { ResponseEntity<KakaoPayReadyResponse> response = restTemplate.exchange(
	 * KAKAO_PAY_READY_URL, HttpMethod.POST, body, KakaoPayReadyResponse.class );
	 * 
	 * return response.getBody(); } catch (Exception e) { throw new
	 * RuntimeException("카카오페이 결제 준비 중 오류가 발생했습니다.", e); } }
	 */
}
