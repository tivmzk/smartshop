<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc/header.jsp"></jsp:include>
</head>
<body>
	<div class="container d-flex align-items-center justify-content-center">
		<div class="w-50 border p-4 rounded">
			<div class="mb-5">
				<label class="form-label">제품번호</label>
				<span class="form-control">${item.code}</span>
			</div>
			<div class="my-5">
				<label class="form-label">제품명:</label>
				<span class="form-control">${item.name}</span>
			</div>
			<div class="my-5">
				<label class="form-label">규격:</label>
				<span class="form-control">${item.spec}</span>
			</div>
			<div class="my-5">
				<label class="form-label">카테고리:</label>
				<span class="form-control">${item.category}</span>
			</div>
			<div class="my-5">
				<label class="form-label">제조자:</label>
				<span class="form-control">${item.manufacture}</span>
			</div>
			<div class="my-5">
				<label class="form-label">가격:</label>
				<span class="form-control">${item.price}</span>
			</div>
			<div class="my-5">
				<label class="form-label">설명:</label>
				<span class="form-control">${item.info}</span>
			</div>
			<div class="mb-5">
				<span class="form-label">현재 제품 이미지</span>
				<ul class="list-group">
					<c:if test="${item.images == null || item.images.size() < 1 }">
						<li class="list-group-item">등록 된 제품이미지가 없습니다</li>
					</c:if>
					<c:forEach items="${item.images}" var="image">
						<li class="list-group-item my-3">
							<a href="/upload/${image.uuid}_${image.filename}" target="_blank">
								<img alt="${image.filename}" src="/upload/${image.uuid}_${image.filename}" class="img-thumbnail">
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div>
				<a class="btn btn-primary form-control" href="..">돌아가기</a>
			</div>
		</div>
	</div>
</body>
</html>