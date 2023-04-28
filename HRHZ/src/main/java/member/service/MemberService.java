package member.service;


import java.util.HashMap;

import hrhz.dto.NaverDTO;


public interface MemberService {
    public void certifiedPhoneNumber(String phoneNumber, String numStr);

    public String getMember(String phone);

	public void memberInsert(HashMap<String, Object> dataMap) throws Exception;

	public String loginCheck(HashMap<String, Object> dataMap);

	public String naverloginCheck(NaverDTO naver);


	
}
