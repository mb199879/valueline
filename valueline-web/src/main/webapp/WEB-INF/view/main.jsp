<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<div id="main-top" class="uk-clearfix">
		<div id="main-logo" class="uk-float-left"></div>
		<div id="main-top-nav" class="uk-vertical-align uk-float-right">
			<div class="uk-vertical-align-middle">最近一次登录时间：<s:property value="cookies.lastTime" />&nbsp;&nbsp;<a href="http://www.valueline.me/index.html">关于价值线</a>&nbsp;&nbsp;<a href="<s:url action='logout' namespace='/' />">退出</a></div>
		</div>
	</div>
	<ul id="main-left-nav" class="uk-nav uk-nav-side uk-nav-parent-icon" data-uk-nav="{multiple: true}">
		<li class="uk-parent">
			<a href="#">采购管理</a>
			<ul class="uk-nav-sub">
				<li><a href="#" target="main-iframe">订单添加</a></li>
				<li><a href="#" target="main-iframe">订单查询</a></li>
			</ul>
		</li>
		<li class="uk-parent">
			<a href="#">销售管理</a>
			<ul class="uk-nav-sub">
				<li><a href="/order/ordersale.html" target="main-iframe">订单添加</a></li>
				<li><a href="#" target="main-iframe">订单查询</a></li>
			</ul>
		</li>
		<li class="uk-parent">
			<a href="#">库存管理</a>
			<ul class="uk-nav-sub">
				<li><a href="/scsdc/dcdict/dcdict.action" target="main-iframe">基础数据</a></li>
				<li><a href="/scsdc/dc/dc.action" target="main-iframe">仓库管理</a></li>
				<li><a href="/scsdc/dccargocheck/dccargoinit.action" target="main-iframe">期初设置</a></li>
				<li><a href="/scsdc/dcdealin/dcdealin.action" target="main-iframe">入库管理</a></li>
				<li><a href="/scsdc/dcdealout/dcdealout.action" target="main-iframe">出库管理</a></li>
				<li><a href="/scsdc/dctransfer/dctransfer.action" target="main-iframe">库存调拨</a></li>
				<li><a href="/scsdc/dccargocheck/dccargocheck.action" target="main-iframe">库存盘点</a></li>
				<li><a href="/scsdc/dccargocheck/dccargostock.action" target="main-iframe">库存查询</a></li>
			</ul>
		</li>
		<li class="uk-parent">
			<a href="#">运输管理</a>
			<ul class="uk-nav-sub">
				<li><a href="/tms/transportBill.html" target="main-iframe">运单添加</a></li>
				<li><a href="/tms/transportSearchBill.html" target="main-iframe">运单查询</a></li>
				<li><a href="#" target="main-iframe">车辆信息</a></li>
				<li><a href="#" target="main-iframe">司机信息</a></li>
				<li><a href="#" target="main-iframe">运输线路</a></li>
				<li><a href="#" target="main-iframe">车辆计划</a></li>
				<li><a href="#" target="main-iframe">车辆调度</a></li>
			</ul>
		</li>
		<li class="uk-parent">
			<a href="#">集拼管理</a>
			<ul class="uk-nav-sub">
				<li><a href="#" target="main-iframe">订单合并</a></li>
				<li><a href="#" target="main-iframe">运单合并</a></li>
			</ul>
		</li>
		<li class="uk-parent">
			<a href="#">合作伙伴</a>
			<ul class="uk-nav-sub">
				<li><a href="/tms/partner.html" target="main-iframe">伙伴管理</a></li>
				<li><a href="/tms/partner_manage.html" target="main-iframe">伙伴类别</a></li>
			</ul>
		</li>
		<li class="uk-parent">
			<a href="#">新合作伙伴</a>
			<ul class="uk-nav-sub">
				<li><a href="<s:url action='partner-type' namespace='/' />" target="main-iframe">伙伴类别</a></li>
				<li><a href="<s:url action='driver' namespace='/' />" target="main-iframe">司机管理</a></li>
				<li><a href="<s:url action='partner' namespace='/' />" target="main-iframe">伙伴管理</a></li>
			</ul>
		</li>
		<li class="uk-parent">
			<a href="#">企业管理</a>
			<ul class="uk-nav-sub">
				<li><a href="<s:url action='firm' namespace='/' />" target="main-iframe">企业信息</a></li>
				<li><a href="<s:url action='organization' namespace='/' />" target="main-iframe">组织架构</a></li>
				<li><a href="<s:url action='user' namespace='/' />" target="main-iframe">用户管理</a></li>
			</ul>
		</li>
		<li><a href="<s:url action='profile' namespace='/'><s:param name='anchor'>profile-password</s:param><s:param name='referer'>main-left-nav</s:param></s:url>" target="main-iframe">我的资料</a></li>
		<li><a href="<s:url action='role' namespace='/' />" target="main-iframe">角色管理</a></li>
		<li class="uk-parent">
			<a href="#">平台基础数据</a>
			<ul class="uk-nav-sub">
				<li><a href="/scsdc/cargo/firmcargo.action" target="main-iframe">企业物料设置</a></li>
				<li><a href="/scsdc/dcbase/dcbase.action" target="main-iframe">物流基础设施</a></li>
				<li><a href="#" target="main-iframe">北斗设置</a></li>
				<li><a href="#" target="main-iframe">审核设置</a></li>
				<li><a href="#" target="main-iframe">预警设置</a></li>
			</ul>
		</li>
		<li class="uk-parent">
			<a href="#">数据交换中心</a>
			<ul class="uk-nav-sub">
				<li><a href="#" target="main-iframe">采购系统</a></li>
				<li><a href="#" target="main-iframe">销售系统</a></li>
				<li><a href="#" target="main-iframe">库存系统</a></li>
				<li><a href="#" target="main-iframe">财务系统</a></li>
				<li><a href="#" target="main-iframe">运输系统</a></li>
				<li><a href="#" target="main-iframe">税务系统</a></li>
				<li><a href="#" target="main-iframe">海关系统</a></li>
				<li><a href="#" target="main-iframe">银行系统</a></li>
			</ul>
		</li>
	</ul>
	<div id="main">
		<iframe name="main-iframe" src="<s:url action='blank' namespace='/' />" class="uk-height-1-1 uk-width-1-1"></iframe>
		<div id="main-handle"><i class="uk-icon-angle-double-left"></i><i class="uk-icon-angle-double-right vl-hidden"></i></div>
	</div>
	<script type="text/javascript">
		scsAjax({
			url: "/Person/SelectPAttrS",
			params: {
				token: "<s:property value='session.currentUserId' />"
			},
			success: function(data) {
				if (data.resultCode >= 0)
					$("#main-top-nav div").prepend("欢迎用户：{0}&nbsp;&nbsp;".format(data.resultValue.shift().NAME));
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
		$("#main-handle").click(function() {
			$("#main").toggleClass("maximized");
			$("#main-handle i").toggle();
		});
	</script>
</body>
</html>