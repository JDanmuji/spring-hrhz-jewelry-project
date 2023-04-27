package main.service;

import main.dao.MainDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public List<Map<String, Object>> getBestProductList(String memberId) throws Exception {
		return mainDAO.getBestProductList(memberId);
	}

	@Override
	public List<Map<String, Object>> getTop100Product(String memberId) throws Exception {
		return mainDAO.getTop100Product(memberId);
	}

	@Override
	public List<Map<String, Object>> getRecentReview() throws Exception {
		return mainDAO.getRecentReview();
	}

	@Override
	public void likeCount(HashMap<String, String> dataMap) throws Exception {
		mainDAO.likeCount(dataMap);
		
	}
	

	
}



