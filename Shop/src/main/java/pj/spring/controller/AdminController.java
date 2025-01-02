package pj.spring.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pj.spring.service.AdminService;
import pj.spring.util.PagingUtil;
import pj.spring.vo.ContactVO;
import pj.spring.vo.OrderedDetailVO;
import pj.spring.vo.OrderedVO;
import pj.spring.vo.PaymentVO;
import pj.spring.vo.ProductVO;
import pj.spring.vo.ReviewVO;
import pj.spring.vo.UserVO;

@RequestMapping(value = "/admin")
@Controller
public class AdminController {

	@Autowired
	public AdminService adminService;

	// 대시보드
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Model model,
			@RequestParam(required = false) String startDate, 
            @RequestParam(required = false) String endDate) {

		Map<String, Object> orderCount = adminService.orderCount();
		model.addAttribute("orderCount", orderCount);
		
		Map<String, Object> cancelCount = adminService.cancelCount();
		model.addAttribute("cancelCount", cancelCount);

		Map<String, Object> contentCount = adminService.contentCount();
		model.addAttribute("contentCount", contentCount);

		Map<String, Object> params = new HashMap<>();
        params.put("startDate", startDate);
        params.put("endDate", endDate);

        Map<String, Object> statistics = adminService.getSalesStatistics(params);

        model.addAttribute("statistics", statistics);

		return "admin/index";
	}
	
	

	// 회원 관리
	@RequestMapping(value = "/membership.do", method = RequestMethod.GET)
	public String membership(Model model,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {

		int total = adminService.selectTotal();

		PagingUtil paging = new PagingUtil(nowPage, total, 10);

		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", paging.getStart());
		pagingParam.put("perPage", paging.getPerPage());

		// 비지니스 로직 : DB에 있는 전체 회원 목록 데이터가져오기
		List<UserVO> list = adminService.userList(pagingParam);

		// 모델 객체 사용하여 조회 데이터 화면으로 포워딩
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return "admin/membership";
	}
	
	//회원 정보 저장 (AJAX 요청 처리)
	@ResponseBody
    @RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)
    public Map<String, Object> saveUserReply(@RequestBody UserVO userVO) {
        Map<String, Object> response = new HashMap<>();

        try {
            int result = adminService.saveUserReply(userVO);

            if (result > 0) {
                response.put("status", "success");
                response.put("message", "저장되었습니다.");
            } else {
                response.put("status", "fail");
                response.put("message", "저장에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
        }

        return response;
    }
	
	// 회원 관리 검색 (AJAX)
	@PostMapping("/search.do")
	public ResponseEntity<List<UserVO>> searchMembers(@RequestBody Map<String, Object> searchParams) {
		 List<UserVO> members = adminService.searchMembers(searchParams);
		    return ResponseEntity.ok(members);
    }
	
	// 상품 관리
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public String product(Model model,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {

		int total = adminService.productTotal();

		PagingUtil paging = new PagingUtil(nowPage, total, 10);

		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", paging.getStart());
		pagingParam.put("perPage", paging.getPerPage());

		// 비지니스 로직 : DB에 있는 전체 회원 목록 데이터가져오기
		List<ProductVO> list = adminService.productList(pagingParam);

		// 모델 객체 사용하여 조회 데이터 화면으로 포워딩
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return "admin/product";
	}

	// 상품 등록
	@RequestMapping(value = "/productWrite.do", method = RequestMethod.GET)
	public String productWrite() {

		return "admin/productWrite";
	}

	@RequestMapping(value = "/productWrite.do", method = RequestMethod.POST)
	public String productWrite(ProductVO productVO, MultipartFile topFile,
			@RequestParam(value = "multiFile") List<MultipartFile> multiFile, HttpServletRequest request,Principal principal)
			throws IllegalStateException, IOException {

		//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String user_id = principal.getName();

		productVO.setUser_id(user_id);
		productVO.setProduct_no(productVO.getProduct_no());
		productVO.setProduct_status(productVO.getProduct_status());
		productVO.setCategory_name(productVO.getCategory_name());
		productVO.setProduct_price(productVO.getProduct_price());
		productVO.setProduct_stock(productVO.getProduct_stock());
		productVO.setProduct_name(productVO.getProduct_name());
		productVO.setProduct_isbn(productVO.getProduct_isbn());
		productVO.setProduct_page(productVO.getProduct_page());
		productVO.setProduct_description(productVO.getProduct_description());
		productVO.setProduct_author(productVO.getProduct_author());
		productVO.setProduct_author_description(productVO.getProduct_author_description());

		int resultInt = adminService.insertProduct(productVO);
		
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("upload path -> " + path);

		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}

		String topNewFileName = "";

		if (!topFile.getOriginalFilename().isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String fileRealPath = uuid + topFile.getOriginalFilename();

			topFile.transferTo(new File(path, fileRealPath));

			topNewFileName = fileRealPath;

			productVO.setAttachment_detail_name(topFile.getOriginalFilename()); // 대표이미지 업로드이름
			productVO.setAttachment_detail_new_name(topNewFileName); // 대표이미지 실제 업로드 이름
			productVO.setAttachment_type("PT");
			productVO.setAttachment_detail_create_id(user_id);
			adminService.insertAttachment(productVO);
			adminService.insertAttachmentDetail(productVO);

		}

		String newFileName = "";

		if (multiFile.size() > 0) {
			productVO.setAttachment_type("PD");
			adminService.insertAttachment(productVO);
		}
		for (MultipartFile file : multiFile) {
			if (!file.getOriginalFilename().isEmpty()) {
				UUID uuid = UUID.randomUUID();
				String fileRealName = uuid.toString() + file.getOriginalFilename();

				file.transferTo(new File(path, fileRealName));

				newFileName = fileRealName;

				productVO.setAttachment_detail_name(file.getOriginalFilename()); // 상품 상세 이미지 업로드 이름
				productVO.setAttachment_detail_new_name(newFileName); // 상품 상세 이미지 실제 업로드 이름
				productVO.setAttachment_detail_create_id(user_id);
				
				adminService.insertAttachmentDetail(productVO);

			}
		}

		if(resultInt>0) {
			System.out.println("등록완료");
			return "redirect:product.do";
		}else {
			System.out.println("등록 실패 ");
			return "redirect:productWrite.do";
		}

	}

	// 상품 등록 수정
	@RequestMapping(value = "/productModify.do", method = RequestMethod.GET)
	public String productModify(Model model, @RequestParam(value = "product_no") int product_no) {

		ProductVO vo = adminService.productModify(product_no);
		
		List<ProductVO> attachmentInfoList  = adminService.productAttachmentName(product_no);
		
		
		model.addAttribute("vo", vo);
		model.addAttribute("attachmentInfoList", attachmentInfoList);

		return "admin/productModify";
	}

	@RequestMapping(value = "/productModify.do", method = RequestMethod.POST)
	public String productModify(ProductVO productVO, @RequestParam("topFile") MultipartFile topFile, 
	                            @RequestParam("multiFile") MultipartFile[] multiFile, 
	                            Principal principal, HttpServletRequest request) {
	    String user_id = principal.getName();
	    productVO.setProduct_update_id(user_id);

	    // 파일 업로드 경로 설정
	    String path = request.getSession().getServletContext().getRealPath("/resources/upload");
	    System.out.println("upload path -> " + path);
	    
	    File dir = new File(path);
	    
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }

	    // 대표 이미지 처리
	    if (!topFile.getOriginalFilename().isEmpty()) {
	    	// 기존 대표 이미지 삭제
	        if (productVO.getAttachment_no() != null && "PT".equals(productVO.getAttachment_type())) {
	        	String oldFilePath = path + "/" + productVO.getAttachment_detail_new_name(); // 기존 파일 경로
	            File oldFile = new File(oldFilePath);
	            if (oldFile.exists()) {
	                oldFile.delete(); // 파일 삭제
	            }
	        }
	    	 
	    	UUID uuid = UUID.randomUUID();
	        String fileRealPath = uuid + topFile.getOriginalFilename();
	        
	        try {
	            topFile.transferTo(new File(path, fileRealPath));  // 파일 저장
	        } catch (IOException e) {
	            e.printStackTrace();
            }
	        
	        productVO.setAttachment_detail_name(topFile.getOriginalFilename());
	        productVO.setAttachment_detail_new_name(fileRealPath);
	        productVO.setAttachment_type("PT");
	        productVO.setAttachment_detail_update_id(user_id);
	        adminService.updateProductAttachment(productVO);
	    }

	    // 기타 이미지 처리
	    if (multiFile != null && multiFile.length > 0) {
	    	// 기존 기타 이미지 삭제 (기존 이미지가 있으면 삭제)
	        if (productVO.getOther_attachment_no() != null && !productVO.getOther_attachment_no().isEmpty()) {
	            for (Integer attachment_no : productVO.getOther_attachment_no()) {
	                String oldFilePath = path + "/" + attachment_no;  // 기존 파일 경로
	                File oldFile = new File(oldFilePath);
	                if (oldFile.exists()) {
	                    oldFile.delete();  // 기존 파일 삭제
	                }
	            }
	        }
	        
	        for (MultipartFile file : multiFile) {
	        	if (!file.getOriginalFilename().isEmpty()) {
	        		UUID uuid = UUID.randomUUID();
	        		String fileRealName = uuid.toString() + file.getOriginalFilename();
	        		
	        		try {
	                    file.transferTo(new File(path, fileRealName));  // 파일 저장
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	        		
	        		productVO.setAttachment_detail_name(file.getOriginalFilename());
	    	        productVO.setAttachment_detail_new_name(fileRealName);
	    	        productVO.setAttachment_type("PD");
	    	        productVO.setAttachment_detail_update_id(user_id);
	    	        adminService.updateProductAttachment(productVO);
		            }
		        }
		    }

		    int result = adminService.productModifyUpdate(productVO);
		    if (result > 0) {
		        return "redirect:product.do";
		    } else {
		        return "redirect:productModify.do";
		    }
    
    }

	 // 상품 삭제
	 @ResponseBody
	 @RequestMapping(value = "/deleteProduct.do", method = RequestMethod.POST)
	 public String productDelete(@RequestBody ProductVO productVO) {
	 
		// 주문 상태를 변경하는 서비스 호출
		    int result = adminService.productDelete(productVO);
		    
		    // 상태 변경 성공 여부에 따라 결과 반환
		    if(result > 0) {
		        return "success";  // 성공
		    } else {
		        return "failure";  // 실패
		    }
	 }
	 

	// 주문 관리
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String order(Model model,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {

		int total = adminService.orderTotal();

		PagingUtil paging = new PagingUtil(nowPage, total, 10);

		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", paging.getStart());
		pagingParam.put("perPage", paging.getPerPage());

		List<Map<String, Object>> orderList = adminService.orderList(pagingParam);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("paging", paging);

		return "admin/order";
	}
	
	// ordered_status 변경 ajax
	@ResponseBody
	@RequestMapping(value = "/updateStatus.do", method = RequestMethod.POST)
	public String updateStatus(@RequestBody OrderedVO orderedVO) {
		
		// 주문 상태를 변경하는 서비스 호출
	    int result = adminService.updateOrderStatus(orderedVO);
	    
	    // 상태 변경 성공 여부에 따라 결과 반환
	    if(result > 0) {
	        return "success";  // 성공
	    } else {
	        return "failure";  // 실패
	    }
	
	}
	
	// 상품주문번호 모달창
	@ResponseBody
	@RequestMapping(value = "/getOrderDetails.do", method = RequestMethod.GET)
	public Map<String, Object> getOrderDetails(Model model,
	        @RequestParam("ordered_detail_no") String ordered_detail_no) {
	    // 예: 서비스에서 주문 상세 정보 조회
	    Map<String, Object> orderDetail = adminService.getOrderDetails(ordered_detail_no);
	    
	    // 응답 데이터 생성
	    Map<String, Object> response = new HashMap<>();
	    if (orderDetail != null) {
	        // 주문 상세 정보를 응답 맵에 넣기
	        response.put("ordered_status", orderDetail.get("ordered_status")); // 주문 상태
	        response.put("ordered_name", orderDetail.get("ordered_name")); // 구매자명
	        response.put("ordered_phone", orderDetail.get("ordered_phone")); // 연락처
	        response.put("ordered_address", orderDetail.get("ordered_address")); //주소
	        response.put("ordered_note", orderDetail.get("ordered_note")); // 배송 메모
	        response.put("ordered_delivery_fee", orderDetail.get("ordered_delivery_fee")); // 배송비
	        response.put("ordered_create_at", orderDetail.get("ordered_create_at")); // 주문접수일
	        response.put("ordered_detail_quantity", orderDetail.get("ordered_detail_quantity")); // 수량
	        response.put("product_name", orderDetail.get("product_name")); // 상품명
	        response.put("product_price", orderDetail.get("product_price")); // 상품가격
	        response.put("payment_date", orderDetail.get("payment_date")); // 결제일
	        response.put("payment_method", orderDetail.get("payment_method")); // 결제수단
	        response.put("payment_price", orderDetail.get("payment_price")); // 결제금액
	    } else {
	        response.put("error", "Order details not found");
	    }

	    return response;
	}


	// 취소 관리
	@RequestMapping(value = "/cancel.do", method = RequestMethod.GET)
	public String cancel(Model model,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {

		int total = adminService.orderCancelTotal();

		PagingUtil paging = new PagingUtil(nowPage, total, 10);

		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", paging.getStart());
		pagingParam.put("perPage", paging.getPerPage());

		List<Map<String, Object>> orderCancelList = adminService.orderCancelList(pagingParam);
		
		model.addAttribute("orderCancelList", orderCancelList);
		model.addAttribute("paging", paging);

		
		return "admin/cancel";
	}
	
	// payment_type 상태 변경 ajax
	@ResponseBody
	@RequestMapping(value = "/updateRefundStatus.do", method = RequestMethod.POST)
	public String changeRefundStatus(@RequestBody PaymentVO paymentVO) {
		
		// 주문 상태를 변경하는 서비스 호출
	    int result = adminService.updateRefundStatus(paymentVO);
	    
	    // 상태 변경 성공 여부에 따라 결과 반환
	    if(result > 0) {
	        return "success";  // 성공
	    } else {
	        return "failure";  // 실패
	    }
	
	}

	// 매출 관리
	@RequestMapping(value = "/sales.do", method = RequestMethod.GET)
	public String sales(Model model,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {
		
		int total = adminService.salesTotal();

		PagingUtil paging = new PagingUtil(nowPage, total, 10);

		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", paging.getStart());
		pagingParam.put("perPage", paging.getPerPage());

		List<Map<String, Object>> salesList = adminService.salesList(pagingParam);
		
		
		// 총 거래금액
        OrderedDetailVO orderTotalAmount = adminService.orderTotalAmount();
        // 총 결제금액
        PaymentVO paymentTotalAmount = adminService.paymentTotalAmount();
        // 총 판매수량
        OrderedDetailVO orderTotalQuantity = adminService.orderTotalQuantity();

        // 계산된 값을 모델에 담아서 뷰에 전달
        model.addAttribute("orderTotalAmount", orderTotalAmount);
        model.addAttribute("paymentTotalAmount", paymentTotalAmount);
        model.addAttribute("orderTotalQuantity", orderTotalQuantity);
        model.addAttribute("salesList", salesList);
		
		
		

		return "admin/sales";
	}

	// 리뷰 관리
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public String review(Model model,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {

		int total = adminService.reviewTotal();

		PagingUtil paging = new PagingUtil(nowPage, total, 10);

		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", paging.getStart());
		pagingParam.put("perPage", paging.getPerPage());

		List<Map<String, Object>> reviewList = adminService.reviewList(pagingParam);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("paging", paging);
		
		return "admin/review";
	}

	// review_status 상태 변경 ajax
	@ResponseBody
	@RequestMapping(value = "/reviewStatus.do", method = RequestMethod.POST)
	public String reviewStatus(@RequestBody ReviewVO reviewVO) {
		
		// 주문 상태를 변경하는 서비스 호출
		int result = adminService.reviewStatus(reviewVO);
		
		// 상태 변경 성공 여부에 따라 결과 반환
		if(result > 0) {
			return "success";  // 성공
		} else {
			return "failure";  // 실패
		}
		
	}

	// 문의 관리
	@RequestMapping(value = "/contact.do", method = RequestMethod.GET)
	public String contact(Model model, OrderedDetailVO orderedDetailVO, PaymentVO paymentVO,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {

		OrderedDetailVO orderTotalAmount = adminService.orderTotalAmount();
	    PaymentVO paymentTotalAmount = adminService.paymentTotalAmount();
	    OrderedDetailVO orderTotalQuantity = adminService.orderTotalQuantity();
	    
		int total = adminService.contactTotal();

		PagingUtil paging = new PagingUtil(nowPage, total, 10);

		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", paging.getStart());
		pagingParam.put("perPage", paging.getPerPage());

		// 비지니스 로직 : DB에 있는 전체 회원 목록 데이터가져오기
		List<Map<String, Object>> contactList = adminService.contactList(pagingParam);
		
		
		
		// 모델 객체 사용하여 조회 데이터 화면으로 포워딩
		model.addAttribute("contactList", contactList);
		model.addAttribute("paging", paging);
		model.addAttribute("orderTotalAmount", orderTotalAmount);
		model.addAttribute("paymentTotalAmount", paymentTotalAmount);
		model.addAttribute("orderTotalQuantity", orderTotalQuantity);
		
		return "admin/contact";
	}
	
	// 문의 답변 저장 (AJAX 요청 처리)
    @ResponseBody
    @RequestMapping(value = "/saveReply.do", method = RequestMethod.POST)
    public Map<String, Object> saveContactReply(@RequestBody ContactVO contactVO) {
        Map<String, Object> response = new HashMap<>();

        try {
            // 문의 답변 저장
            int result = adminService.saveContactReply(contactVO);

            if (result > 0) {
                response.put("status", "success");
                response.put("message", "답변이 성공적으로 저장되었습니다.");
            } else {
                response.put("status", "fail");
                response.put("message", "답변 저장에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
        }

        return response;
    }
	
	
	
	
	
	
	

}
