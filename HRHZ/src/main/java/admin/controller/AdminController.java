package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.service.AdminService;
import hrhz.dto.BrandDTO;


@Controller
@RequestMapping(value="admin")
public class AdminController {
	
	  @Autowired
	  private AdminService adminService;
	  
	  
	  @GetMapping(value = "memberList")
	  public String memberList(Model model){
		  model.addAttribute("display", "memberList.jsp");
		  return "/views/admin/adminPage";
	  }

	  @GetMapping(value = "brandInsert")
	  public String brandInsert(Model model){
		  model.addAttribute("display", "brandInsert.jsp");
		  return "/views/admin/adminPage";
	  }
	  @PostMapping(value = "brandMemberInsert")
	  @ResponseBody
	  public void brandMemberInsert(@RequestParam HashMap<String, Object> dataMap){//리턴값이 존재하지 않을 경우 "void"
		  System.out.println(dataMap);
		  adminService.brandMemberInsert(dataMap);

		}
	  
	  
	  @GetMapping(value = "brandUpdate")
	  public String brandUpdate(Model model){
		  model.addAttribute("display", "brandUpdate.jsp");
		  return "/views/admin/adminPage";
	  }
	  
	  
	  @GetMapping(value = "brandDelete")
	  public String brandDelete(Model model){
		  model.addAttribute("display", "brandDelete.jsp");
		  return "/views/admin/adminPage";
	  }
	  
	  
	  @GetMapping(value = "brandImage")
	  public String brandImage(Model model){
		  model.addAttribute("display", "brandImage.jsp");
		  return "/views/admin/adminPage";
	  }
	  
	  
	  @GetMapping(value = "productInsert")
	  public String productInsert(Model model){
		  model.addAttribute("display", "productInsert.jsp");
		  return "/views/admin/adminPage";
	  }
	  
	  @GetMapping(value = "productUpdate")
	  public String productUpdate(Model model){
		  model.addAttribute("display", "productUpdate.jsp");
		  return "/views/admin/adminPage";
	  }
	  
	  
	  @GetMapping(value = "productDelete")
	  public String productDelete(Model model){
		  model.addAttribute("display", "productDelete.jsp");
		  return "/views/admin/adminPage";
	  }
	  
	  
	  @GetMapping(value = "productImage")
	  public String productImage(Model model){
		  model.addAttribute("display", "productImage.jsp");
		  return "/views/admin/adminPage";
	  }
	  
	  @PostMapping(value = "getMemberList")
	  @ResponseBody
	  public List<Map<String, String>> getMemberList(){
		  return adminService.getMemberList();
	  }

	  
	  @PostMapping(value = "getBrand")
	  @ResponseBody
	  public Map<String, String> getBrand(String brandCode){
		  return adminService.getBrand(brandCode);
	  }
	  
	  @PostMapping(value = "brandUpdateSubmit")
	  public String brandUpdateSubmit(@RequestParam Map<String, Object> map,
			  						  Model model) {
	      int deliveryFee = Integer.parseInt(map.get("deliveryFee").toString());
	      map.put("deliveryFee", deliveryFee);
	      adminService.brandUpdateSubmit(map);
	      
		  model.addAttribute("display", "brandUpdate.jsp");
		  return "/views/admin/adminPage";
	  }


	  @PostMapping(value = "getBrandList")
	  @ResponseBody
	  public List<Map<String, Object>> getBrandList(){
		  System.out.println("contorller");
		  return adminService.getBrandList();
	  }
	   
}










