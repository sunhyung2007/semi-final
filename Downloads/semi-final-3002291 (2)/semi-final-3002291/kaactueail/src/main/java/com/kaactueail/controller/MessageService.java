package com.kaactueail.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MessageService {
	
	public void sendMessage(HttpServletRequest request, String randomNumber) {
		String api_key = "NCS6XO7WBZ8GO1OU";
		String api_secret = "XO3WJAXGRXGMMZVCJGAUBQNMKXXRFVOI";
		
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String,String>();
		String mTel = request.getParameter("mTel");
		params.put("to", mTel);
		params.put("from", "01099915569");
		params.put("type", "SMS");
		params.put("text", "[Ka Ac Tueail] 본인확인 인증번호 (" + randomNumber + ") 를 입력하세요.");
		params.put("app_version", "JAVA SDK v2.2");
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
	}
	
}
