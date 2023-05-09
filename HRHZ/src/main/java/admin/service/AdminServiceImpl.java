package admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import hrhz.dto.BrandDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<Map<String, String>> getMemberList() {
		return adminDAO.getMemberList();
  }
  

@Override
public void brandMemberInsert(HashMap<String, Object> dataMap) {
	String address = dataMap.get("businessLocation1").toString() + dataMap.get("businessLocation2").toString();
	String returnAddress = dataMap.get("returnAddress1").toString() + dataMap.get("returnAddress2").toString();
	
	System.out.println(dataMap.get("deliveryFee"));
	
	dataMap.put("address", address);
	dataMap.put("returnAddress", returnAddress);
	
	adminDAO.brandMemberInsert(dataMap);
	
	
}

	@Override
	public Map<String, String> getBrand(String brandCode) {
		return adminDAO.getBrand(brandCode);
	}


	@Override
	public void brandUpdateSubmit(Map<String, Object> map) {
		adminDAO.brandUpdateSubmit(map);
	}
	
  @Override
	public List<Map<String, Object>> getBrandList() {
		return adminDAO.getBrandList();
	}

}
