package my.dao;

import hrhz.dto.MemberDTO;

public interface MyDAO {

    MemberDTO getMemberInfo(String id);

    MemberDTO getMember(String id, String password);

    void updateNewPwd(String id, String checkPassword);
}
