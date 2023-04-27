package category.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CategoryDAO {

	public List<Map<String, Object>> getCategoryBestProductList(Map<String, Object> map) throws Exception;
	
	public void categorylikeCount(HashMap<String, String> dataMap);

	public int getTotalA(Map<String, Object> map);

//	public List<Map<String, Object>> CategoryColorList(Map<String, Object> map);


	
	

}
