<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="inc/header.jsp"></jsp:include>
<script>
	function check_id(){
		const form = document.getElementById("signup_form");
		const xhr = new XMLHttpRequest();
		xhr.open("GET", "checkId?id="+form.id.value, false);
		xhr.send();
		
		const result = xhr.responseText;
		
		alert(result);
	}
</script>
</head>
<body>
	<div class="container">
		<form id="signup_form" method="post">
			<div>
				<label for="id">아이디:</label>
				<input type="text" id="id" name="id" required="required" autofocus="autofocus"/>
				<button type="button" onclick="check_id()">중복확인</button>
			</div>
			<div>
				<label for="password">비밀번호:</label>
				<input type="text" id="password" name="password" required="required"/>
			</div>
			<div>
				<label for="address">주소:</label>
				<input type="text" id="address" name="address" required="required"/>
			</div>
			<div>
				<label for="tel">전화번호:</label>
				<input type="text" id="tel" name="tel" required="required"/>
			</div>
			<div>
				<button>회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>