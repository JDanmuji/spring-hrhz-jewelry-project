package category.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import category.dao.CategoryDAO;
import hrhz.dto.CategoryPaing;

@Service
public class CategorySeviceImpl implements CategoryService {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private CategoryPaing categoryPaging = null;
	

	@Override
	public Map<String, Object> getCategoryBestProductList(String pg) throws Exception{
		
		
		int endNum = Integer.parseInt(pg) * 21;
		int startNum = endNum - 20 ;
		
		System.out.println("endNum" + endNum);
		System.out.println("startNum" + startNum);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<Map<String, Object>> list = categoryDAO.getCategoryBestProductList(map);
		
		//페이징 처리
		int totalA =  categoryDAO.getTotalA();
		System.out.println(totalA);
		
		categoryPaging.setCurrentPage(Integer.parseInt(pg));
		categoryPaging.setPageBlock(5);
		categoryPaging.setPageSize(21);
		categoryPaging.setTotalA(totalA);
		
		categoryPaging.makPagingHTML();
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("categoryPaging", categoryPaging);
		
		return  map2;
	}


	@Override
	public void categorylikeCount(HashMap<String, String> dataMap) {
		categoryDAO.categorylikeCount(dataMap);
		
	}



	@Override
	public List<Map<String, Object>> CategoryColorList(List<String> colorArr) {
		return categoryDAO.CategoryColorList(colorArr);
	}



}
