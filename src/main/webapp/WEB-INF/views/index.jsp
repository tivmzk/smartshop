<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h1 class="navbar-brand fs-2">Smart Shop</h1>
			</div>
		</div>
		<ul class="list-group">
			<li class="list-group-item ">
				<div class="row align-items-end">
					<div class="col-10">
						<h2>제품 관리</h2>
						<p class="lh-lg my-0">
							편하고 빠른 제품 관리
						</p>
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
						<p class="lh-lg my-0">
							누구나 할 수 있는 파트너 관리
						</p>
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
						<p class="lh-lg my-0">
							체계적인 입고 관리
						</p>
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
						<p class="lh-lg my-0">
							간단하게 출고 관리
						</p>
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