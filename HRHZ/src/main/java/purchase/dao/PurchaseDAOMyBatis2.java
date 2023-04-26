package purchase.dao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Map;


@Repository
@Transactional
public class PurchaseDAOMyBatis2 implements PurchaseDAO2 {
	@Autowired
    private SqlSession sqlSession;


    @Override
    public void getProductInfo(Map<String, List<Map<String, Object>>> data) {
        for (String key : data.keySet()) {
            String productCode = key;
            List<Map<String, Object>> productList = data.get(key);
            for (Map<String, Object> product : productList) {
                for (String code : product.keySet()) {
                    int count = (int) product.get(code);
                    System.out.println("Code: " + code + ", Count: " + count);
                    if (count > 0){

                    }
                }
            }
        }
    }
}

