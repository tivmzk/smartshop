<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc/header.jsp" flush="false"/>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
/* <div class="row align-items-center justify-content-between">
	<div class="col-11">
		<input type="file" class="form-control mb-1" name="productImage">
	</div>
	<div class="col-1 text-center">
		<button type="button" class="btn btn-danger btn-sm">X</button>
	</div>
</div> */
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
	<div class="container vh-100 d-flex align-items-center justify-content-center">
		<form method="post" class="w-50 border p-4 rounded" enctype="multipart/form-data" >
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
			<div class="my-5">
				<label class="form-label">제품설명</label>
				<textarea class="form-control" id="info" name="info" rows="20" cols="80"></textarea>
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