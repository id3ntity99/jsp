<%@page import="org.apache.commons.fileupload2.core.DiskFileItem"%>
<%@page import="java.util.UUID"%>
<%@page import="java.nio.file.Path"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletFileUpload"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파일 업로드 - 디렉터리 경로 설정
	String uploadPath = application.getRealPath("/uploads");
	
	// 디렉터리 생성
	File uploadDir = new File(uploadPath); //PATH = .metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ch07/uploads
	
	if (!uploadDir.exists()) {
	  uploadDir.mkdir();
	}
	
	// 파일 업로드 처리 객체 생성
	
	DiskFileItemFactory factory = DiskFileItemFactory.builder().get();
	JakartaServletFileUpload<DiskFileItem, DiskFileItemFactory> upload = new JakartaServletFileUpload<>(factory);
	
	// 최대 업로드 파일 크기 설정
	upload.setSizeMax(1024 * 1024 * 10); // 1024 bits (= 1 byte) * 1024 bytes (10 bytes) * 10 = 10 MB
	
	/**
	multipart/form-data는 form 데이터를 기존과 다른 방식으로 전송한다.
	기존에 form을 이용하여 POST request를 전송할 때에는 request body에 form data를 &로 구분지어 전송했다. 예를 들어,
	"uid=abc123&name=John"과 같은 방식으로 말이다.
	하지만 파일을 전송할 때에는 Content-Disposition: form-data;name="uid"와 boundary가 사용된다.
	
	아래의 List<FileItem>의 첫번째와 두번째 FileItem은 null로 할당된다.
	추측컨대, 실제 파일의 binary data가 아닌 form-data를 가진 데이터를 수신받았기에 
	FileItem 객체를 만들지 않고 null을 리스트에 할당한 것으로 보인다
	*/
	
	// 파일 업로드 스트림 작업
	try {
	  
	  List<DiskFileItem> items= upload.parseRequest(request);
	  Iterator<DiskFileItem> iter = items.iterator();
	  
	  while(iter.hasNext()) {
	  	DiskFileItem item = iter.next();  
	  	if (!item.isFormField()) {
	  	 	String fileName = item.getName();
	  	 	int idx = fileName.lastIndexOf(".");
	  	 	String ext = fileName.substring(idx);
	  	 	
	  	 	String savedFileName = UUID.randomUUID().toString() + ext;
	  	 	item.write(Path.of(uploadPath, savedFileName));
	  	} 
	  }
	} catch (Exception e ) {
	  e.printStackTrace();
	}
	response.sendRedirect("../FileUpload.jsp");
%>