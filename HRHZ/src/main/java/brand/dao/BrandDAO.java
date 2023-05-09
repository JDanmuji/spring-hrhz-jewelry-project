package brand.dao;

import java.util.List;
import java.util.Map;

public interface BrandDAO {
	public List<Map<String, Object>> getBrandList(String memberId);
	public List<Map<String, Object>> getBrandDetail(Map<String, Object> map);
	public int getTotalA(Map<String, Object> map);
}
