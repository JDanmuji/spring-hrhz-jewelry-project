package brand.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import brand.service.BrandService;

@Controller
@RequestMapping(value = "brand")
public class BrandController {
	@Autowired
	BrandService brandService;
	
	@GetMapping(value = "brandDetail")
	public String reviewForm(@RequestParam String pg, Model model) {
		model.addAttribute("pg", pg);
		return "/views/brand/brandDetail";
	}
	 
	@PostMapping(value = "/getBrandList")
	@ResponseBody //DispatcherServlet으로 돌아가지 못하게 막고, 데이터 형태를 JSON으로 변경해 ajax로 보냄
	public List<Map<String, Object>> list() {
		return brandService.getBrandList();
	}
	 
	@PostMapping(value = "/getBrandDetail")
	@ResponseBody //DispatcherServlet으로 돌아가지 못하게 막고, 데이터 형태를 JSON으로 변경해 ajax로 보냄
	public Map<String, Object> getBrandDetail(HttpSession session,  
												    // @RequestParam(value ="colorArr[]", required = false) List<String> colorArr, 
												    @RequestParam Map<String, Object> map) {
		return brandService.getBrandDetail(map);
	}
}
