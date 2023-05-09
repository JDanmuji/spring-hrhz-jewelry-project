package main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

public interface MainService {

	public List<Map<String, Object>> getBestProductList(String memberId) throws Exception;
	public List<Map<String, Object>> getTop100Product(String memberId) throws Exception;
	public List<Map<String, Object>> getRecentReview() throws Exception;
	public void likeCount(HashMap<String, String> dataMap) throws Exception;
}
