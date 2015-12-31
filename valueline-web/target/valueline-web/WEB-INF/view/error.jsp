<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% response.setStatus(500); %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<s:include value="top.jsp" />
	<div id="error" class="uk-margin-large uk-container-center">
		<div id="error-alert" class="uk-alert uk-alert-danger uk-text-center">对不起，出错了！</div>
	</div>
	<s:include value="bottom.jsp" />
</body>
</html>