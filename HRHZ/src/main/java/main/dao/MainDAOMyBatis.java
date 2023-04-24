package main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class MainDAOMyBatis implements MainDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, Object>> getBestProductList() throws Exception {
		return sqlSession.selectList("mainSQL.getBestProductList");
	}

	@Override
	public List<Map<String, Object>> getTop100Product() throws Exception {
		return sqlSession.selectList("mainSQL.getTop100Product");
	}


	@Override
	public void likeCount(HashMap<String, String> dataMap) throws Exception {
		
		System.out.println(dataMap);
		if (dataMap.get("division").equals("I")) {
			sqlSession.insert("mainSQL.likeInsert", dataMap);
		} else {
			sqlSession.delete("mainSQL.likeDelete", dataMap);
		}
		
		sqlSession.update("mainSQL.likeCount", dataMap);
		
	}

}
