<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="inc/header.jsp"></jsp:include>
</head>
<body>
	<div>
		<form method="post">
			<div>
				<label for="">아이디:</label>
				<input type="text" name="id"/>
			</div>
			<div>
				<label for="">비밀번호:</label>
				<input type="text" name="password"/>
			</div>
			<div>
				<button>로그인</button>
			</div>
		</form>
	</div>
</body>
</html>