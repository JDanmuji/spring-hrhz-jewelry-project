package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hrhz.dto.BrandDTO;

@Repository
@Transactional  
public class AdminDAOMyBatis implements AdminDAO{

    @Autowired
    private SqlSession sqlSession;

	@Override
	public List<Map<String, String>> getMemberList() {
		return sqlSession.selectList("adminSQL.getMemberList");
  }


	@Override
	public void brandMemberInsert(HashMap<String, Object> dataMap) {
		
		sqlSession.insert("adminSQL.brandMemberInsert",dataMap);
		
	}

	@Override
  public Map<String, String> getBrand(String brandCode) {
		return sqlSession.selectOne("adminSQL.getBrand", brandCode);
	}


	@Override
	public void brandUpdateSubmit(Map<String, Object> map) {
		sqlSession.update("adminSQL.brandUpdateSubmit", map);
	}

  @Override
	public List<Map<String, Object>> getBrandList() {
		return sqlSession.selectList("adminSQL.getBrandList");
	}


}
