package purchase.controller;

import hrhz.dto.PaymentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import purchase.service.PurchaseService2;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="purchase")
public class PurchaseController2 {
    @Autowired
    private PurchaseService2 purchaseService2;

    @PostMapping("/getPaymentInfo")
    @ResponseBody
    public List<PaymentDTO> getPaymentInfo(@RequestBody Map<String, List<Map<String, Object>>> data) {
        List<PaymentDTO> paymentDTOList = new ArrayList<>(); // PaymentDTO 객체들을 담을 리스트 생성

        for (String productCode : data.keySet()) {
            List<Map<String, Object>> productList = data.get(productCode);
            for (Map<String, Object> product : productList) {

                String optionCode = (String) product.get("optionCode"); // product detail code
                int productCount = (int) product.get("productCount");

                if(productCount > 0) {
                    PaymentDTO paymentDTO = new PaymentDTO(); // PaymentDTO 객체 생성

                    paymentDTO.setProductCode(productCode);
                    paymentDTO.setOptionCode(optionCode);
                    paymentDTO.setProductCnt(productCount);

                    paymentDTOList.add(paymentDTO); // 리스트에 PaymentDTO 객체 추가
                }
            }
        }
        System.out.println(paymentDTOList);
        // 서비스 파일에 PaymentDTO 리스트 전달
        return purchaseService2.getPaymentInfo(paymentDTOList);
    }
}
