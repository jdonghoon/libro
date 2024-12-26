package pj.spring.service;

import pj.spring.vo.UserVO;

public interface PaymentService {
	
	public UserVO selectPaymentInfo(String user_id);

}
