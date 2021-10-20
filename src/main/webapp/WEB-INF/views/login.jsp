<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="inc/header.jsp"></jsp:include>
</head>
<body>
	<div class="container vh-100 d-flex align-items-center justify-content-center">
		<form method="post" class="w-50 border p-4 rounded">
			<div class="mb-3">
				<label for="">아이디</label>
				<input type="text" name="id" class="form-control" required/>
			</div>
			<div class="mb-5">
				<label for="">비밀번호</label>
				<input type="text" name="password" class="form-control" required/>
			</div>
			<div class="row">
				<div class="col-6">
					<button class="btn btn-primary form-control">로그인</button>
				</div>
				<div class="col-6">
					<a href="." class="btn btn-secondary form-control">돌아가기</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>