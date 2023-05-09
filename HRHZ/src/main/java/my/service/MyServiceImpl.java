package my.service;

import hrhz.dto.AES256;
import hrhz.dto.MemberDTO;
import my.dao.MyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

@PropertySource("classpath:hrhz/conf/login.properties")
@Service
public class MyServiceImpl implements MyService{
    @Autowired
    private MyDAO myDAO;
    @Autowired
    private AES256 aes256;
    @Value("${aes256.key}")
    private String key;

    @Override
    public MemberDTO getMemberInfo(String id) {
        return  myDAO.getMemberInfo(id);
    }

    @Override
    public String getMember(String id, String password) {
        String encodingPwd = "";
        //password encode
        try {
            aes256.setAlg(key);

            encodingPwd =  aes256.encrypt(password);
        } catch (Exception e) {
            e.printStackTrace();
        }

        MemberDTO memberDTO = myDAO.getMember(id, encodingPwd);
        if(memberDTO == null) return "";
        else return "true";
    }

    @Override
    public void updateNewPwd(String id, String checkPassword) {
        String encodingNewPwd = "";
        //password encode
        try {
            aes256.setAlg(key);

            encodingNewPwd =  aes256.encrypt(checkPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        myDAO.updateNewPwd(id, encodingNewPwd);
    }

    @Override
    public void deleteMember(String id) {
        myDAO.deleteMember(id);
    }

    @Override
    public void updateMember(MemberDTO memberDTO) {
        if(memberDTO.getSmsAlarm() != null) {
            if ("on".equals(memberDTO.getSmsAlarm())) memberDTO.setSmsAlarm("Y");
        } else memberDTO.setSmsAlarm("N");
        if(memberDTO.getEmailAlarm() != null) {
            if ("on".equals(memberDTO.getEmailAlarm())) memberDTO.setEmailAlarm("Y");
        } else memberDTO.setEmailAlarm("N");

        myDAO.updateMember(memberDTO);
    }

}
