package category.dao;

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
	public List<Map<String, Object>> getCategoryBestProductList() {
		return sqlSession.selectList("categorySQL.getCategoryBestProductList");
	}

}
