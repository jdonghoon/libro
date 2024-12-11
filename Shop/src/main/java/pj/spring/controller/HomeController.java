package pj.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pj.spring.service.HomeService;
import pj.spring.vo.ProductVO;

@Controller
public class HomeController {
	
	@Autowired
	public HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) { // 화면에 뿌려주기 위한 model 선언
		
		List<ProductVO> tvo = homeService.selectTodayBook();
		List<ProductVO> bsvo = homeService.selectBestSellerBook();
		List<ProductVO> hvo = homeService.selectHotBook();
		
		model.addAttribute("tvo", tvo);
		model.addAttribute("bsvo", bsvo);
		model.addAttribute("hvo", hvo);
		
		return "home";
	}
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String newList() {
		
		return "user/menu/new_list";
	}
}
