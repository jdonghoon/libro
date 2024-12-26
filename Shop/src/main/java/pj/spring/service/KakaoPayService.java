package pj.spring.service;

import java.net.http.HttpHeaders;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import pj.spring.vo.KakaoPayProperties;

/*@Service
public class KakaoPayService {
	
	private final KakaoPayProperties payProperties;
	private RestTemplate restTemplate = new RestTemplate();
	private KakaoReadyResponse kakaoReady;
	
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		String auth = "SECRET_KEY " + payProperties.getSecretKey();
		headers.set("Authorization", auth);
		headers.set("Content-Type", "application/json");
		return headers;
	}
	
	public KakaoReadyResponse kakaoPayReady() {
		Map<String, Object> parameters = new HashMap<>();
		
		parameters.put("cid", payProperties.getCid());
		parameters.put();
	}
}*/
