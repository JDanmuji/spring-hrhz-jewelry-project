package member.controller;

import member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    

    @GetMapping(value = "/signUp1")
    public String signUp1(){
        return "/views/member/signUp1";
    }
        
    @PostMapping(value = "/signUp2")
    public String signUp2(@RequestParam String phone, Model model) {
    	model.addAttribute("phone", phone);
    	return "/views/member/signUp2";
    }

    @PostMapping(value = "/signUp3")
    public String signUp3(@RequestParam String phone, 
    						@RequestParam(required = false) String emailAlarm,
    						@RequestParam(required = false) String smsAlarm, Model model) {
    	
    	model.addAttribute("phone", phone);
    	model.addAttribute("emailAlarm", emailAlarm);
    	model.addAttribute("smsAlarm", smsAlarm);
    	
    	return "/views/member/signUp3";
    }

    @PostMapping(value = "/signUp/sendSMS")
    @ResponseBody
    public String sendSMS(@RequestParam String phone){

    	String verify = memberService.getMember(phone); // duplicate check
        
        if (verify.equalsIgnoreCase("exist")) {
            return "exist";
        } else {
            Random random = new Random();
            String numStr = "";
            for (int i = 0; i < 6; i++) {
                String ran = Integer.toString(random.nextInt(10));
                numStr += ran;
            }

            memberService.certifiedPhoneNumber(phone, numStr); //send authentication number

            return numStr;
        }
    }

    
    @PostMapping(value = "/memberInsert")
    @ResponseBody
    public void memberInsert(@RequestParam HashMap<String, Object> dataMap) throws Exception {
    	memberService.memberInsert(dataMap); //send authentication number
        
    }
    
    @PostMapping(value = "/signIn")
    @ResponseBody
    public String signIn(@RequestParam HashMap<String, Object> dataMap, HttpServletRequest request) throws Exception {
    	String result;
    	HttpSession session = request.getSession();

    	String id = memberService.loginCheck(dataMap);  
    	
    	if (id != null) { // 로그인 성공 시
    		System.out.println(id);
    		
    	   session.setAttribute("sessionId", id);
    	   result = "success";
    	} else { // 로그인 실패 시
    	   result = "error";
    	}
        
	    return result;
    }
    
    @GetMapping(value = "/signOut")
    public String signOut(HttpServletRequest request) {
    	HttpSession session = request.getSession();
//		session.removeAttribute("sessionId");
        session.invalidate();
        return "redirect:/";
    }
}
