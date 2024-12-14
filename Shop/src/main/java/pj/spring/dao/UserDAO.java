package pj.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.spring.vo.AddressBookVO;
import pj.spring.vo.ContactVO;
import pj.spring.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	private final String namespace = "pj.spring.mapper.userMapper";
	
	// 회원가입
	public int insert(UserVO userVO) {
		return sqlSession.insert(namespace + ".userInsert", userVO);
	}

	// 아이디 중복 체크
	public int selectCntByUid(String user_id) {
		return sqlSession.selectOne(namespace + ".selectCntByUid", user_id);
	}

	// 로그인
	public UserVO selectLogin(String username) {
		return sqlSession.selectOne(namespace + ".selectUserByLogin", username);
	}
	
	// 주소록 목록
	public List<AddressBookVO> list(String user_id) {
		return sqlSession.selectList(namespace + ".addrlistSelect", user_id);
	}

	// 주소록 등록
	public int addrinsert(AddressBookVO addressbookVO) {
		return sqlSession.insert(namespace + ".addrInsert", addressbookVO);
	}
	
	// 주소록 삭제
	public int addrdelete(String address_book_no) {
		return sqlSession.delete(namespace + ".addrDelete", address_book_no);
	}

	// 주소록 수정
	public AddressBookVO addrmodify(String address_book_no) {
		return sqlSession.selectOne(namespace + ".addrModify", address_book_no);
	}

	// 주소록 업데이트
	public int addrmodifyOk(AddressBookVO addressbookVO) {
		return sqlSession.update(namespace + ".addrModifyOk", addressbookVO);
	}
	
	// 회원 정보
	public UserVO memberinfoselect(String user_id) {
		return sqlSession.selectOne(namespace + ".memberinfoSelect", user_id);
	}

	// 회원 정보  업데이트
	public int memberinfomodify(UserVO userVO) {
		return sqlSession.update(namespace + ".memberinfoModify", userVO);
	}

	// 문의하기
	public int insertcontact(ContactVO contactVO) {
		return sqlSession.insert(namespace + ".insertContact", contactVO);
	}
	
	// 문의하기 첨부파일
	public int insertattachment(ContactVO contactVO) {
		return sqlSession.insert(namespace + ".insertAttachment", contactVO);
	}
	
	// 문의하기 첨부파일 상세
	public int insertattachmentdetail(ContactVO contactVO) {
		return sqlSession.insert(namespace + ".insertAttachmentDetail", contactVO);
	}
	
	// 문의하기 목록
	public List<ContactVO> selectcontactlist(String user_id) {
		return sqlSession.selectList(namespace + ".selectContactList", user_id);
	}

	// 문의하기 상세
	public ContactVO selectcontact(String contact_no) {
		return sqlSession.selectOne(namespace + ".selectContact", contact_no);
	}
	
	// 문의하기 삭제
	public int deletecontact(String contact_no) {
		return sqlSession.delete(namespace + ".deleteContact", contact_no);
	}
}
