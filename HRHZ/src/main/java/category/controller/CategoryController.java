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
	    public Map<String, Object> bestCategoryPorductList(HttpSession session,  
	    													@RequestParam(value ="colorArr[]",  required = false) List<String> colorArr,
	    													@RequestParam(value ="price",  required = false) String price, 
	    													@RequestParam(value ="inputPrice1",  required = false) String inputPrice1,
	    													@RequestParam(value ="inputPrice2",  required = false) String inputPrice2,
	    													@RequestParam(value ="checkList[]", required = false) List<String> checkList,
	    											        @RequestParam(value ="parentCode", required = false) String parentCode,
	    											        @RequestParam(value ="sortValue", required = false) String sortValue,
	    													@RequestParam String pg) throws Exception {
	    	
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("colorArr", colorArr);
		map.put("price", price);
		map.put("inputPrice1", inputPrice1);
		map.put("inputPrice2", inputPrice2);
		map.put("pg", pg);
		map.put("parentCode", parentCode);
	    map.put("checkList", checkList);
	    map.put("sortValue", sortValue);
	    
	    System.out.println(pg);
	    System.out.println(colorArr);
	    System.out.println(checkList);
	    System.out.println(sortValue);
		 
		 return categoryService.getCategoryBestProductList(map);
	    	
	    }
	 
	 
	 	@PostMapping(value = "/categorylikeCount")
	    @ResponseBody
	    public void likeCount(@RequestParam HashMap<String, String> dataMap) throws Exception {
	    	categoryService.categorylikeCount(dataMap);
	    }
	 
	

}
