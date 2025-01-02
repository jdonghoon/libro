package pj.spring.service;

import java.util.List;

import pj.spring.vo.OrderedDetailVO;
import pj.spring.vo.OrderedVO;
import pj.spring.vo.PaymentVO;
import pj.spring.vo.UserVO;

public interface PaymentService {
	
	public UserVO selectPaymentInfo(String user_id);
	
	public List<UserVO> selectAddressBook(String user_id);
	
	void insertPayment(PaymentVO payment);

    void insertOrder(OrderedVO order);

    void insertOrderDetail(OrderedDetailVO orderDetail);

    void processOrder(OrderedVO order, List<OrderedDetailVO> orderDetails, PaymentVO payment); // 트랜잭션 메서드 추가

}
