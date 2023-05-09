package purchase.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hrhz.dto.ReviewDTO;
import purchase.dao.PurchaseDAO;

import java.util.List;
import java.util.Map;

@Service
public class PurchasesServiceImpl implements PurchaseService {
	@Autowired
	PurchaseDAO purchaseDAO;

	@Override
	public List<Map<String, Object>> getProductDetail(Map<String, String> map) {
		return purchaseDAO.getProductDetail(map);
	}

	@Override
	public List<Map<String, Object>> getProductImages(String productCode) {
		return purchaseDAO.getProductImages(productCode);
	}

	@Override
	public List<Map<String, Object>> getProductReviews(String productCode) {
		return purchaseDAO.getProductReviews(productCode);
	}

	@Override
	public void reviewUpload(ReviewDTO reviewDTO, List<String> fileNameList) {
		purchaseDAO.reviewUpload(reviewDTO, fileNameList);
	}

	@Override
	public String cartInsert(Map<String, Object> param) {
		System.out.println(param);
		return purchaseDAO.cartInsert(param);
	}

	@Override
	public void cartDelete(Map<String, Object> param) {
		
		purchaseDAO.cartDelete(param);
		
	}
}
