package purchase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping(value="purchase")
public class PurchaseController2 {

    @PostMapping(value = "getProductInfo")
    @ResponseBody
    public void getProductInfo(@ModelAttribute Map<String, Object> requestData){
        System.out.println("11");
        System.out.println(requestData.toString());
    }

}
