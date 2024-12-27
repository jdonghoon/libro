package pj.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pj.spring.service.KakaoPayService;
import pj.spring.vo.KakaoPayRequest;
import pj.spring.vo.KakaoPayResponse;

@RestController
@RequestMapping("/kakaoPay")
public class KakaoPayController {

    private final KakaoPayService kakaoPayService;

    @Autowired
    public KakaoPayController(KakaoPayService kakaoPayService) {
        this.kakaoPayService = kakaoPayService;
    }

    @PostMapping("/ready")
    public ResponseEntity<?> kakaoPayReady(@RequestBody KakaoPayRequest request) {
        try {
            KakaoPayResponse response = kakaoPayService.kakaoPayReady(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("결제 준비 중 오류 발생: " + e.getMessage());
        }
    }
}
