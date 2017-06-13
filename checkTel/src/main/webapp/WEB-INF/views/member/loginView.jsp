<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true"><span aria-hidden="true">&times;</span></button>
	<h4 class="smaller lighter blue no-margin modal-title">로그인</h4>
</div>
<div class="modal-body">
	<form class="form">
		<div class="form-group">
			<label class="sr-only">Username or Email</label> <input type="text"
				class="form-control" placeholder="Username or Email">
		</div>
		<div class="form-group m-b-5">
			<label class="sr-only">Password</label> <input type="password"
				class="form-control" placeholder="Password">
		</div>
		<div class="form-group form-inline text-left ">

			<div class="checkbox">
				<label> <input type="checkbox"><small>
						Remember me</small></label>
			</div>
		</div>
		<div class="text-left form-group">
			<button type="button" class="btn btn-primary" style="width: 100%;">Login</button>
		</div>
		<a href="#" class="left"><small>비밀번호를 잊어버리셨나요?</small></a>
	</form>
</div>

<div class="modal-footer">
	<p class="text-left">
		아직 회원이 아니신가요? <a data-toggle="modal" data-target="#regModal" href="member/loginRegForm.do">회원 가입</a>
	</p>
</div>
</body>
</html>
