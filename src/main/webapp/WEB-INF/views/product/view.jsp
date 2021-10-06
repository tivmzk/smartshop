<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc/header.jsp"></jsp:include>
</head>
<body>
	<div>
		<div>
			<label for="">제품번호:</label>
			<span>${item.code}</span>
		</div>
		<div>
			<label for="">제품명:</label>
			<span>${item.name}</span>
		</div>
		<div>
			<label for="">규격:</label>
			<span>${item.spec}</span>
		</div>
		<div>
			<label for="">카테고리:</label>
			<span>${item.category}</span>
		</div>
		<div>
			<label for="">제조자:</label>
			<span>${item.manufacture}</span>
		</div>
		<div>
			<label for="">가격:</label>
			<span>${item.price}</span>
		</div>
		<div>
			<label for="">설명:</label>
			<span>${item.info}</span>
		</div>
		<div>
			<a href="..">돌아가기</a>
		</div>
	</div>
</body>
</html>