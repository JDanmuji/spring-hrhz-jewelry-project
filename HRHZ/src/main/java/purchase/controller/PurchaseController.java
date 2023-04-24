package purchase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="purchase")
public class PurchaseController {

	 @GetMapping(value="productDetail")
	 public String productDetail(Model model){
		 return "/views/purchase/productDetail";
	 }	
	

	 @GetMapping(value="payment")
	 public String payment(Model model){
		 return "/views/purchase/payment";
	 }	
	 
	 @GetMapping(value = "cartForm")
	 public String cartForm(Model model){
		 return "/views/purchase/cart";
	 }
}
