package member.service;

import hrhz.dto.AES256;
import hrhz.dto.MemberDTO;
import hrhz.dto.NaverDTO;
import member.dao.MemberDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import javax.crypto.Mac;

import javax.crypto.spec.SecretKeySpec;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;


@PropertySource("classpath:hrhz/conf/login.properties")
@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDAO memberDAO;
    @Autowired
    private AES256 aes256;

    //-------------------------------------
    //NAVER login api
    @Value("${sms.accessKey}")
    private String accessKey;
    @Value("${sms.secretKey}")
    private String secretKey;
    @Value("${sms.serviceId}")
    private String serviceId; 
    @Value("${sms.myPhone}")
    private String myPhone;
    @Value("${aes256.key}")
	private String key;    

    private String makeSignature(String url, String timestamp, String method) {
        String space = " ";                    // one space
        String newLine = "\n";                 // new line

        String message = new StringBuilder()
                .append(method)
                .append(space)
                .append(url)
                .append(newLine)
                .append(timestamp)
                .append(newLine)
                .append(accessKey)
                .toString();

        SecretKeySpec signingKey;
        String encodeBase64String;
        try {
            signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);
            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
            encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            encodeBase64String = e.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeyException e) {
            throw new RuntimeException(e);
        }
        return encodeBase64String;
    }

    @Override
    public void certifiedPhoneNumber(String phone, String numStr) {
        String hostNameUrl = "https://sens.apigw.ntruss.com";     		// �샇�뒪�듃 URL
        String requestUrl= "/sms/v2/services/";                   		// �슂泥� URL
        String requestUrlType = "/messages";
        String method = "POST";											// �슂泥� method
        String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
        requestUrl += serviceId + requestUrlType;
        String apiUrl = hostNameUrl + requestUrl;
        System.out.println(apiUrl);

        // JSON �쓣 �솢�슜�븳 body data �깮�꽦
        JSONObject bodyJson = new JSONObject();
        JSONObject toJson = new JSONObject();
        JSONArray toArr = new JSONArray();

        toJson.put("to",phone);						// Mandatory(�븘�닔), messages.to	�닔�떊踰덊샇, -瑜� �젣�쇅�븳 �닽�옄留� �엯�젰 媛��뒫
        toArr.add(toJson);

        bodyJson.put("type","SMS");							// Madantory, 硫붿떆吏� Type (SMS | LMS | MMS), (�냼臾몄옄 媛��뒫)
        bodyJson.put("from",myPhone);					// Mandatory, 諛쒖떊踰덊샇, �궗�쟾 �벑濡앸맂 諛쒖떊踰덊샇留� �궗�슜 媛��뒫
        bodyJson.put("content","HRHZ authentication Number : "+ numStr);	// Mandatory(�븘�닔), 湲곕낯 硫붿떆吏� �궡�슜, SMS: 理쒕� 80byte, LMS, MMS: 理쒕� 2000byte
        bodyJson.put("messages", toArr);					// Mandatory(�븘�닔), �븘�옒 �빆紐⑸뱾 李몄“ (messages.XXX), 理쒕� 1,000媛�

        //String body = bodyJson.toJSONString();
        String body = bodyJson.toString();

        System.out.println(body);

        try {
            URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl,timestamp, method));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());

            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode" +" " + responseCode);
            if(responseCode == 202) { // �젙�긽 �샇異�
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // �뿉�윭 諛쒖깮
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();

            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public String getMember(String phone) {
        MemberDTO memberDTO = memberDAO.getMember(phone);
        System.out.println(memberDTO);
        if(memberDTO == null) { return "non_exist"; }
        else { return "exist"; }
    }

	@Override
	public void memberInsert(HashMap<String, Object> dataMap) {
		
    	String password = dataMap.get("password").toString();
    	
    	//password encode
    	try {
    		aes256.setAlg(key);
			dataMap.put("password", aes256.encrypt(password));
		} catch (Exception e) {
			e.printStackTrace();
		}

		memberDAO.memberInsert(dataMap);
		
	}

	@Override
	public String loginCheck(HashMap<String, Object> dataMap) {

		String password = dataMap.get("password").toString();
    	
    	//password encode
    	try {
    		aes256.setAlg(key);
    		
			dataMap.put("password", aes256.encrypt(password));
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    	
		return memberDAO.loginCheck(dataMap);
	}

	@Override
	public String naverloginCheck(NaverDTO naver) {
		String email = naver.getN_email();
		return memberDAO.snsLoginCheck(email);
	}

    @Override
    public String googleLoginCheck(String email) {
        return memberDAO.snsLoginCheck(email);
    }

	@Override
	public String kakaoLoginCheck(String email) {
		return memberDAO.snsLoginCheck(email);
	}


}

