package category.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CategoryDAO {

	public List<Map<String, Object>> getCategoryBestProductList() throws Exception;

	public void categorylikeCount(HashMap<String, String> dataMap);

	
	

}
