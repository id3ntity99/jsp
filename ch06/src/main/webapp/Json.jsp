<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", ()=>{
		const btnUser1 = document.getElementById("btnUser1");
		const user1 = document.querySelector(".user1");
		const span = user1.getElementsByTagName("span");
		btnUser1.onclick = async () => {
			const response = await fetch("./data/user1.jsp");
			const data = await response.json();
			
			span[0].innerText = data.uid;
			span[1].innerText = data.name;
			span[2].innerText = data.hp;
			span[3].innerText = data.addr;
		}
	});
</script>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3. Create JSON</title>
	</head>
	<body>
	<h3>3. Create JSON Data from Server</h3>
	
	<h4>JSON</h4>
	<a href="./data/user1.jsp">user1 요청하기</a>
	<a href="./data/user2.jsp">user2 요청하기</a>
	<a href="./data/users.jsp">users 요청하기</a>
	
	<h4>XML</h4>	
	<a href="./data/xml1.jsp">xml1 요청하기</a>
	<a href="./data/xml2.jsp">xml2 요청하기</a>
	
	<h4>AJAX</h4>
	<button id="btnUser1">Request User1</button>
	<p class="user1">
		<span></span>
		<span></span>
		<span></span>
		<span></span>
	</p>
	</body>
</html>