<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form id="target" action="/ch09/test.do" method="get">
			<input type="submit" value="Submit">
			<script type="text/javascript">
				let t = document.getElementById("target")
				t.addEventListener("submit", (event) => {
					event.preventDefault();
				});
			</script>
		</form>		
	</body>
</html>