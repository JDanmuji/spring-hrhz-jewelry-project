package member.controller;

import hrhz.dto.GoogleInfResponse;
import hrhz.dto.GoogleRequest;
import hrhz.dto.GoogleResponse;
import member.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import hrhz.dto.NaverDTO;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@PropertySource("classpath:hrhz/conf/login.properties")
public class MemberController {
    @Autowired
    private MemberService memberService;

	//-------------------------------------
	//GOOGLE login api
	@Value("${google.auth.url}")
	private String googleAuthUrl;
	@Value("${google.login.url}")
	private String googleLoginUrl;
	@Value("${google.redirect.url}")
	private String googleRedirectUrl;
	@Value("${google.client.id}")
	private String googleClientId;
	@Value("${google.client.pw}")
	private String googleClientPw;


	@GetMapping(value = "/signUp1")
    public String signUp1(){
        return "/views/member/signUp1";
    }
        
    @PostMapping(value = "/signUp2")
    public String signUp2(@RequestParam String phone, String email, Model model) {
    	model.addAttribute("phone", phone);
		model.addAttribute("email", email);
    	return "/views/member/signUp2";
    }

    @PostMapping(value = "/signUp3")
    public String signUp3(@RequestParam String phone, 
    						@RequestParam(required = false) String emailAlarm,
    						@RequestParam(required = false) String smsAlarm, Model model) {
    	
    	model.addAttribute("phone", phone);
    	model.addAttribute("emailAlarm", emailAlarm);
    	model.addAttribute("smsAlarm", smsAlarm);
    	
    	return "/views/member/signUp3";
    }

    @PostMapping(value = "/signUp/sendSMS")
    @ResponseBody
    public String sendSMS(@RequestParam String phone){

    	String verify = memberService.getMember(phone); // duplicate check
        
        if (verify.equalsIgnoreCase("exist")) {
            return "exist";
        } else {
            Random random = new Random();
            String numStr = "";
            for (int i = 0; i < 6; i++) {
                String ran = Integer.toString(random.nextInt(10));
                numStr += ran;
            }

            memberService.certifiedPhoneNumber(phone, numStr); //send authentication number

            return numStr;
        }
    }


    @PostMapping(value = "/memberInsert")
    @ResponseBody
    public void memberInsert(@RequestParam HashMap<String, Object> dataMap) throws Exception {
    	memberService.memberInsert(dataMap); //send authentication number
        
    }
    
    @PostMapping(value = "/signIn")
    @ResponseBody
    public String signIn(@RequestParam HashMap<String, Object> dataMap, HttpServletRequest request) throws Exception {
    	String result;
    	HttpSession session = request.getSession();

    	String id = memberService.loginCheck(dataMap);  
    	
    	if (id != null) { // 로그인 성공 시
    	   session.setAttribute("sessionId", id);
    	   result = id;
    	} else { // 로그인 실패 시
    	   result = "error";
    	}
        
	    return result;
    }
    
    @GetMapping(value = "/signOut")
    public String signOut(HttpServletRequest request) {
       HttpSession session = request.getSession();
//     session.removeAttribute("sessionId");
     	session.invalidate();
        return "redirect:/";
    }
    
    @RequestMapping(value="/callBack", method=RequestMethod.GET)
    public String callBack(){
    	return "/views/member/callBack";
    }
    
    
    @RequestMapping(value="/naverSave", method=RequestMethod.POST)
	public @ResponseBody String naverSave(@RequestParam("n_age") String n_age, @RequestParam("n_birthday") String n_birthday, 
			@RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, 
			@RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, HttpServletRequest request) {
    	
    	HttpSession session = request.getSession();
    	
    	
	System.out.println("#############################################");
	System.out.println(n_age);
	System.out.println(n_birthday);
	System.out.println(n_email);
	System.out.println(n_gender);
	System.out.println(n_id);
	System.out.println(n_name);
	
	System.out.println("#############################################");

	NaverDTO naver = new NaverDTO();
	naver.setN_age(n_age);
	naver.setN_birthday(n_birthday);
	naver.setN_email(n_email);
	naver.setN_gender(n_gender);
	naver.setN_id(n_id);
	naver.setN_name(n_name);
	
	
	
	String result = memberService.naverloginCheck(naver);
	
    
	// ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
	
    
	if(result!=null) {
		 session.setAttribute("sessionId", result);
  	  // naver가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
		result = "ok";
	} else {
		session.setAttribute("sessionEmail", n_email);
		result ="no";
	}

	return result;
    
	}

	@GetMapping(value="/google")
	public void loginUrlGoogle(HttpServletResponse response) throws IOException {
		String reqUrl = googleLoginUrl + "/o/oauth2/v2/auth?client_id=" + googleClientId
				+ "&redirect_uri="+ googleRedirectUrl + "&response_type=code&scope=email%20profile%20openid&access_type=offline";
		response.sendRedirect(reqUrl);
	}

	@GetMapping(value="/api/v1/oauth2/google")
	public void loginGoogle(@RequestParam(value = "code") String authCode,
							HttpServletRequest request,
							HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();

		RestTemplate restTemplate = new RestTemplate();
		GoogleRequest googleOAuthRequestParam = GoogleRequest
				.builder()
				.clientId(googleClientId)
				.clientSecret(googleClientPw)
				.code(authCode)
				.redirectUri(googleRedirectUrl)
				.grantType("authorization_code").build();
		ResponseEntity<GoogleResponse> resultEntity = restTemplate.postForEntity(googleAuthUrl + "/token",
				googleOAuthRequestParam, GoogleResponse.class);
		String jwtToken=resultEntity.getBody().getId_token();
		Map<String, String> map=new HashMap<>();
		map.put("id_token",jwtToken);
		ResponseEntity<GoogleInfResponse> resultEntity2 = restTemplate.postForEntity(googleAuthUrl+"/tokeninfo",
				map, GoogleInfResponse.class);
		String email=resultEntity2.getBody().getEmail();

		String id = memberService.googleLoginCheck(email);

		if(id == null){
			session.setAttribute("sessionEmail", email);
			response.sendRedirect("/signUp1");
		} else {
			session.setAttribute("sessionId", id);
			response.sendRedirect("/");
		}
	}

	@RequestMapping(value = "/kakao", method = RequestMethod.GET)
	public void kakaoLogin(@RequestParam(value = "code", required = false) String code,
						   HttpServletRequest request,
						   HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		MemberController memberController = new MemberController();
		
		System.out.println("code:" + code);
		
		String access_Token = memberController.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		
		String email = memberController.getUserInfo(access_Token);
		System.out.println("###email#### : " + email);
		
		String id = memberService.kakaoLoginCheck(email);
		if(id == null){
			session.setAttribute("sessionEmail", email);
			response.sendRedirect("/signUp1");
		} else {
			session.setAttribute("sessionId", id);
			response.sendRedirect("/");
		}
	}
	
	public String getAccessToken(String authorize_code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=1105196451a5485acd1247f1de5aa106"); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri=http://localhost:8080/kakao"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {});

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	@SuppressWarnings("unchecked")
	public String getUserInfo(String access_Token) throws Throwable {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		String email = null;

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			System.out.println("result type : " + result.getClass().getName()); // java.lang.String

			try {
				// jackson objectmapper 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});

				System.out.println(jsonMap.get("properties"));

				Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
				Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

				email = kakao_account.get("email").toString();
				System.out.println("email: " + email);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return email;
	}
	@GetMapping(value="/findId1")
	public String findId1() {
		return "/views/member/findId1";
	}
	
	@GetMapping(value="/findId2")
	public String findId2() {
		return "/views/member/findId2";
	}
	
	@GetMapping(value="/findPwd1")
	public String findPwd1() {
		return "/views/member/findPwd1";
	}
	
	@GetMapping(value="/findPwd2")
	public String findPwd2() {
		return "/views/member/findPwd2";
	}
	
	@GetMapping(value="/signIn1")
	public String signIn1() {
		return "/views/member/signIn";
	}
}

