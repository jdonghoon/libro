package pj.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pj.spring.service.UserService;
import pj.spring.vo.AddressBookVO;
import pj.spring.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	public UserService userService;
	
	// 로그인
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login() {
		
		return "user/account/login";
	}
	
	//	회원가입
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {
		
		return "user/account/join";
	}
	
	@RequestMapping(value = "/joinOk.do", method = RequestMethod.POST)
	public String joinOk(UserVO userVO) {

		System.out.println("user_id : " + userVO.getUser_id());
		System.out.println("user_password : " + userVO.getUser_password());
		System.out.println("user_name : " + userVO.getUser_name());
		System.out.println("user_email : " + userVO.getUser_email());
		System.out.println("user_phone : " + userVO.getUser_phone());
		
		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder(); // 복호화가 안되는 
		
		userVO.setUser_password(epwe.encode(userVO.getUser_password()));
		
		int result = userService.insert(userVO);
		
		if(result > 0) {
			System.out.println("등록완료");
		}else {
			System.out.println("등록실패");
		}
		
		return "redirect:/";
	}
	
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/ajax/checkID.do", method = RequestMethod.GET)
	public String checkID(String user_id) {
		
		String msg = "";
		
		int isId = userService.selectCntByUid(user_id);
		
		/*
			ajax 요청시 컨트롤러에서는 response 문자셋을 지정할 수 없으므로 주로 응답값은 영문으로 작성하여 
			화면에서 제어합니다.
		*/
		
		if(isId > 0){
			// ID 중복
			
			msg = "fail";
		}else {
			// ID 중복 X
			
			msg = "success";
		}
		
		return msg;
	}
	
	// 회원 정보
	@RequestMapping(value="memberinfo.do", method=RequestMethod.GET)
	public String memberinfo(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		UserVO vo = userService.memberinfoselect(username);
		
		model.addAttribute("vo", vo);
		
		return "user/account/memberinfo";
	}
	
	@RequestMapping(value="memberinfoOk.do", method=RequestMethod.POST)
	public String addrmodify(UserVO vo, HttpServletRequest request) {
		
		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder(); // 복호화가 안되는 
		
		vo.setUser_password(epwe.encode(vo.getUser_password()));
		
		int result = userService.memberinfomodify(vo);
		
		if(result > 0) {
			System.out.println("수정 완료");
		}else {
			System.out.println("수정 실패");
		}

		return "redirect:memberinfo.do";
	}
	
	// 주소록 목록
	@RequestMapping(value="/addr.do", method = RequestMethod.GET)
	public String addr(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		List<AddressBookVO> list = userService.list(username);
		
		System.out.println("주소록 갯수 : " + list.size());
		
		model.addAttribute("list", list);
		
		return "user/account/addr";
	}

	// 주소록 등록
	@RequestMapping(value="/addrregister.do", method = RequestMethod.GET)
	public String addrregister() {
		
		return "user/account/addrregister";
	}

	@RequestMapping(value="/addrregisterOk.do", method = RequestMethod.POST)
	public String addrregister(AddressBookVO vo, HttpServletRequest request) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		vo.setUser_id(username);
		
		vo.setAddress_book_addressname(vo.getAddress_book_addressname());
		vo.setAddress_book_name(vo.getAddress_book_name());
		vo.setAddress_book_postcode(vo.getAddress_book_postcode());
		vo.setAddress_book_address(vo.getAddress_book_address());
		vo.setAddress_book_detailaddress(vo.getAddress_book_detailaddress());
		vo.setAddress_book_phone(vo.getAddress_book_phone());
		
		int result = userService.addrinsert(vo);
		
		if(result > 0) {
			System.out.println("등록 완료");
		}else {
			System.out.println("등록 실패");
		}

		return "redirect:/addr.do";
	}
	
	// 주소록 삭제
	@RequestMapping(value="/addrdelete.do")
	public String addrdelete(String address_book_no) {
		
		int result = userService.addrdelete(address_book_no);
		
		if(result > 0) {
			System.out.println("삭제 완료");
		}else {
			System.out.println("삭제 실패");
		}
		
		return "redirect:/addr.do";
	}
	
	// 주소록 수정
	@RequestMapping(value="addrmodify.do", method=RequestMethod.GET)
	public String addrmodify(String address_book_no, Model model) {
		
		AddressBookVO vo = userService.addrmodify(address_book_no);
		
		model.addAttribute("vo", vo);

		return "user/account/addrmodify";
	}
	
	@RequestMapping(value="addrmodifyOk.do", method=RequestMethod.POST)
	public String addrmodify(AddressBookVO vo) {
		
		int result = userService.addrmodifyOk(vo);
		
		if(result > 0) {
			System.out.println("수정 완료");

			return "redirect:/addr.do";
		}else {
			System.out.println("수정 실패");
			
			return "redirect:addrmodify.do?address_book_no=" + vo.getAddress_book_no();
		}
	}
	
	// 문의하기
	@RequestMapping(value="inquiry.do", method=RequestMethod.GET)
	public String inquiry() {
		
		return "user/account/inquiry";
	}

}
