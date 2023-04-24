package main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MainService {

	public List<Map<String, Object>> getBestProductList() throws Exception;

	public List<Map<String, Object>> getTop100Product() throws Exception;

	public void likeCount(HashMap<String, String> dataMap) throws Exception;

	
}