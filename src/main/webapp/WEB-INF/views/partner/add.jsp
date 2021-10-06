<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc/header.jsp" flush="false"/>
</head>
<body>
	<div class="container vh-100 d-flex align-items-center justify-content-center">
		<form method="post" class="w-50 border p-4 rounded">
			<div class="mb-3">
				<h2>거래처 등록</h2>
			</div>
			<div class="form-floating mb-5">
				<input class="form-control" id="name" type="text" name="name" required="required" autofocus="autofocus" placeholder="name">
				<label for="name">거래처</label>
			</div>
			<div class="form-floating my-5">
				<input class="form-control" id="tel" type="tel" name="tel" required="required" placeholder="tel">
				<label for="tel">전화번호</label>
			</div>
			<div class="form-floating my-5">
				<input class="form-control" id="address" type="text" name="address" required="required" placeholder="address">
				<label for="address">주소</label>
			</div>
			<div class="row">
				<div class="col-6">
					<button class="btn btn-primary form-control">등록</button>
				</div>
				<div class="col-6">
					<a class="btn btn-dark form-control" href=".">취소</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>