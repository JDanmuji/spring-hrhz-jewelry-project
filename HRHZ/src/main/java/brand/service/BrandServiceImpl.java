package brand.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import brand.dao.BrandDAO;

@Service
public class BrandServiceImpl implements BrandService {
	@Autowired
	BrandDAO brandDAO;

	@Override
	public List<Map<String, Object>> getBrandList() {
		List<Map<String, Object>> list = brandDAO.getBrandList();
		return list;
	}
}
