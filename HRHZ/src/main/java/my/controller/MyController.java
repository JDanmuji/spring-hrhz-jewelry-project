package my.controller;

import hrhz.dto.MemberDTO;
import my.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping(value = "myPage")
public class MyController {
    @Autowired
    private MyService myService;

//        HttpSession session = request.getSession();
//        String id = (String) request.getAttribute("id"); // id session value

    @GetMapping(value = "reviewForm")
    public String reviewForm(Model model){
        model.addAttribute("display", "reviewForm.jsp");
        return "/views/my/myPage";
    }

    @GetMapping(value = "couponForm")
    public String couponForm(Model model){
        model.addAttribute("display", "couponForm.jsp");
        return "/views/my/myPage";
    }

    @GetMapping(value = "pointForm")
    public String pointForm(Model model){
        model.addAttribute("display", "pointForm.jsp");
        return "/views/my/myPage";
    }

    @GetMapping(value = "orderListForm")
    public String orderListForm(Model model){
        model.addAttribute("display", "orderListForm.jsp");
        return "/views/my/myPage";
    }

    @GetMapping(value = "likeProduct")
    public String likeProduct(Model model){
        model.addAttribute("display", "likeProduct.jsp");
        return "/views/my/myPage";
    }

    @GetMapping(value = "likeBrand")
    public String likeBrand(Model model){
        model.addAttribute("display", "likeBrand.jsp");
        return "/views/my/myPage";
    }

    @GetMapping(value = "myPageManage")
    public String myPageManage(Model model, HttpServletRequest request){
        String id = "k00001"; //hard coding

        MemberDTO memberDTO = myService.getMemberInfo(id); //memberDTO 가져오기
        model.addAttribute("memberDTO",memberDTO);

        // api distinguish
        if(id.charAt(0) == 'a'){
            model.addAttribute("display", "myPageManage0.jsp");
        } else {
            // api 가입 경로
            model.addAttribute("display", "myPageManage1.jsp");
        }
        return "/views/my/myPage";
    }
    @GetMapping(value = "myPageManage1")
    public String myPageManage1(Model model){
        String id = "k00001"; //hard coding

        MemberDTO memberDTO = myService.getMemberInfo(id); //memberDTO 가져오기
        model.addAttribute("memberDTO",memberDTO);

        model.addAttribute("display", "myPageManage1.jsp");
        return "/views/my/myPage";
    }

    @PostMapping(value = "getMember")
    @ResponseBody
    public String getMember(@RequestParam String password, HttpServletRequest request){
        String id = "k00001"; //hard coding
        return myService.getMember(id, password);
    }


    //---------------------------------------
    // update pwd
    @PostMapping(value = "updateNewPwd")
    @ResponseBody
    public void updateNewPwd(@RequestParam("checkPassword") String checkPassword) {
        String id = "k00001"; //hard coding
        myService.updateNewPwd(id, checkPassword);
    }

    @GetMapping(value = "updatePwdModal")
    public String updatePwdModal(){
        return "/views/my/updatePwdForm";
    }


    //---------------------------------------
    // delete member
    @PostMapping(value = "deleteMember")
    @ResponseBody
    public void deleteMember() {
        String id = "k00001"; //hard coding
        myService.deleteMember(id);
    }
    @GetMapping(value = "deleteMemberModal")
    public String deleteMemberModal(){
        return "/views/my/deleteMemberForm";
    }

    //---------------------------------------
    // update member info
    @PostMapping(value = "updateMember")
    @ResponseBody
    public void updateMember(@ModelAttribute MemberDTO memberDTO) {
        String id = "k00001"; //hard coding
        myService.updateMember(memberDTO);
    }
    @GetMapping(value = "updateMemberModal")
    public String updateMemberModal(){
        return "/views/my/updateMemberInfo";
    }

}
