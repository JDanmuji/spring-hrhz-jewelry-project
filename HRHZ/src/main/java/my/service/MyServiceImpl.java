package my.service;

import hrhz.dto.MemberDTO;
import my.dao.MyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyServiceImpl implements MyService{
    @Autowired
    private MyDAO myDAO;

    @Override
    public MemberDTO getMemberInfo(String id) {
        return  myDAO.getMemberInfo(id);
    }

    @Override
    public String getMember(String id, String password) {
        MemberDTO memberDTO = myDAO.getMember(id, password);
        if(memberDTO == null) return "";
        else return "true";
    }

    @Override
    public void updateNewPwd(String id, String checkPassword) {
        myDAO.updateNewPwd(id, checkPassword);
    }


}
