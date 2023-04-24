package member.service;

import hrhz.dto.MemberDTO;

public interface MemberService {
    void certifiedPhoneNumber(String phoneNumber, String numStr);

    String getMember(String phone);
}
