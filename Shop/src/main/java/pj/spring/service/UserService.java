package pj.spring.service;

import java.util.List;

import pj.spring.vo.AddressBookVO;
import pj.spring.vo.ContactVO;
import pj.spring.vo.UserVO;

public interface UserService {
	
	// 회원가입
	public int insert(UserVO userVO);

	// 로그인
	public UserVO selectLogin(String username);

	// 아이디 중복 체크
	public int selectCntByUid(String user_id);
	
	// 주소록 목록
	public List<AddressBookVO> list(String user_id);
	
	// 주소록 등록
	public int addrinsert(AddressBookVO addressbookVO);
	
	// 주소록 삭제
	public int addrdelete(String address_book_no);

	// 주소록 수정
	public AddressBookVO addrmodify(String address_book_no);

	// 주소록 업데이트
	public int addrmodifyOk(AddressBookVO addressbookVO);
	
	// 회원 정보
	public UserVO memberinfoselect(String user_id);

	// 회원 정보 업데이트
	public int memberinfomodify(UserVO userVO);
	
	// 문의하기
	public int insertcontact(ContactVO contactVO);

	// 문의하기 첨부파일
	public int insertattachment(String attachment_contact_no);

	// 문의하기 첨부파일 상세
	public int insertattachmentdetail(ContactVO contactVO);
}
