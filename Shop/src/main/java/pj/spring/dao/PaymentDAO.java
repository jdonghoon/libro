package pj.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.OrderedDetailVO;
import pj.spring.vo.OrderedVO;
import pj.spring.vo.PaymentVO;
import pj.spring.vo.UserVO;

@Repository
public class PaymentDAO {

	@Autowired
	public SqlSession sqlSession;
	
	private final String namespace = "pj.spring.mapper.paymentMapper";
	
	public UserVO selectPaymentInfo(String user_id) {
		
		return sqlSession.selectOne(namespace + ".selectPaymentInfo", user_id);
	}
	
	public List<UserVO> selectAddressBook(String user_id) {
		
		return sqlSession.selectList(namespace + ".selectAddressBook", user_id);
	}

	public void insertPayment(PaymentVO payment) {
        sqlSession.insert(namespace + ".insertPayment", payment);
    }

    public void insertOrder(OrderedVO order) {
        sqlSession.insert(namespace + ".insertOrder", order);        
    }

    public void insertOrderDetail(OrderedDetailVO orderDetail) {
        sqlSession.insert(namespace + ".insertOrderDetail", orderDetail);
    }
}
