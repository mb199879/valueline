<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<s:include value="top.jsp">
		<s:param name="anchor">login</s:param>
	</s:include>
	<div id="login" class="uk-clearfix">
		<img id="login-pic" src="<s:url value='/image/login.png' />" class="uk-float-left" />
		<div id="login-panel" class="uk-panel uk-panel-box uk-panel-header uk-float-right">
			<div class="uk-panel-title">用户登录</div>
			<s:form id="login-form" action="login!login" namespace="/" class="uk-form">
				<div class="uk-form-row">
					<div class="uk-form-icon uk-width-1-1">
						<i class="uk-icon-user"></i>
						<s:textfield key="loginName" placeholder="请输入手机号码或者邮箱" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<div class="uk-form-icon uk-width-1-1">
						<i class="uk-icon-lock"></i>
						<s:password key="password" placeholder="请输入密码" class="uk-width-1-1" />
					</div>
				</div>
				<s:if test="session.containsKey('loginError')">
				<div class="uk-form-row">
					<div class="uk-grid uk-grid-small">
						<div class="uk-width-2-3">
							<div class="uk-form-icon uk-width-1-1">
								<i class="uk-icon-qrcode"></i>
								<input type="text" name="verificationCode" placeholder="请输入验证码" class="uk-width-1-1" />
							</div>
						</div>
						<div class="uk-width-1-3">
							<a><img id="login-verification-image" src="<s:url value='/image/jcaptcha.jpg' />" class="uk-border-rounded" /></a>
						</div>
					</div>
				</div>
				</s:if>
				<div class="uk-form-row">
					<button type="submit" class="uk-button uk-button-primary uk-width-1-1">登录</button>
				</div>
				<div class="uk-form-row uk-clearfix">
					<!-- <a href="<s:url action='register1' namespace='/' />" class="uk-float-left">新用户注册</a> -->
					<a href="#" class="uk-float-left">新用户注册</a>
					<a href="#" class="uk-float-right">忘记密码?</a>
				</div>
			</s:form>
		</div>
	</div>
	<s:include value="bottom.jsp" />
	<script type="text/javascript">
		$("#login-verification-image").click(function() {
			$(this).attr("src", "<s:url value='/image/jcaptcha.jpg' />?random={0}".format(Math.random()));
		});
		$("#login-form").validate({
			rules: {
				loginName: "required",
				password: "required",
				verificationCode: "required"
			},
			messages: {
				loginName: "登录名不能为空",
				password: "密码不能为空",
				verificationCode: "验证码不能为空"
			},
			errorElement: "em",
			errorPlacement: function(error, element) {
				element.closest(".uk-form-row").append(error);
			}
		});
		
		if ("<s:property value='success' />" == "false")
			UIkit.notify("<s:property value='errorMessage' />", {
				status: "danger"
			});
	</script>
</body>
</html>