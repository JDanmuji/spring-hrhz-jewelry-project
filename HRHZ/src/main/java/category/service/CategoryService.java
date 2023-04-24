package category.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CategoryService {

	public List<Map<String, Object>> getCategoryBestProductList() throws Exception;

	public void categorylikeCount(HashMap<String, String> dataMap);

	

}
