package category.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import category.service.CategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	 @RequestMapping(value = "/bestCategoryPorductList")
	 @ResponseBody
	    public Map<String, Object> bestCategoryPorductList(HttpSession session, @RequestParam String pg) throws Exception {
	    	return categoryService.getCategoryBestProductList(pg);
	    	
	    }
	 
	 
	 @PostMapping(value = "/categorylikeCount")
	    @ResponseBody
	    public void likeCount(@RequestParam HashMap<String, String> dataMap) throws Exception {
	    	categoryService.categorylikeCount(dataMap);
	    }
	 
	 @PostMapping(value = "/categoryColorList")
	 @ResponseBody
	    public List<Map<String, Object>> CategoryColorList(HttpSession session, @RequestParam(value ="colorArr[]") List<String> colorArr) throws Exception {
		
			 System.out.println(colorArr);
	    	return categoryService.CategoryColorList(colorArr);
	    	
	    }
	 
	

}
