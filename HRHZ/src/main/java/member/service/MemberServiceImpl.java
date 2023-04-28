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
    
    @Value("${sms.accessKey}")
    private String accessKey;   // 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키
    @Value("${sms.secretKey}")
    private String secretKey;    // 2차 인증을 위해 서비스마다 할당되는 service secret key
    @Value("${sms.serviceId}")
    private String serviceId;   // 프로젝트에 할당된 SMS 서비스 ID
    @Value("${sms.myPhone}")
    private String myPhone;
    @Value("${aes256.key}")
	private String key;    //key는 16자 이상

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
        String hostNameUrl = "https://sens.apigw.ntruss.com";     		// 호스트 URL
        String requestUrl= "/sms/v2/services/";                   		// 요청 URL
        String requestUrlType = "/messages";
        String method = "POST";											// 요청 method
        String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
        requestUrl += serviceId + requestUrlType;
        String apiUrl = hostNameUrl + requestUrl;
        System.out.println(apiUrl);

        // JSON 을 활용한 body data 생성
        JSONObject bodyJson = new JSONObject();
        JSONObject toJson = new JSONObject();
        JSONArray toArr = new JSONArray();

        toJson.put("to",phone);						// Mandatory(필수), messages.to	수신번호, -를 제외한 숫자만 입력 가능
        toArr.add(toJson);

        bodyJson.put("type","SMS");							// Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
        bodyJson.put("from",myPhone);					// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능
        bodyJson.put("content","AMONDZ 인증번호 : "+ numStr);	// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
        bodyJson.put("messages", toArr);					// Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개

        System.out.println("확인확인확인2");
        System.out.println("myPhone");

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
            if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
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
		return memberDAO.naverloginCheck(naver);
	}



}

