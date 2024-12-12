package pj.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pj.spring.service.AdminService;
import pj.spring.util.PagingUtil;
import pj.spring.vo.UserVO;

@RequestMapping(value="/admin")
@Controller
public class AdminController {

	@Autowired
	public AdminService adminService;
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Model model) {
		
		Map<String, Object> orderCount = adminService.orderCount();
		Map<String, Object> cancelCount = adminService.cancelCount();
		Map<String, Object> contentCount = adminService.contentCount();
        
        model.addAttribute("orderCount", orderCount);
        model.addAttribute("cancelCount", cancelCount);
        model.addAttribute("contentCount", contentCount);
		
		return "admin/index";
	}
	
	
	@RequestMapping(value = "/membership.do", method = RequestMethod.GET)
	public String membership(Model model
			, @RequestParam(value="nowPage", required=false, defaultValue ="1")int nowPage) {
		
		int total = adminService.selectTotal();
		
		PagingUtil paging = new PagingUtil(nowPage, total, 10);
		
		Map<String,Integer> pagingParam =new HashMap<String,Integer>();
		pagingParam.put("start", paging.getStart());
		pagingParam.put("perPage", paging.getPerPage());
		
		//비지니스 로직 : DB에 있는 전체 회원 목록 데이터가져오기
		 List<UserVO> list= adminService.userList(pagingParam);
		
		//모델 객체 사용하여 조회 데이터 화면으로 포워딩
		model.addAttribute("list", list);
		model.addAttribute("paging",paging);
		
		return "admin/membership";
	}
	
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public String product() {
		
		return "admin/product";
	}
	
	@RequestMapping(value = "/productWrite.do", method = RequestMethod.GET)
	public String productWrite() {
		
		return "admin/productWrite";
	}
	
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String order() {
		
		return "admin/order";
	}
	
	@RequestMapping(value = "/cancel.do", method = RequestMethod.GET)
	public String cancel() {
		
		return "admin/cancel";
	}
	
	@RequestMapping(value = "/sales.do", method = RequestMethod.GET)
	public String sales() {
		
		return "admin/sales";
	}
	
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public String review() {
		
		return "admin/review";
	}
	
	@RequestMapping(value = "/contact.do", method = RequestMethod.GET)
	public String contact() {
		
		return "admin/contact";
	}
	
	
}
