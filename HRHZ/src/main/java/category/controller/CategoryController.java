package category.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import category.service.CategoryService;

@Controller
public class CategoryController {
	private CategoryService categoryService;
	
	 @PostMapping(value = "/bestCategoryPorductList")
	 @ResponseBody
	    public List<Map<String, Object>> bestCategoryPorductList(HttpSession session) throws Exception {
	    	return categoryService.getCategoryBestProductList();
	    }

}
