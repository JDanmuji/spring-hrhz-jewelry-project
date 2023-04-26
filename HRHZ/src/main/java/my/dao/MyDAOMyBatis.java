package my.dao;

import hrhz.dto.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Repository
@Transactional
public class MyDAOMyBatis implements MyDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public MemberDTO getMemberInfo(String id) {
        return sqlSession.selectOne("mySQL.getMemberInfo",id);
    }

    @Override
    public MemberDTO getMember(String id, String password) {
        Map<String , String> parameter = new HashMap<>();
        parameter.put("id", id);
        parameter.put("password", password);

        return sqlSession.selectOne("mySQL.getMember", parameter);
    }

    @Override
    public void updateNewPwd(String id, String checkPassword) {
        Map<String , String> parameter = new HashMap<>();
        parameter.put("id", id);
        parameter.put("password", checkPassword);

        sqlSession.selectOne("mySQL.updateNewPwd",parameter);
    }

    @Override
    public void deleteMember(String id) {
        sqlSession.selectOne("mySQL.deleteMember",id);
    }

    @Override
    public void updateMember(MemberDTO memberDTO) {
        sqlSession.update("mySQL.updateMember", memberDTO);
    }
}
