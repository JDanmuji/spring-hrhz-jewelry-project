package member.controller;

import hrhz.dto.MemberDTO;
import member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Random;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping(value = "/signUp")
    public String signUp(){
        return "/views/member/signUp_1";
    }
        
    @GetMapping(value = "/signUp1")
    public String signUp1() {
    	return "/views/member/signUp_2";
    }

    @GetMapping(value = "/signUp2")
    public String signUp2() {
    	return "/views/member/signUp_3";
    }

    //�씤利앸쾲�샇 �쟾�넚
    @PostMapping(value = "/signUp/sendSMS")
    @ResponseBody
    public String sendSMS(@RequestParam String phone){
        System.out.println(phone);
        String verify = memberService.getMember(phone); // duplicate check
        System.out.println(verify);
        if(verify.equalsIgnoreCase("exist")){
            return "exist";
        } else {
            Random random = new Random();
            String numStr = "";
            //6�옄由� �궃�닔 �깮�꽦
            for (int i = 0; i < 6; i++) {
                String ran = Integer.toString(random.nextInt(10));
                numStr += ran;
            }
            System.out.println("sendSMS num");
            System.out.println(numStr);

            memberService.certifiedPhoneNumber(phone, numStr); //send authentication number

            return numStr;
        }

    }

}
