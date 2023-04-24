package purchase.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hrhz.dto.ProductImageDTO;
import hrhz.dto.ReviewDTO;

@Repository
@Transactional
public class PurchaseDAOMyBatis implements PurchaseDAO {
	@Autowired
    private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> getProductDetail(String productCode) {
		return sqlSession.selectList("purchaseSQL.getProductDetail", productCode);
	}

	@Override
	public List<Map<String, Object>> getProductImages(String productCode) {
		return sqlSession.selectList("purchaseSQL.getProductImages", productCode);
	}

	@Override
	public List<Map<String, Object>> getProductReviews(String productCode) {
		return sqlSession.selectList("purchaseSQL.getProductReviews", productCode);
	}

	@Override
	public void reviewUpload(ReviewDTO reviewDTO, List<String> fileNameList) {

		sqlSession.insert("purchaseSQL.reviewUpload", reviewDTO);
		
		// review와 이미지 시퀀스가 따로 가야 하므로 새 테이블 만들어야 할 것 같음
//		for(String fileName : fileNameList) {
//			reviewDTO.setImgName(fileName);
//			sqlSession.insert("purchaseSQL.reviewUpload", reviewDTO);
//		}//for
	}
}
