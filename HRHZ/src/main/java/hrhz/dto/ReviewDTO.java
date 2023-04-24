package hrhz.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReviewDTO {
	private int seq;
	private String productCode;
	private String brandCode;
	private String memberId;
	private String content;
	private int like;
	private String regDate;
	private String modDate;
}
