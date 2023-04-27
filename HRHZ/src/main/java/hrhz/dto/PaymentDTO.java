package hrhz.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PaymentDTO {
    private String imgPath;
    private String brandCode;
    private String brandName;
    private String productCode;
    private String productName;
    private int productPrice;
    private String optionCode;
    private String detailType;
    private String optionName;
    private int productCnt;
    private int sum;
}
