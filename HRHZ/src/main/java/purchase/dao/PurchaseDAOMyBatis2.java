package purchase.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;


@Repository
@Transactional
public class PurchaseDAOMyBatis2 implements PurchaseDAO2 {
	@Autowired
    private SqlSession sqlSession;


}
