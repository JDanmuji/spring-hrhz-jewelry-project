package member.dao;

import java.util.HashMap;

import hrhz.dto.MemberDTO;

public interface MemberDAO {

    public MemberDTO getMember(String phone);

	public void memberInsert(HashMap<String, Object> dataMap);
}
