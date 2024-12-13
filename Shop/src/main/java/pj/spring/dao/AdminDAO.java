package pj.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.ProductVO;
import pj.spring.vo.UserVO;

@Repository
public class AdminDAO {

	@Autowired
	public SqlSession sqlSession;
	
	private final String namespace = "pj.spring.mapper.adminMapper";
	
	// 대시보드 주문 관리  건 수
	public Map<String, Object> orderCount(){
		return sqlSession.selectOne(namespace + ".orderCount");
	}
	
	// 대시보드 취소 관리  건 수
	public Map<String, Object> cancelCount(){
		return sqlSession.selectOne(namespace + ".cancelCount");
	}
	
	// 대시보드 리뷰/문의 관리  건 수
	public Map<String, Object> contentCount(){
		return sqlSession.selectOne(namespace + ".contentCount");
	}
	
	// 회원 관리 list
	public List<UserVO> userList(Map<String,Integer> pagingParam){
		return sqlSession.selectList(namespace+".userList",pagingParam);
	}
	
	// 회원 전체 수
	public int selectTotal() {
		return sqlSession.selectOne(namespace+".selectTotal");
	}
	
	// 상품 등록
	public int insertProduct(ProductVO productVO){
		return sqlSession.insert(namespace+".insertProduct",productVO);
	}
	
	// 상품 첨부파일
	public int insertAttachment(ProductVO productVO){
		return sqlSession.insert(namespace+".insertAttachment",productVO);
	}
	
	// 상품 첨부파일 상세
	public int insertAttachmentDetail(ProductVO productVO){
		return sqlSession.insert(namespace+".insertAttachmentDetail",productVO);
	}
	
}
