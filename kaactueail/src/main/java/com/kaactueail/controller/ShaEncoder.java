//package com.kaactueail.controller;
//
//
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
//import org.springframework.stereotype.Service;
//
//@Service
//public class ShaEncoder  {
//	
//	final String salt="xo";
//	
//	@Autowired
//	ShaPasswordEncoder encoder;
//	
//	
//	public String saltEncoding(String str) {
//		return encoder.encodePassword(str, salt);
//	}
//}