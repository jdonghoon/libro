package pj.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.UserDAO;
import pj.spring.vo.AddressBookVO;
import pj.spring.vo.ContactVO;
import pj.spring.vo.UserVO;

@Service // 업무로직을 담당하는 구현 객체를 스프링이 생성하여 관리
public class UserServiceImpl implements UserService {
	
	@Autowired
	public UserDAO userDAO;
	
	// 회원가입
	@Override
	public int insert(UserVO userVO){
		return userDAO.insert(userVO);
	}

	// 로그인
	@Override
	public UserVO selectLogin(String username){
		return userDAO.selectLogin(username);
	}

	// 아이디 중복 체크
	@Override
	public int selectCntByUid(String user_id) {
		return userDAO.selectCntByUid(user_id);
	}
	
	// 주소록 목록
	@Override
	public List<AddressBookVO> list(String user_id) {
		return userDAO.list(user_id);
	}

	// 주소록 등록
	@Override
	public int addrinsert(AddressBookVO addressbookVO) {
		return userDAO.addrinsert(addressbookVO);
	}

	// 주소록 삭제
	@Override
	public int addrdelete(String address_book_no) {
		return userDAO.addrdelete(address_book_no);
	}

	// 주소록 수정
	@Override
	public AddressBookVO addrmodify(String address_book_no) {
		return userDAO.addrmodify(address_book_no);
	}

	// 주소록 업데이트
	@Override
	public int addrmodifyOk(AddressBookVO addressbookVO) {
		return userDAO.addrmodifyOk(addressbookVO);
	}

	// 회원 정보
	@Override
	public UserVO memberinfoselect(String user_id) {
		return userDAO.memberinfoselect(user_id);
	}

	// 회원 정보 업데이트
	@Override
	public int memberinfomodify(UserVO userVO) {
		return userDAO.memberinfomodify(userVO);
	}

	// 문의하기
	@Override
	public int insertcontact(ContactVO contactVO) {
		return userDAO.insertcontact(contactVO);
	}

	// 문의하기 첨부파일
	@Override
	public int insertattachment(ContactVO contactVO) {
		return userDAO.insertattachment(contactVO);
	}

	// 문의하기 첨부파일 상세
	@Override
	public int insertattachmentdetail(ContactVO contactVO) {
		return userDAO.insertattachmentdetail(contactVO);
	}

	@Override
	public ContactVO selectcontact(String user_id) {
		return userDAO.selectcontact(user_id);
	}

  }
