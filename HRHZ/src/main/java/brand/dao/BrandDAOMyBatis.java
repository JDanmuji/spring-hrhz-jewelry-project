package brand.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class BrandDAOMyBatis implements BrandDAO {
    @Autowired
    private SqlSession sqlSession;
    
	@Override
	public List<Map<String, Object>> getBrandList(String memberId) {
		return sqlSession.selectList("brandSQL.getBrandList", memberId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getBrandDetail(Map<String, Object> map) {
		return sqlSession.selectList("brandSQL.getBrandDetail", map);
	}

	@Override
	public int getTotalA(Map<String, Object> map) {
		return sqlSession.selectOne("brandSQL.getTotalA", map);
	}
}
