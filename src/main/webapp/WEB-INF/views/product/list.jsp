<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<jsp:include page="../inc/header.jsp" flush="false"/>
</head>
<body>
	<div class="container-fluid">
		<div class="navbar navbar-expand-md navbar-dark bg-dark">
			<div class="container-fluid">
				<h1 class="navbar-brand fs-2">제품 목록</h1>
				<form method="get" class="px-2">
					<div class="row g-3">
						<div class="col-auto">
							<select name="search" class="form-select">
								<option value="0">검색항목</option>
								<option value="1" ${pager.search == 1 ? 'selected' : ''}>제품번호</option>
								<option value="2" ${pager.search == 2 ? 'selected' : ''}>제품명</option>
								<option value="3" ${pager.search == 3 ? 'selected' : ''}>규격</option>
								<option value="4" ${pager.search == 4 ? 'selected' : ''}>카테고리</option>
								<option value="5" ${pager.search == 5 ? 'selected' : ''}>제조사</option>
							</select>
						</div>
						<div class="col-auto">
							<input class="form-control" type="text" name="keyword" placeholder="search..." value="${pager.keyword}">
						</div>
						<div class="col-auto">
							<button class="btn btn-outline-success" type="submit">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div>
			<table class="table table-striped">
				<thead>
					<tr class="text-center">
						<td>제품번호</td>
						<td>제품명</td>
						<td>규격</td>
						<td>카테고리</td>
						<td>제조사</td>
						<td>가격</td>
						<td>관리</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="item">
						<tr class="text-center lh-lg my-0">
							<td>${item.code}</td>
							<td>${item.name}</td>
							<td>${item.spec}</td>
							<td>${item.category}</td>
							<td>${item.manufacture}</td>
							<td><fmt:formatNumber value="${item.price}" /></td>
							<td><a href="delete/${item.code}" class="btn btn-danger">삭제</a> <a href="update/${item.code}" class="btn btn-info">수정</a></td>
						</tr>
					</c:forEach>
					<c:if test="${list.size() == 0}">
						<tr class="text-center">
							<td colspan="7">등록 된 제품이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7" >
							<div class="pagination justify-content-center">
								<div class="page-item ${pager.page==1?'disabled':''}"><a class="page-link" href="?page=1&${pager.query}">&lt;&lt;</a></div>
								<div class="page-item ${pager.page==1?'disabled':''}"><a class="page-link" href="?page=${pager.prev}&${pager.query}">&lt;</a></div>
								
								<c:forEach items="${pager.list}" var="page">
									<div class="page-item ${page==pager.page?'active':''}"><a class="page-link" href="?page=${page}&${pager.query}">${page}</a></div>
								</c:forEach>
								
								<div class="page-item ${pager.page==pager.end?'disabled':''}"><a class="page-link" href="?page=${pager.next}&${pager.query}">&gt;</a></div>
								<div class="page-item ${pager.page==pager.end?'disabled':''}"><a class="page-link" href="?page=${pager.end}&${pager.query}">&gt;&gt;</a></div>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div>
			<div class="row">
				<div class="col-3">
					<a href="add" class="btn btn-primary form-control">등록</a>
				</div>
				<div class="col-3">
					<a href="dummy" class="btn btn-warning form-control">대량 등록</a>
				</div>
				<div class="col-3">
					<a href="init" class="btn btn-danger form-control">초기화</a>
				</div>
				<div class="col-3">
					<a href=".." class="btn btn-secondary form-control">돌아가기</a>
				</div>
			</div>
		</div>
	</div>
	
	
	
<!-- 	<script type="text/javascript">
	    let list = $('.price');
	    
	    for(let i = 0; i < list.length; i++){
	    	let value = parseInt(list[i].innerText);
	    	list[i].innerText = value.toLocaleString('ko-KR');
	    }
	</script> -->
</body>
</html>