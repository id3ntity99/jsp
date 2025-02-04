<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.request</title>
	<!-- 
		날짜: 2025/02/04
		이름: 이현민
		내용: JSP 내장객체 request
		
		request:
			- 클라이언트의 요청 정보를 갖는 객체
			- 클라이언트가 보낸 데이터를 처리하기위한 기능 제공(e.g. getParameter)
		
		GET HTTP method
			- 가장 기본적인 방법. 클라이언트는 이 메서드를 이용해 서버로부터 데이터를 가져옴
			- 전송되는 데이터가 URL의 qurey에 의해 노출되므로 보안에 취약하지만 POST 보다 빠름
		POST HTTP method
			- 전송 데이터를 request 요청 객체 내의 body에 저장해서 전송
			- 전송 데이터가 주소에 노출되지 않기 때문에 보안에 유리
	 -->
</head>

<body>
	<h3>1.request 내장객체</h3>		
	
	<h4>GET 방식 데이터 전송</h4>
	<form action="./proc/result1.jsp" method="get">
		<input type="text" name="uid"> <br>	
		<input type="text" name="name"> <br>	
		<input type="number" name="age"> <br>	
		<input type="submit" value="전송"> <br>	
	</form>
	
	<h4>POST 방식 데이터 전송</h4>
	<form action="./proc/result1.jsp" method="post">
		<input type="text" name="uid"><br>
		<input type="text" name="name"><br>
		<input type="number" name="age"><br>
		<input type="submit" value="전송"><br>
	</form>
	
	<h4>확인문제</h4>
	<form action="./proc/result2.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="uid" placeholder="아이디 입력">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pass" placeholder="비밀번호 입력">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" placeholder="비밀번호 입력">
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="date" name="birth" placeholder="날짜 선택">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label>
						<input type="radio" name="gender" value="M">
						남
					</label>
					<label>
						<input type="radio" name="gender" value="F">
						여
					</label>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<select name="addr">
						<option>서울</option>
						<option>대전</option>
						<option>대구</option>
						<option>부산</option>
						<option>광주</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<label>
						<input type="checkbox" name="hobby" value="등산">
						등산
					</label>
					<label>
						<input type="checkbox" name="hobby" value="독서">
						독서
					</label>
					<label>
						<input type="checkbox" name="hobby" value="영화">
						영화
					</label>
					<label>
						<input type="checkbox" name="hobby" value="운동">
						운동
					</label>
					<label>
						<input type="checkbox" name="hobby" value="게임">
						게임
					</label>
				</td>
			</tr>
			<tr> 
				<td colspan="2" align="right">
					<input type="submit" value="전송">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>