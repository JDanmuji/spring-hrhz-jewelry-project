package main.service;

import hrhz.dto.MemberDTO;
import main.dao.MainDAO;
import member.dao.MemberDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import purchase.dao.PurchaseDAO;

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
import java.util.List;
import java.util.Map;


@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public List<Map<String, Object>> getBestProductList() throws Exception {
		return mainDAO.getBestProductList();
	}

	@Override
	public List<Map<String, Object>> getTop100Product() throws Exception {
		return mainDAO.getTop100Product();
	}

	@Override
	public void likeCount(HashMap<String, String> dataMap) throws Exception {
		mainDAO.likeCount(dataMap);
		
	}
    



}

