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

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getCategoryBestProductList(Map<String, Integer> map) throws Exception{
		return sqlSession.selectList("categorySQL.getCategoryBestProductList", map);
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

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("categorySQL.getTotalA");
	}


	@Override
	public List<Map<String, Object>> CategoryColorList(List<String> colorArr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("colorArr", colorArr);
		return sqlSession.selectList("categorySQL.getCategoryBestProductList", map);
	}


	
}
