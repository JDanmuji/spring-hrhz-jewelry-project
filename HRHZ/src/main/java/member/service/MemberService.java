package member.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import hrhz.dto.MemberDTO;

public interface MemberService {
    public void certifiedPhoneNumber(String phoneNumber, String numStr);

    public String getMember(String phone);

	public void memberInsert(HashMap<String, Object> dataMap) throws Exception;

	public String loginCheck(HashMap<String, Object> dataMap);
}
