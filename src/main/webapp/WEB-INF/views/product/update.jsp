<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc/header.jsp" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
	function deleteSelf(){
		$(this).parent('div').parent('div').remove();
	}
	function createItem(){
		const wrapper = $('<div>').addClass('row align-items-center justify-content-between');
		const inputWrapper = $('<div>').addClass('col-11');
		const btnWrapper = $('<div>').addClass('col-1 text-center');
		const input = $('<input>').addClass('form-control mb-1').attr({'type':'file', 'name':'productImage'});
		const btn = $('<button>').addClass('btn btn-danger btn-sm').attr({'type':'button'}).text('X');
		
		btn.click(deleteSelf);
		
		inputWrapper.append(input);
		btnWrapper.append(btn);
		
		wrapper.append(inputWrapper);
		wrapper.append(btnWrapper);
		
		return wrapper;
	}
	$(function(){
		$('#info').summernote();
		
		$('#add_image').click(function(){
			$('#input_container').append(createItem());
		});
	}); 
</script>
</head>
<body>
	<div class="container d-flex align-items-center justify-content-center">
		<form method="post" class="w-50 border p-4 rounded" enctype="multipart/form-data">
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
			<div class="my-5">
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
			<div class="mb-5">
				<div class="d-flex justify-content-between align-items-center mb-3">
					<label class="form-label">제품 이미지</label>
					<button type="button" id="add_image" class="btn btn-primary btn-sm">추가</button>
				</div>
				<div id="input_container">
					<div class="row align-items-center justify-content-between">
						<div class="col-11">
							<input type="file" class="form-control mb-1" name="productImage">
						</div>
					</div>
				</div>
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