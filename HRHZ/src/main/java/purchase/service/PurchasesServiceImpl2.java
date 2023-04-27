package purchase.service;

import hrhz.dto.CartDTO;
import hrhz.dto.PaymentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import purchase.dao.PurchaseDAO2;

import java.util.List;


@Service
public class PurchasesServiceImpl2 implements PurchaseService2 {
	@Autowired
	PurchaseDAO2 purchaseDAO2;

	@Override
	public List<PaymentDTO> getPaymentInfo(List<PaymentDTO> paymentDTOList) {
		return purchaseDAO2.getPaymentInfo(paymentDTOList);
	}

	@Override
	public List<CartDTO> getCart(String id) {
		return purchaseDAO2.getCart(id);
	}
}
