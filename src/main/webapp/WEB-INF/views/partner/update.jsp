<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc/header.jsp" />
</head>
<body>
	<div class="container vh-100 d-flex align-items-center justify-content-center">
		<form method="post" class="w-50 border p-4 rounded">
			<div class="mb-3">
				<h2>거래처 수정</h2>
			</div>
			<div class="mb-5">
				<label class="form-label">거래처</label>
				<input class="form-control" type="text" name="name" required="required" autofocus="autofocus" value="${item.name}">
			</div>
			<div class="my-5">
				<label class="form-label">전화번호</label>
				<input class="form-control" type="tel" name="tel" required="required" value="${item.tel}">
			</div>
			<div class="my-5">
				<label class="form-label">주소</label>
				<input class="form-control" type="text" name="address" required="required" value="${item.address}">
			</div>
			<div class="row">
				<div class="col-6">
					<button class="btn btn-primary form-control">확인</button>
				</div>
				<div class="col-6">
					<a class="btn btn-dark form-control" href="..">취소</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>