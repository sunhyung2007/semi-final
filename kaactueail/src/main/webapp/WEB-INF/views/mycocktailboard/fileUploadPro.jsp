<%-- <%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String realPath = ""; // 웹 어플리케이션상의 절대경로
	String savePath = "mycocktail";
	String encType = "UTF-8";
	int maxSize = 1024 * 1024 * 5; // 최대 업로드 파일 크기 - 5MB
	
	// 현재 jsp 페이지의 웹 어플리케이션상의 절대 경로 구함
	 ServletContext context =   getServletContext();
	realPath = context.getRealPath(savePath+"\\");  // upload\
	out.print("realPath is : " + realPath + "<br>");
	
	try{
		
		MultipartRequest multi = new MultipartRequest(
												request,
												realPath,
												maxSize,
												encType,
												new DefaultFileRenamePolicy() );

		
		
		Enumeration params = multi.getParameterNames();
		
		while( params.hasMoreElements() ) {
			String name =(String)params.nextElement(); // 전송되는 파라미터 이름
			String value = multi.getParameter(name);  // 전송되는 파라미터 값
			out.print( name + "  /  "  + value + "<br>");
		} // while end
		
		out.print("<hr>");
		// 전송할 파일 정보를 가져와서 출력함
		Enumeration  files = multi.getFileNames();
		
		while( files.hasMoreElements() ) {
			String name = (String)files.nextElement();
			String fileName = multi.getFilesystemName(name);  //물리적 경로에 있는 이름
			String original = multi.getOriginalFileName(name);  //원래 파일명
			String type = multi.getContentType(name);
			
			File file = multi.getFile(name);
			
			out.print( "파라미터 이름 : " + name + "<br>");
			out.print( "실제 파일 이름 : " + original + "<br>");
			out.print( "저장된 파일  이름 : " + fileName + "<br>");
			out.print( "파일 타입 : " + type + "<br>");
			
			if( file != null ) {
				out.println("크기 : " + file.length() + "<br>");
			}
		} 
		
	} catch(Exception e ) {
		e.printStackTrace();
	}

%>    




 --%>