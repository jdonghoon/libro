package pj.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pj.spring.service.KakaoPayService;
import pj.spring.vo.KakaoPayRequest;
import pj.spring.vo.KakaoPayResponse;

@Controller
@RequestMapping("/kakaoPay")
public class KakaoPayController {

    private final KakaoPayService kakaoPayService;

    @Autowired
    public KakaoPayController(KakaoPayService kakaoPayService) {
        this.kakaoPayService = kakaoPayService;
    }

    @RequestMapping(value = "/ready", method = RequestMethod.POST)
    public ResponseEntity<?> kakaoPayReady(@RequestBody KakaoPayRequest request, Authentication authentication) {
    	
    	String userId = authentication.getName(); // 인증된 사용자의 ID
        System.out.println("User ID from Authentication: " + userId);

        request.setUser_id(userId); // userId를 요청 객체에 설정
        
        try {
            KakaoPayResponse response = kakaoPayService.kakaoPayReady(request);
            return ResponseEntity.ok(response);
        } catch (IllegalArgumentException e) {
            // 잘못된 요청 데이터에 대한 응답
            return ResponseEntity.badRequest().body("잘못된 요청: " + e.getMessage());
        } catch (RuntimeException e) {
            // 카카오페이 API 호출 오류
            return ResponseEntity.status(502).body("카카오페이 서버 호출 오류: " + e.getMessage());
        } catch (Exception e) {
            // 기타 예상치 못한 오류
            return ResponseEntity.status(500).body("서버 내부 오류 발생: " + e.getMessage());
        }
    }
}



