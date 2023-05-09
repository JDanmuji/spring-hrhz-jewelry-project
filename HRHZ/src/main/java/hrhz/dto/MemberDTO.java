package hrhz.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Getter @Setter
public class MemberDTO {
    private String id;
    private String email;
    private String phone;
    private String password;
    private String name;
    private String gender;
    private String date;
    private String joinPath;
    private String delFlag;
    private String delDate;
    private String regDate;
    private String modDate;
    private String smsAlarm;
    private String emailAlarm;
}
