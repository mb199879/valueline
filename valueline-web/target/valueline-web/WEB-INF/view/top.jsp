<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="top" class="uk-clearfix">
	<img id="logo" src="<s:url value='/image/logo.png' />" class="vl-margin uk-float-left" />
	<div id="top-nav" class="vl-margin uk-vertical-align uk-float-right">
		<div class="uk-vertical-align-middle">
			<a href="http://www.valueline.me/index.html">首页</a>
			&nbsp;&nbsp;
			<a href="http://www.valueline.me/about.html">关于我们</a>
			&nbsp;&nbsp;
			<c:choose>
				<c:when test="${param.anchor == 'login'}">
					登录
				</c:when>
				<c:otherwise>
					<a href="<s:url action='login' namespace='/' />">登录</a>
				</c:otherwise>
			</c:choose>
			&nbsp;&nbsp;
			<c:choose>
				<c:when test="${param.anchor == 'register'}">
					注册
				</c:when>
				<c:otherwise>
					<!-- <a href="<s:url action='register1' namespace='/' />">注册</a> -->
					<a href="#">注册</a>
				</c:otherwise>
			</c:choose>
			&nbsp;&nbsp;
			<img id="phone" src="<s:url value='/image/phone.png' />" />
			全国免费客服电话
			&nbsp;
			<span style="font-style: italic; color: #ff3300;">400-775-9359</span>
		</div>
	</div>
</div>