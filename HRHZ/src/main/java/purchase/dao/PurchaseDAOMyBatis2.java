package purchase.dao;

import hrhz.dto.CartDTO;
import hrhz.dto.MemberDTO;
import hrhz.dto.PaymentDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Repository
@Transactional
public class PurchaseDAOMyBatis2 implements PurchaseDAO2 {
	@Autowired
    private SqlSession sqlSession;

    @Override
    public List<PaymentDTO> getPaymentInfo(List<PaymentDTO> paymentDTOList) {
        List<PaymentDTO> list = new ArrayList<>();

        for(PaymentDTO paymentDTO : paymentDTOList){
            PaymentDTO dto = sqlSession.selectOne("purchaseSQL2.getPaymentInfo",paymentDTO);
            list.add(dto);
        }
        return list;
    }

    @Override
    public List<CartDTO> getCart(String id) {
        return sqlSession.selectList("purchaseSQL2.getCart", id);
    }

    @Override
    public MemberDTO getMember(String id) {
        return sqlSession.selectOne("purchaseSQL2.getMember", id);
    }
}

