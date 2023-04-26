package category.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CategoryService {

	public Map<String, Object> getCategoryBestProductList(String pg) throws Exception;

	public void categorylikeCount(HashMap<String, String> dataMap);

	public List<Map<String, Object>> CategoryColorList(List<String> colorArr);

	
	

}
