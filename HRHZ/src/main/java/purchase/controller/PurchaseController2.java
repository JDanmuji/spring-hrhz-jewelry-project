package purchase.controller;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import purchase.service.PurchaseService2;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="purchase")
public class PurchaseController2 {
    @Autowired
    private PurchaseService2 purchaseService2;

    @PostMapping(value = "getProductInfo")
    @ResponseBody
    public void getProductInfo(@RequestBody Map<String,List<Map<String, Object>>> data)  {
        System.out.println("11");
        System.out.println(data);
        purchaseService2.getProductInfo(data);


    }

}
