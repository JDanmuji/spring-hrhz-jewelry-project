
package purchase.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import hrhz.dto.ReviewDTO;
import purchase.service.PurchaseService;

@Controller
@RequestMapping(value="purchase")
public class PurchaseController {
	@Autowired
	PurchaseService purchaseService;

	 @GetMapping(value="productDetail")
	 public String productDetail(@RequestParam(required = false) String code, Model model){
		 System.out.println(code);
		 return "/views/purchase/productDetail";
	 }

	 @PostMapping(value="payment")
	 public String payment(Model model){
		 return "/views/purchase/payment";
	 }
	 
	 @GetMapping(value = "cartForm")
	 public String cartForm(Model model){
		 return "/views/purchase/cart";
	 }
	 
	 @PostMapping(value = "getProductDetail")
	 @ResponseBody
	 public List<Map<String, Object>> getProductDetail(@RequestParam Map<String, String> map) {
		 return purchaseService.getProductDetail(map);
	 }
	 
	 @PostMapping(value = "getProductImages")
	 @ResponseBody
	 public List<Map<String, Object>> getProductImages(@RequestParam String productCode) {
		 return purchaseService.getProductImages(productCode);
	 }
	 
	 @PostMapping(value = "getProductReviews")
	 @ResponseBody
	 public List<Map<String, Object>> getProductReviews(@RequestParam String productCode) {
		 System.out.println(purchaseService.getProductReviews(productCode));
		 return purchaseService.getProductReviews(productCode);
	 }
	 
	 @PostMapping(value = "reviewUpload", produces = "text/html; charset=UTF-8")
	 @ResponseBody
	 public String reviewUpload(@RequestParam("img[]") List<MultipartFile> list,
			    			  @ModelAttribute ReviewDTO reviewDTO,
			 				  HttpSession session) {
		 List<String> fileNameList = new ArrayList<String>();
		 
		 String filePath = session.getServletContext().getRealPath("/WEB-INF/storage/review");
		 String fileName;
		 File file;
		 
		 System.out.println(list.get(0));
		 System.out.println(list.get(0).getSize());
		 
		 if(list.get(0).getSize() > 0) {
			 for(MultipartFile img : list) {
				 fileName = img.getOriginalFilename();
				 
				 System.out.println(fileName);
				 
				 file = new File(filePath, fileName);
				 
				 try {
					 img.transferTo(file);
				 } catch (IOException e) {
					 e.printStackTrace();
				 }
				 fileNameList.add(fileName);
			 }//for
		 }
		 else {
			 fileNameList = null;
			 System.out.println(fileNameList);
		 }
		 purchaseService.reviewUpload(reviewDTO, fileNameList);
		 return "/views/purchase/productDetail";
	 }
	 
//	 @PostMapping(value = "reviewUpload", produces = "text/html; charset=UTF-8")
//	 public String reviewUpload(@ModelAttribute ReviewDTO reviewDTO) {
//		 purchaseService.reviewUpload(reviewDTO, null);
//		 return "/views/purchase/productDetail";
//	 }
}
