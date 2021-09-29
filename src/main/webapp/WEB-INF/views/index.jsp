<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스마트 SHOP</title>
<jsp:include page="inc/header.jsp"></jsp:include>
</head>
<body>
	<div class="container-fluid">
		<div class="navbar navbar-expand-md navbar-dark bg-dark">
			<div class="container-fluid">
				<div class="py-2">
					<h1 class="navbar-brand fs-2">Smart Shop</h1>
				</div>
				<div class="d-flex align-items-center">
					<c:if test="${sessionScope.member != null}">
						<div class="text-light me-3 d-flex flex-column">
							<span class="p-1"><span class="text-info">${sessionScope.member.id}</span>님 환영합니다</span>
							<div>
								<span class="bg-secondary rounded p-1">${sessionScope.member.address}</span>
								<span class="bg-secondary rounded p-1">${sessionScope.member.tel}</span>
							</div>
						</div>
						<div class="text-end">
							<a class="btn btn-primary" href="logout">로그아웃</a>
						</div>
					</c:if>
					<c:if test="${sessionScope.member == null}">
						<div class="text-end">
							<a class="btn btn-primary" href="login">로그인</a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<ul class="list-group">
			<li class="list-group-item ">
				<div class="row align-items-end">
					<div class="col-10">
						<h2>제품 관리</h2>
						<p class="lh-lg my-0">편하고 빠른 제품 관리</p>
					</div>
					<div class="col-2 text-center">
						<a class="btn btn-primary" href="product/">바로가기</a>
					</div>
				</div>
			</li>
			<li class="list-group-item ">
				<div class="row align-items-end">
					<div class="col-10">
						<h2>거래처 관리</h2>
						<p class="lh-lg my-0">누구나 할 수 있는 파트너 관리</p>
					</div>
					<div class="col-2 text-center">
						<a class="btn btn-primary" href="partner/">바로가기</a>
					</div>
				</div>
			</li>
			<li class="list-group-item ">
				<div class="row align-items-end">
					<div class="col-10">
						<h2>입고 관리</h2>
						<p class="lh-lg my-0">체계적인 입고 관리</p>
					</div>
					<div class="col-2 text-center">
						<a class="btn btn-primary" href="purchase/">바로가기</a>
					</div>
				</div>
			</li>
			<li class="list-group-item ">
				<div class="row align-items-end">
					<div class="col-10">
						<h2>출고 관리</h2>
						<p class="lh-lg my-0">간단하게 출고 관리</p>
					</div>
					<div class="col-2 text-center">
						<a class="btn btn-primary" href="sales/">바로가기</a>
					</div>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>