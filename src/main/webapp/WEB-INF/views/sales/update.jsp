<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc/header.jsp" />
</head>
<body>
	<div class="container vh-100 d-flex align-items-center justify-content-center">
		<form method="post" class="w-50 border p-4 rounded">
			<div class="mb-3">
				<h2>출구 수정</h2>
			</div>
			<div class="mb-5">
				<label for="product">제고명</label>
				<select id="product" name="product" class="form-select">
					<c:forEach var="stock" items="${stockList}">
						<option value="${stock.code}" ${item.product == stock.code ? 'selected' : ''}>${stock.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="my-5">
				<label for="partner">거래처명</label>
				<select name="partner" id="partner" class="form-select">
					<c:forEach var="partner" items="#{partnerList}">
						<option value="${partner.code}" ${item.partner == partner.code ? 'selected' : ''}>${partner.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="my-5">
				<label for="amount">수량</label>
				<input class="form-control" id="amount" type="number" name="amount" required="required" value="${item.amount}">
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