package pj.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/admin")
@Controller
public class AdminController {

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index() {
		
		return "admin/index";
	}
	
	
}
