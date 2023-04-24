package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.service.AdminService;


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
	  
}
