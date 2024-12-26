package pj.spring.service;

import java.util.List;

import pj.spring.vo.UserVO;

public interface PaymentService {
	
	public UserVO selectPaymentInfo(String user_id);
	
	public List<UserVO> selectAddressBook(String user_id);

}
