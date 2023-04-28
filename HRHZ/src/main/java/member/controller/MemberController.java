package member.controller;

import member.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import hrhz.dto.NaverDTO;

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
//      session.removeAttribute("sessionId");
        session.invalidate();
        return "redirect:/";
    }
    
    @RequestMapping(value="/callBack", method=RequestMethod.GET)
    public String callBack(){
    	return "/views/member/callBack";
    }
    
    
    @RequestMapping(value="/naverSave", method=RequestMethod.POST)
	public @ResponseBody String naverSave(@RequestParam("n_age") String n_age, @RequestParam("n_birthday") String n_birthday, 
			@RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, 
			@RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, HttpServletRequest request) {
    	
    	HttpSession session = request.getSession();
    	
    	
	System.out.println("#############################################");
	System.out.println(n_age);
	System.out.println(n_birthday);
	System.out.println(n_email);
	System.out.println(n_gender);
	System.out.println(n_id);
	System.out.println(n_name);
	
	System.out.println("#############################################");

	NaverDTO naver = new NaverDTO();
	naver.setN_age(n_age);
	naver.setN_birthday(n_birthday);
	naver.setN_email(n_email);
	naver.setN_gender(n_gender);
	naver.setN_id(n_id);
	naver.setN_name(n_name);
	
	
	
	String result = memberService.naverloginCheck(naver);
	
    
	// ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
	
    
	if(result!=null) {
		 session.setAttribute("sessionId", result);
  	  // naver가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
		result = "ok";
	} else {
		session.setAttribute("sessionEmail", n_email);
		result ="no";
	}

	return result;
    
	}


}


