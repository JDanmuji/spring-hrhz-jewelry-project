package purchase.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hrhz.dto.ProductImageDTO;
import hrhz.dto.ReviewDTO;
import hrhz.dto.ReviewImageDTO;

@Repository
@Transactional
public class PurchaseDAOMyBatis implements PurchaseDAO {
	@Autowired
    private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> getProductDetail(Map<String, String> map) {
		return sqlSession.selectList("purchaseSQL.getProductDetail", map);
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
		int reviewSeq = sqlSession.selectOne("purchaseSQL.getReviewSeq");
		
		// insert review
		reviewDTO.setSeq(reviewSeq);
		if (fileNameList != null) {
			reviewDTO.setImageYN("Y");
		} else {
			reviewDTO.setImageYN("N");	
		}
		
		sqlSession.insert("purchaseSQL.reviewUpload", reviewDTO);
		System.out.println(fileNameList);
		
		if(fileNameList != null) {
			// insert review images
			ReviewImageDTO reviewImageDTO = new ReviewImageDTO();
			reviewImageDTO.setReviewSeq(reviewSeq);
			reviewImageDTO.setImgPath("/storage/review/");
			reviewImageDTO.setRegId(reviewDTO.getMemberId());

			for(String fileName : fileNameList) {
				reviewImageDTO.setImgOriginName(fileName);
				sqlSession.insert("purchaseSQL.reviewImageUpload", reviewImageDTO);
			} //for
		}
	}
}
