package my.service;

import hrhz.dto.MemberDTO;

public interface MyService {

    MemberDTO getMemberInfo(String id);

    String getMember(String id, String password);

    void updateNewPwd(String id, String checkPassword);
}
