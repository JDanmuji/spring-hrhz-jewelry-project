package category.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import category.dao.CategoryDAO;

@Service
public class CategorySeviceImpl implements CategoryService {
	
	@Autowired
	private CategoryDAO categoryDAO;
	

	@Override
	public List<Map<String, Object>> getCategoryBestProductList() throws Exception{
		return categoryDAO.getCategoryBestProductList();
	}


	@Override
	public void categorylikeCount(HashMap<String, String> dataMap) {
		categoryDAO.categorylikeCount(dataMap);
		
	}

}
