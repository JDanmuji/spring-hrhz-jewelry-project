package purchase.service;

import java.util.List;
import java.util.Map;

import hrhz.dto.ReviewDTO;

public interface PurchaseService {
	public List<Map<String, Object>> getProductDetail(Map<String, String> map);
	public List<Map<String, Object>> getProductImages(String productCode);
	public List<Map<String, Object>> getProductReviews(String productCode);
	public void reviewUpload(ReviewDTO reviewDTO, List<String> fileNameList);
}
