<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>

</head>
<body>
<%--	<div class="container">--%>
<%--		<!-- <h1 class="form-heading">login Form</h1> -->--%>
<%--		<div class="login-form">--%>
<%--			<div class="main-div">--%>
<%--				<c:choose>--%>
<%--					<c:when test="${param.incorrectAccount != null}">--%>
<%--						<div class="alert alert-danger">--%>
<%--							Tài khoản hoặc mật khẩu không chính xác--%>
<%--						</div>--%>
<%--					</c:when>--%>

<%--					<c:when test="${param.accountIsLocked != null}">--%>
<%--						<div class="alert alert-danger">--%>
<%--							Tài khoản đã bị khóa--%>
<%--						</div>--%>
<%--					</c:when>--%>

<%--					<c:when test="${param.accessDenied != null}">--%>
<%--						<div class="alert alert-danger">--%>
<%--							you Not authorize--%>
<%--						</div>--%>
<%--					</c:when>--%>

<%--					<c:when test="${param.sessionExpired != null}">--%>
<%--						<div class="alert alert-danger">--%>
<%--							multiple concurrent logins being attempted as the same user--%>
<%--						</div>--%>
<%--					</c:when>--%>

<%--					<c:when test="${param.error != null}">--%>
<%--						<div class="alert alert-danger">--%>
<%--							${SPRING_SECURITY_LAST_EXCEPTION.message}--%>
<%--						</div>--%>
<%--					</c:when>--%>
<%--				</c:choose>--%>

<%--				<form action="process-login" id="formLogin" method="post">--%>
<%--					<div class="form-group">--%>
<%--						<input type="text" class="form-control" id="userName" name="j_username" placeholder="Tên đăng nhập">--%>
<%--					</div>--%>

<%--					<div class="form-group">--%>
<%--						<input type="password" class="form-control" id="password" name="j_password" placeholder="Mật khẩu">--%>
<%--					</div>--%>
<%--					<security:csrfInput/>--%>
<%--					<button type="submit" class="btn btn-primary" >Đăng nhập</button>--%>
<%--				</form>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>

<section class='login' id='login'>
	<div class='head'>
		<h1 class='company'>Đăng nhập</h1>
	</div>
	<p class='msg'>Chào bạn, mời bạn đăng nhập vào hệ thống</p>
	<div class='form'>
		<c:choose>
			<c:when test="${param.incorrectAccount != null}">
				<div class="alert alert-danger">
					Tài khoản hoặc mật khẩu không chính xác
				</div>
			</c:when>

			<c:when test="${param.accountIsLocked != null}">
				<div class="alert alert-danger">
					Tài khoản đã bị khóa
				</div>
			</c:when>

			<c:when test="${param.accessDenied != null}">
				<div class="alert alert-danger">
					you Not authorize
				</div>
			</c:when>

			<c:when test="${param.sessionExpired != null}">
				<div class="alert alert-danger">
					multiple concurrent logins being attempted as the same user
				</div>
			</c:when>

			<c:when test="${param.error != null}">
				<div class="alert alert-danger">
						${SPRING_SECURITY_LAST_EXCEPTION.message}
				</div>
			</c:when>
		</c:choose>
		<form action="process-login" id="formLogin" method="post">
			<input type="text" class='text' id="userName" name="j_username" placeholder="Tên đăng nhập">
<%--			<input type="text" placeholder='Username' class='text' id='username' required><br>--%>
			<input type="password"  class='password' id="password" name="j_password" placeholder="Mật khẩu">
<%--			<input type="password" placeholder='••••••••••••••' class='password'><br>--%>
<%--			<a href="#" class='btn-login' id='do-login'>Login</a>--%>
			<security:csrfInput/>
			<div style="width:100%;display: flex;justify-content: end">
				<button type="submit" class=" btn-login" id='do-login'>Đăng nhập</button>
			</div>

<%--			<a href="#" class='forgot'>Forgot?</a>--%>
		</form>
	</div>
</section>
</body>
</html>