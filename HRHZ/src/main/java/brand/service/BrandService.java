package brand.service;

import java.util.List;
import java.util.Map;

public interface BrandService {
    public List<Map<String, Object>> getBrandList(String memberId);
	public Map<String, Object> getBrandDetail(Map<String, Object> map);
}
