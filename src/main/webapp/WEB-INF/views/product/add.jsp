<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../inc/header.jsp" flush="false"/>
</head>
<body>
	<div class="container vh-100 d-flex align-items-center justify-content-center">
		<form method="post" class="w-50 border p-4 rounded">
			<div class="mb-3">
				<h2>제품 등록</h2>
			</div>
			<div class="form-floating mb-5">
				<input class="form-control" id="name" type="text" name="name" required="required" autofocus="autofocus" placeholder="name">
				<label for="name">제품명</label>
			</div>
			<div class="form-floating my-5">
				<input class="form-control" id="spec" type="text" name="spec" required="required" placeholder="spec">
				<label for="spec">규격</label>
			</div>
			<div class="form-floating my-5">
				<input class="form-control" id="category" type="text" name="category" required="required" placeholder="category">
				<label for="category">카테고리</label>
			</div>
			<div class="form-floating my-5">
				<input class="form-control" id="manufacture" type="text" name="manufacture" required="required" placeholder="manufacture">
				<label for="manufacture">제조사</label>
			</div>
			<div class="form-floating my-5">
				<input class="form-control" id="price" type="number" name="price" required="required" placeholder="0">
				<label for="price">가격</label>
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