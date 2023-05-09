package main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import main.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@GetMapping(value="")
	public String main() {
		return "index";
	}

	@GetMapping(value = "/loginModal")
	public String loginModal() {
		return "/views/common/loginModal";
	}

	@GetMapping(value="/category")
	public String category(@RequestParam String pg, Model model) {
		model.addAttribute("pg", pg);
		return "/views/category/category";
	}
	
	@GetMapping(value="/brand")
	public String brand() {
		return "/views/brand/brand";
	}
	
	@GetMapping(value="/myPage")
	public String mypage() {
		return "/views/my/myPage";
	}
	
	@GetMapping(value="/signIn")
	public String siginIn() {
		return "/views/member/signIn";
	}

	@GetMapping(value="/magazineAmonzTakeALook")
	public String magazineAmonzTakeALook() {
		return "/views/main/magazineAmonzTakeALook";
	}
	
	@GetMapping(value="/magazineCarotcollection")
	public String magazineCarotcollection() {
		return "/views/main/magazineCarotcollection";
	}
	
	@GetMapping(value="/magazineInstargram")
	public String magazineInstargram() {
		return "/views/main/magazineInstargram";
	}
	
	@GetMapping(value="/magazineBicycle")
	public String magazineBicycle() {
		return "/views/main/magazineBicycle";
	}

	@GetMapping(value="/magazineEmptycart")
	public String magazineEmptycart() {
		return "/views/main/magazineEmptycart";
	}
	
	@GetMapping(value="/magazineMyStarryDeal")
	public String magazineMyStarryDeal() {
		return "/views/main/magazineMyStarryDeal";
	}
	
	@GetMapping(value="/magazineRomanticMode")
	public String magazineRomanticMode() {
		return "/views/main/magazineRomanticMode";
	}
	
	@GetMapping(value="/magazineABC")
	public String magazine_1() {
		return "/views/main/magazineABC";
	}
	
	@GetMapping(value="/magazineMidnightMoment")
	public String magazineMidnightMoment() {
		return "/views/main/magazineMidnightMoment";
	}
	
	@GetMapping(value="/magazineSpringWind")
	public String magazineSpringWind() {
		return "/views/main/magazineSpringWind";
	}
	
    @PostMapping(value = "/bestProduct")
    @ResponseBody
    public List<Map<String, Object>> bestProduct(@RequestParam String memberId, HttpSession session) throws Exception {
    	return mainService.getBestProductList(memberId);
    }
    
    @PostMapping(value = "/top100Product")
    @ResponseBody
    public List<Map<String, Object>> top100Product(@RequestParam String memberId, HttpSession session) throws Exception {
    	return mainService.getTop100Product(memberId);
    }
    
    @PostMapping(value = "/getRecentReview")
    @ResponseBody
    public List<Map<String, Object>> getRecentReview(HttpSession session) throws Exception {
    	return mainService.getRecentReview();
    }
    
    @PostMapping(value = "/likeCount")
    @ResponseBody
    public void likeCount(@RequestParam HashMap<String, String> dataMap) throws Exception {
    	mainService.likeCount(dataMap);
    }
}
