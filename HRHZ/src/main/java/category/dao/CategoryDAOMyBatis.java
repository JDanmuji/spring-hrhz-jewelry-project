package category.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CategoryDAOMyBatis implements CategoryDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> getCategoryBestProductList() throws Exception{
		return sqlSession.selectList("categorySQL.getCategoryBestProductList");
	}

	@Override
	public void categorylikeCount(HashMap<String, String> dataMap) {
		System.out.println(dataMap);
		if (dataMap.get("division").equals("I")) {
			sqlSession.insert("categorySQL.categorylikeInsert", dataMap);
		} else {
			sqlSession.delete("categorySQL.categorylikeDelete", dataMap);
		}
		
		sqlSession.update("categorySQL.categorylikeCount", dataMap);
		
	}

}
