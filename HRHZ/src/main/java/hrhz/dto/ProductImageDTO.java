package hrhz.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductImageDTO {
    private String seq;
    private String productCode;
    private String imgOriginName;
    private String imgServerName;
    private String imgPath;
    private String thumbnailYn;
    private String regId;
    private String modId;
    private String regDate;
    private String modDate;
}
