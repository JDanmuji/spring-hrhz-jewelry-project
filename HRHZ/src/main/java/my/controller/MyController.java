package my.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "myPage")
public class MyController {

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
    public String myPageManage(Model model){
        model.addAttribute("display", "myPageManage0.jsp");
        return "/views/my/myPage";
    }
}
