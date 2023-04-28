package hrhz.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CartDTO {
    private String detailCode;
    private String detailType;
    private String detailName;
    private String productCode;
    private String productName;
    private String brandCode;
    private String brandName;
    private String imgPath;
    private String memberId;
    private int qty;
    private int price;
}
