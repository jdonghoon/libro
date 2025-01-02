package pj.spring.service;

import java.util.List;

import pj.spring.vo.OrderedDetailVO;
import pj.spring.vo.OrderedVO;
import pj.spring.vo.PaymentVO;
import pj.spring.vo.UserVO;

public interface PaymentService {
	
	public UserVO selectPaymentInfo(String user_id);
	
	public List<UserVO> selectAddressBook(String user_id);
	
	public void insertPayment(PaymentVO paymentVO);

    void insertOrder(OrderedVO orderedVO);

    void insertOrderDetail(OrderedDetailVO orderedDetailVO);
    
    

}
