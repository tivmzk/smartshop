<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<ul>
				<c:if test="${item.images == null || item.images.size() < 1 }">
					<li>등록 된 제품이미지가 없습니다</li>
				</c:if>
				<c:forEach items="${item.images}" var="image">
					<li><a href="/upload/${image.uuid}_${image.filename}" target="_blank"><img alt="${image.filename}" src="/upload/${image.uuid}_${image.filename}"></a></li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<a href="..">돌아가기</a>
		</div>
	</div>
</body>
</html>