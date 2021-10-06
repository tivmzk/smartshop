<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc/header.jsp" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#info').summernote();
	});
</script>
</head>
<body>
	<div class="container vh-100 d-flex align-items-center justify-content-center">
		<form method="post" class="w-50 border p-4 rounded">
			<div class="mb-3">
				<h2>제품 수정</h2>
			</div>
			<div class="mb-5">
				<label class="form-label">제품명</label>
				<input class="form-control" type="text" name="name" required="required" autofocus="autofocus" value="${item.name}">
			</div>
			<div class="my-5">
				<label class="form-label">규격</label>
				<input class="form-control" type="text" name="spec" required="required" value="${item.spec}">
			</div>
			<div class="my-5">
				<label class="form-label">카테고리</label>
				<input class="form-control" type="text" name="category" required="required" value="${item.category}">
			</div>
			<div class="my-5">
				<label class="form-label">제조사</label>
				<input class="form-control" type="text" name="manufacture" required="required" value="${item.manufacture}">
			</div>
			<div class="my-5">
				<label class="form-label">가격</label>
				<input class="form-control" id="price" type="number" name="price" required="required" value="${item.price}">
			</div>
			<div class="my-5">
				<label class="form-label">제품설명</label>
				<textarea class="form-control" id="info" name="info" rows="20" cols="80">${item.info}</textarea>
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