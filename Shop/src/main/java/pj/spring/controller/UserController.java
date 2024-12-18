package pj.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pj.spring.service.UserService;
import pj.spring.vo.*;

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
	public String memberinfo(UserVO vo, HttpServletRequest request) {
		
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
	public String addrregister(AddressBookVO vo) {
		
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
	
	// 내 게시물
	@RequestMapping(value="mypost.do", method=RequestMethod.GET)
	public String myposting(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		List<ContactVO> contactlist = userService.selectcontactlist(username);
		List<ReviewVO> reviewpossiblelist = userService.selectReviewPossibleList(username);
		List<ReviewVO> reviewlist = userService.selectReviewList(username);
		
		System.out.println("주소록 갯수 : " + contactlist.size());
		System.out.println("주소록 갯수 : " + reviewpossiblelist.size());
		System.out.println("주소록 갯수 : " + reviewlist.size());
		
		model.addAttribute("contactlist", contactlist);
		model.addAttribute("reviewpossiblelist", reviewpossiblelist);
		model.addAttribute("reviewlist", reviewlist);
		
		return "user/account/mypost";
	}
	
	// 문의하기
	@RequestMapping(value="inquiry.do", method=RequestMethod.GET)
	public String inquiry() {
		
		return "user/account/inquiry";
	}

	@RequestMapping(value="inquiryOk.do", method=RequestMethod.POST)
	public String inquiry(ContactVO vo, @RequestParam(value = "multiFile")List<MultipartFile> multiFile, HttpServletRequest request) throws IllegalStateException, IOException {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		System.out.println("username" + username);
		vo.setUser_id(username);
		System.out.println("username 성공");
		
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("upload path : " + path);
		
		File dir = new File(path);
		
		if(!dir.exists()) { 
			dir.mkdirs(); 
		}
		
	    try {
	    	userService.insertcontact(vo);
	    	
	    	if (multiFile != null && !multiFile.isEmpty()) {
				
	    		for(MultipartFile file : multiFile) {
	    			
					if(!file.getOriginalFilename().isEmpty()) {
					UUID uuid = UUID.randomUUID();
					String originalFileName = file.getOriginalFilename();
					String newFileName  = uuid.toString() + "_" + originalFileName;
					
					file.transferTo(new File(path, newFileName ));
					
					// 첨부파일 기본 정보 저장
					vo.setAttachment_type("C"); // 문의 첨부파일 유형
					vo.setAttachment_contact_no(vo.getContact_no());
	                userService.insertattachment(vo); // 첨부파일 정보 저장 (PK 생성)
					
	             // 첨부파일 상세 정보 저장
					vo.setAttachment_detail_name(originalFileName); // 원본 파일명
					vo.setAttachment_detail_new_name(newFileName); // 새 파일명
					vo.setAttachment_detail_path(path); // 경로
					vo.setAttachment_no(vo.getAttachment_no()); // 첨부파일 번호
					vo.setAttachment_detail_create_id(username); // 생성자 ID
					vo.setAttachment_detail_update_id(username); // 수정자 ID
					
					System.out.println("newFileName" + vo.getAttachment_detail_new_name());
					System.out.println("path" + vo.getAttachment_detail_path());
	                userService.insertattachmentdetail(vo); // 첨부파일 상세 저장
					}
				}
	    	}
	        // 성공
	        System.out.println("등록 성공");
	        return "redirect:inquirydetail.do?contact_no=" + vo.getContact_no();

	    } catch (Exception e) {
	        // 실패 처리
	        System.err.println("등록 실패: " + e.getMessage());
	        return "redirect:inquiry.do";
	    }
	}
	
	// 문의하기 수정
	@RequestMapping(value="inquirymodify.do", method=RequestMethod.GET)
	public String inquirymodify(String contact_no, Model model) {
			
		ContactVO vo = userService.updateContact(contact_no);
			
			model.addAttribute("vo", vo);
			
		return "user/account/inquirymodify";
	}
	
	@RequestMapping(value="inquirymodifyOk.do", method=RequestMethod.POST)
	public String inquirymodify(ContactVO vo, @RequestParam(value = "multiFile")List<MultipartFile> multiFile, HttpServletRequest request) throws IllegalStateException, IOException {
		
		System.out.println("수정중");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		vo.setContact_update_id(username);
		
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("upload path : " + path);
		
		File dir = new File(path);
		
		if(!dir.exists()) { 
			dir.mkdirs(); 
		}
		
		try {
			
			userService.updateokcontact(vo);
			
			System.out.println("updateokcontact 실행");
			
	    	if (multiFile != null && !multiFile.isEmpty()) {
	    		
	    		List<ContactVO> attachmentList  = userService.selectattachment(vo.getContact_no());
	    		if (attachmentList != null && !attachmentList.isEmpty()) {
		    		for (ContactVO attachment : attachmentList) {
		    			userService.deletetattachmentdetail(attachment.getAttachment_no());
		    			userService.deletetattachment(attachment.getAttachment_no());
		    		}
		    		System.out.println("삭제 완료");
	    		}
	    		for(MultipartFile file : multiFile) {
	    			
					if(!file.getOriginalFilename().isEmpty()) {
						UUID uuid = UUID.randomUUID();
						String originalFileName = file.getOriginalFilename();
						String newFileName  = uuid.toString() + "_" + originalFileName;
						
						file.transferTo(new File(path, newFileName ));
						
						// 첨부파일 기본 정보 저장
						vo.setAttachment_type("C"); // 문의 첨부파일 유형
						vo.setAttachment_contact_no(vo.getContact_no());
		                userService.insertattachment(vo); // 첨부파일 정보 저장 (PK 생성)
						
		             // 첨부파일 상세 정보 저장
						vo.setAttachment_detail_name(originalFileName); // 원본 파일명
						vo.setAttachment_detail_new_name(newFileName); // 새 파일명
						vo.setAttachment_detail_path(path); // 경로
						vo.setAttachment_no(vo.getAttachment_no()); // 첨부파일 번호
						vo.setAttachment_detail_create_id(username); // 생성자 ID
						vo.setAttachment_detail_update_id(username); // 수정자 ID
						
						System.out.println("newFileName" + vo.getAttachment_detail_new_name());
						System.out.println("path" + vo.getAttachment_detail_path());
		                userService.insertattachmentdetail(vo); // 첨부파일 상세 저장
					}
					
		    		System.out.println("사진 등록 완료");
	    		}
	    	}
	    	
			System.out.println("수정 성공");
			return "redirect:inquirydetail.do?contact_no=" + vo.getContact_no();

		} catch (Exception e) {
			// 실패 처리
			System.err.println("수정 실패: " + e.getMessage());
			return "redirect:inquiry.do";
		}
	}

	// 문의하기 상세
	@RequestMapping(value="inquirydetail.do")
	public String inquirydetail(String contact_no, Model model) {
		
//		System.out.println("contact_no " + contact_no);
		
		ContactVO vo = userService.selectcontact(contact_no);
		
//		System.out.println("컨택트 " + vo.getContact_no());
		
		model.addAttribute("vo", vo);
		
		return "user/account/inquirydetail";
	}
	
	// 문의하기 삭제
	@RequestMapping(value="contactdelete.do")
	public String deletecontact(String contact_no) {
		
		int result = userService.deletetcontact(contact_no);
		
		if(result > 0) {
			System.out.println("삭제 완료");
		}else {
			System.out.println("삭제 실패");
		}
		
		return "redirect:/mypost.do";
	}
	
	// 리뷰 등록
	@RequestMapping(value="reviewregister.do", method = RequestMethod.GET)
	public String reviewregister(String product_no, Model model) {
		
		ProductVO vo = userService.selectProduct(product_no);
		
		model.addAttribute("vo", vo);
		
		return "user/account/reviewregister";
	}

	@RequestMapping(value="reviewregisterOk.do", method = RequestMethod.POST)
	public String reviewregister(ReviewVO vo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		vo.setUser_id(username);
		
		int result = userService.insertReview(vo);
		
		if(result > 0) {
			System.out.println("등록 완료");
		}else {
			System.out.println("등록 실패");
		}

		return "redirect:/mypost.do";
	}
	
	// 리뷰 수정
	@RequestMapping(value="reviewupdate.do", method = RequestMethod.GET)
	public String reviewupdate(String product_no, String review_no, Model model) {
		
		ProductVO vo = userService.selectProduct(product_no);
		ReviewVO rvo = userService.selectReview(review_no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("rvo", rvo);
		
		return "user/account/reviewupdate";
	}

	@RequestMapping(value="reviewupdateOk.do", method = RequestMethod.POST)
	public String reviewupdate(ReviewVO vo) {
		
		int result = userService.updateReview(vo);

		if(result > 0) {
			System.out.println("수정 완료");

			return "redirect:/mypost.do";
		}else {
			System.out.println("수정 실패");
			
			return "redirect:reviewupdate.do?review_no=" + vo.getReview_no();
		}
	}

	@RequestMapping(value="reviewdelete.do")
	public String reviewdelete(String review_no) {
		
		int result = userService.deleteReview(review_no);
		
		if(result > 0) {
			System.out.println("삭제 완료");
		}else {
			System.out.println("삭제 실패");
		}

		return "redirect:/mypost.do";
	}

	// 공지사항
	@RequestMapping(value="notice.do", method=RequestMethod.GET)
	public String notice() {
		
		return "user/account/notice";
	}

	// 주문(+취소)내역 목록
	@RequestMapping(value="orderhistory.do", method=RequestMethod.GET)
	public String orderhistory(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		List<OrderedVO> list = userService.selectorderhistory(username);
		List<OrderedVO> cancellist = userService.selectorderhistorycancel(username);
		
		System.out.println("주문내역 갯수 : " + list.size());
		System.out.println("취소내역 갯수 : " + cancellist.size());
		
		model.addAttribute("list", list);
		model.addAttribute("cancellist", cancellist);
		
		return "user/account/orderhistory";
	}
	
	// 주문내역 상세
	@RequestMapping(value="orderhistorydetail.do")
	public String orderhistorydetail(String ordered_no, Model model) {
		
		System.out.println("ordered_no " + ordered_no);
		
		OrderedVO vo = userService.selectorderhistorydetail(ordered_no);
		List<OrderedVO> list = userService.selectorderhistorydetailp(ordered_no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		
		return "user/account/orderhistorydetail";
	}
	

	// 위시리스트
	@RequestMapping(value="wishlist.do", method=RequestMethod.GET)
	public String wishlist() {
		
		return "user/account/wishlist";
	}
}
