<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="inc/header.jsp"></jsp:include>
<script>
	function check_id_sync(){
		const form = document.getElementById("signup_form");
		const xhr = new XMLHttpRequest();
		xhr.open("GET", "checkId?id="+form.id.value, false);
		xhr.send();
		
		const result = xhr.responseText;
		if(result == 'OK'){
			alert(`[동기] \${form.id.value}는 사용 가능한 ID 입니다`);
			form.checkId.value = form.id.value;
		}
		else
			alert(`[동기] \${form.id.value}는 이미 존재하는 ID 입니다`);
	}
	
	function check_id_async(){
		const form = document.getElementById("signup_form");
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState === XMLHttpRequest.DONE){
				if(xhr.status == 200){
					const result = xhr.responseText;
					if(result == 'OK'){
						alert(`[비동기] \${form.id.value}는 사용 가능한 ID 입니다`);
						form.checkId.value = form.id.value;
					}
					else
						alert(`[비동기] \${form.id.value}는 이미 존재하는 ID 입니다`);
				}
			}
		}
		
		xhr.open("GET", `checkId?id=\${form.id.value}`, true);
		xhr.send();
	}
	
	function signup(){
		const form = document.getElementById("signup_form");
		/* 특무문자 / 문자 / 숫자 포함 형태의 8 ~ 15자리 이내의 암호 정규식 */
		const pwRegx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		const telRegx = /^\d{3}-\d{3,4}-\d{4}$/;

		if(form.checkId.value != form.id.value){
			alert("중복검사를 해주세요");
			return;
		}
		if(form.id.value == ""){
			alert("ID를 입력하세요");
			form.id.focus();
			return;
		}
		if(form.password.value == ""){
			alert("비밀번호를 입력하세요");
			form.password.focus();
			return;
		}
		if(!pwRegx.test(form.password.value)){
			alert("비밀번호 형식을 확인해 주세요");
			form.password.focus();
			return;
		}
		if(form.password_confirm.value == ""){
			alert("비밀번호 확인을 입력하세요");
			form.password_confirm.focus();
			return;
		}
		if(form.password_confirm.value != form.password.value){
			alert("비밀번호 확인을 제대로 입력하세요");
			form.password_confirm.value = "";
			form.password.value = "";
			form.password.focus();
			return;
		}
		if(form.address.value == ""){
			alert("주소를 입력하세요");
			form.address.focus();
			return;
		}
		if(form.tel.value == ""){
			alert("전화번호를 입력하세요");
			form.tel.focus();
			return;
		}
		if(!telRegx.test(form.tel.value)){
			alert("전화번호 형식을 입력하세요");
			form.tel.focus();
			form.tel.value = "";
			return;
		}
		
		form.submit();
	}
</script>
</head>
<body>
	<div class="container vh-100 d-flex align-items-center justify-content-center">
		<form id="signup_form" method="post" class="w-50 border p-4 rounded">
			<input type="hidden" name="checkId">
			<div class="mb-3">
				<label for="id">아이디</label>
				<div class="row">
					<div class="col-9">
						<input type="text" id="id" name="id" required="required" autofocus="autofocus" class="form-control"/>
					</div>
					<div class="col-3">
						<button type="button" onclick="check_id_async()" class="btn btn-dark form-control">중복확인</button>
					</div>
				</div>
			</div>
			<div class="mb-3">
				<label for="password">비밀번호</label>
				<input type="password" id="password" name="password" required="required" placeholder="특수문자 / 문자 / 숫자 포함 형태의 8 ~ 15자리" class="form-control"/>
			</div>
			<div class="mb-3">
				<label for="password_confirm">비밀번호 확인</label>
				<input type="password" id="password_confirm" name="password_confirm" required="required" class="form-control"/>
			</div>
			<div class="mb-3">
				<label for="address">주소</label>
				<input type="text" id="address" name="address" required="required" class="form-control"/>
			</div>
			<div class="mb-5">
				<label for="tel">전화번호</label>
				<input type="tel" id="tel" name="tel" required="required" placeholder="-포함" class="form-control"/>
			</div>
			<div class="row">
				<div class="col-6">
					<button type="button" onclick="signup()" class="btn btn-primary form-control">회원가입</button>
				</div>
				<div class="col-6">
					<a href="." class="btn btn-secondary form-control">돌아가기</a>
				</div>
			</div>

		</form>
	</div>
</body>
</html>