<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<s:include value="top.jsp">
		<s:param name="anchor">register</s:param>
	</s:include>
	<div id="register" class="uk-margin-large uk-container-center">
		<div id="register-banner">
			<div class="uk-grid uk-grid-collapse">
				<div class="uk-width-1-2">
					<div class="vl-item">
						<div>1</div>
						填写注册信息
					</div>
				</div>
				<div class="uk-width-1-2">
					<div class="vl-item vl-active">
						<div>2</div>
						完成
					</div>
				</div>
			</div>
		</div>
		<div id="register-alert" class="uk-alert uk-alert-success uk-text-center">您的申请已提交，请等待审核，我们将在1小时内给您回电。请耐心等候~</div>
	</div>
	<s:include value="bottom.jsp" />
</body>
</html>