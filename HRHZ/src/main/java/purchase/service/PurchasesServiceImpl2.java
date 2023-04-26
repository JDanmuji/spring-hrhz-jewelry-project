package purchase.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import purchase.dao.PurchaseDAO2;

import java.util.List;
import java.util.Map;


@Service
public class PurchasesServiceImpl2 implements PurchaseService2 {
	@Autowired
	PurchaseDAO2 purchaseDAO2;


	@Override
	public void getProductInfo(Map<String, List<Map<String, Object>>> data) {
		purchaseDAO2.getProductInfo(data);
	}
}
