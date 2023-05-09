package admin.service;



import hrhz.dto.BrandDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



public interface AdminService {
	
	public List<Map<String, String>> getMemberList();

	public void brandMemberInsert(HashMap<String, Object> dataMap);

	public Map<String, String> getBrand(String brandCode);


	public void brandUpdateSubmit(Map<String, Object> map);

	List<Map<String, Object>> getBrandList();

}
