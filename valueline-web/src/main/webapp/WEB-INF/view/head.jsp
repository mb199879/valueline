<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8" />
	<title>价值线</title>
	<c:if test="${not empty param.baiduMap}">
	<!-- baidu-map -->
	<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=qARYsfxM7X7g6v0sHBV2lmcg&s=1"></script>
	</c:if>
	<!-- node-uuid -->
	<script type="text/javascript" src="<s:url value='/lib/node-uuid/uuid.js' />"></script>
	<!-- js-cookie -->
	<script type="text/javascript" src="<s:url value='/lib/js-cookie/js.cookie.js' />"></script>
	<!-- jquery -->
	<script type="text/javascript" src="<s:url value='/lib/jquery/jquery-1.11.3.js' />"></script>
	<!-- jquery-form -->
	<script type="text/javascript" src="<s:url value='/lib/jquery-form/jquery.form.js' />"></script>
	<!-- jquery-validation -->
	<script type="text/javascript" src="<s:url value='/lib/jquery-validation/jquery.validate.js' />"></script>
	<!-- uikit -->
	<link rel="stylesheet" type="text/css" href="<s:url value='/lib/uikit/dist/css/uikit.gradient.css' />" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/lib/uikit/dist/css/components/notify.gradient.css' />" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/lib/uikit/dist/css/components/upload.gradient.css' />" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/lib/uikit/dist/css/components/form-file.gradient.css' />" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/lib/uikit/dist/css/components/placeholder.gradient.css' />" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/lib/uikit/dist/css/components/progress.gradient.css' />" />
	<script type="text/javascript" src="<s:url value='/lib/uikit/dist/js/uikit.js' />"></script>
	<script type="text/javascript" src="<s:url value='/lib/uikit/dist/js/components/notify.js' />"></script>
	<script type="text/javascript" src="<s:url value='/lib/uikit/dist/js/components/upload.js' />"></script>
	<script type="text/javascript" src="<s:url value='/lib/uikit/dist/js/components/pagination.js' />"></script>
	<!-- is-loading -->
	<link rel="stylesheet" type="text/css" href="<s:url value='/lib/is-loading/jquery.isloading.css' />" />
	<script type="text/javascript" src="<s:url value='/lib/is-loading/jquery.isloading.js' />"></script>
	<!-- jqtree -->
	<link rel="stylesheet" type="text/css" href="<s:url value='/lib/jqtree/jqtree.css' />" />
	<script type="text/javascript" src="<s:url value='/lib/jqtree/tree.jquery.js' />"></script>
	<!-- valueline -->
	<link rel="stylesheet" type="text/css" href="<s:url value='/css/valueline.css' />" />
	<script type="text/javascript" src="<s:url value='/js/valueline.js' />"></script>
</head>