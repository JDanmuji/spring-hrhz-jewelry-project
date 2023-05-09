package brand.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import brand.dao.BrandDAO;
import hrhz.dto.BrandPaging;

@Service
public class BrandServiceImpl implements BrandService {
	@Autowired
	private BrandDAO brandDAO;
	@Autowired
	private BrandPaging brandPaging;

	@Override
	public List<Map<String, Object>> getBrandList(String memberId) {
		List<Map<String, Object>> list = brandDAO.getBrandList(memberId);
		return list;
	}

	@Override
	public Map<String, Object> getBrandDetail(Map<String, Object> map) {
		
		int endNum = Integer.parseInt(map.get("pg").toString()) * 21;
		int startNum = endNum - 20 ;
		
		System.out.println("endNum" + endNum);
		System.out.println("startNum" + startNum);
	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<Map<String, Object>> list = brandDAO.getBrandDetail(map);
		
		//페이징 처리
		int totalA =  brandDAO.getTotalA(map);
		System.out.println(totalA);
		
		brandPaging.setCurrentPage(Integer.parseInt(map.get("pg").toString()));
		brandPaging.setPageBlock(5);
		brandPaging.setPageSize(21);
		brandPaging.setTotalA(totalA);
		
		brandPaging.makePagingHTML();
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("brandPaging", brandPaging);
	
		return map2;
	}
}