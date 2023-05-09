package hrhz.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReviewImageDTO {
	private int seq;
	private int reviewSeq;
	private String imgOriginName;
	private String imgPath;
	private String regId;
	private String modId;
	private String regDate;
	private String modDate;
}
