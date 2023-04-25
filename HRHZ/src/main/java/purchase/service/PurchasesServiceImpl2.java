package purchase.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import purchase.dao.PurchaseDAO;


@Service
public class PurchasesServiceImpl2 implements PurchaseService2 {
	@Autowired
	PurchaseDAO purchaseDAO;


}
