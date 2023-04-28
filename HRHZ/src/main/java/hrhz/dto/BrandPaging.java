package hrhz.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter @Setter
public class BrandPaging {
	private int currentPage;
	private int pageBlock;
	private int pageSize;
	private int totalA;
	private StringBuffer pagingHTML;
	
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA + pageSize-1) / pageSize;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage>totalP) endPage = totalP;
		
		if(startPage != 1) {
			pagingHTML.append("<span class='prePage' onclick='brandPaging(" + (startPage-1) +")'> < </span>");
		}
		
		for(int i=startPage; i<=endPage; i++) {
			
			if(i==currentPage) {
				pagingHTML.append("<span class='currentPage' onclick='brandPaging(" + i +")'> "+ i +" </span>");
			}
			else {
				pagingHTML.append("<span class='page' onclick='brandPaging(" + i +")'> "+ i +" </span>");
			}
		}
		if(endPage < totalP) {
			pagingHTML.append("<span class='afterPage' onclick='brandPaging("  + (endPage+1) +")'> > </span>");
			
		}
	}
}
