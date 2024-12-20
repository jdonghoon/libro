package pj.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pj.spring.service.MenuService;
import pj.spring.util.PagingUtil;
import pj.spring.vo.ProductVO;
import pj.spring.vo.ReviewVO;
import pj.spring.vo.SearchVO;

@Controller
public class MenuController {
	
	@Autowired
	public MenuService menuService;
	
	@RequestMapping(value = "/newList.do", method = RequestMethod.GET)
	public String newList(Model model, SearchVO searchVO, @RequestParam(value="nowPage", required = false, defaultValue="1") int nowpage, HttpServletRequest request) {
		
		/* System.out.println(searchVO.getCategoryType()); */
		
		int total = menuService.selectTotal(searchVO);
		
		PagingUtil paging = new PagingUtil(nowpage, total, 10);
		
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		
		List<ProductVO> newList = menuService.selectNewList(searchVO);
		/* System.out.println(newList.size()); */
		
		List<ProductVO> recommend = menuService.selectRecommend();
		
		model.addAttribute("paging", paging);
		model.addAttribute("newList", newList);
		model.addAttribute("recommend", recommend);
		
		return "user/menu/newList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/category.do", produces = "application/json; charset=UTF-8")
	public Map<String, Object> ajaxCategory(Model model, SearchVO searchVO, @RequestParam(value="nowPage", required = false, defaultValue="1") int nowpage) {
	    
		int total = menuService.selectTotal(searchVO);
	    
	    PagingUtil paging = new PagingUtil(nowpage, total, 10);
		
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		
	    List<ProductVO> ajaxCategory = menuService.selectNewList(searchVO);
	    
	    Map<String, Object> result = new HashMap<>();
	    result.put("categoryData", ajaxCategory);
	    result.put("paging", paging);
	    
	    return result;
	}

	@RequestMapping(value = "/bestsellerList.do", method = RequestMethod.GET)
	public String bestsellerList(Model model, SearchVO searchVO, @RequestParam(value="nowPage", required = false, defaultValue="1") int nowpage) {
		
		int total = menuService.selectTotal(searchVO);
		
		PagingUtil paging = new PagingUtil(nowpage, total, 10);
		
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		
		List<ProductVO> bestsellerList = menuService.selectBestsellerList(searchVO);
		List<ProductVO> recommend = menuService.selectRecommend();
		
		model.addAttribute("paging", paging);
		model.addAttribute("bestsellerList", bestsellerList);
		model.addAttribute("recommend", recommend);
		
		return "user/menu/bestsellerList";
	}
	
	@RequestMapping(value = "/totalList.do", method = RequestMethod.GET)
	public String totalList(Model model, SearchVO searchVO, @RequestParam(value="nowPage", required = false, defaultValue="1") int nowpage) {
		
		int total = menuService.selectTotal(searchVO);
		
		PagingUtil paging = new PagingUtil(nowpage, total, 10);
		
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		
		List<ProductVO> totalList = menuService.selectTotalList(searchVO);
		List<ProductVO> recommend = menuService.selectRecommend();
		
		model.addAttribute("paging", paging);
		model.addAttribute("totalList", totalList);
		model.addAttribute("recommend", recommend);
		
		return "user/menu/totalList";
	}
	
	
	@RequestMapping(value= "/product.do", method = RequestMethod.GET)
	public String productDetail(Model model, int product_no) {
		
		ProductVO productDetail = menuService.selectProductDetail(product_no);
		ReviewVO reviewDetail = menuService.selectReviewDetail(product_no);
	    
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("reviewDetail", reviewDetail);
		
		return "user/menu/productDetail";
	}
}
