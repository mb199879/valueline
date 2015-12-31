<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="uk-height-1-1">
<s:include value="head.jsp" />
<body class="uk-height-1-1">
	<div id="map-container" class="uk-height-1-1"></div>
	<script type="text/javascript">
		$.isLoading();
		scsAjax({
			url: "/FFirm/SelectFirmCoord",
			params: {
				firmID: <c:out value="${param.firmID}" />,
				token: "<s:property value='session.currentUserId' />"
			},
			success: function(data) {
				if (data.resultCode >= 0) {
					
					var firm = data.resultValue[0];   // 得到一级公司
					var map = new BMap.Map("map-container");
					var point = new BMap.Point(firm.LONGITUDE,firm.LATITUDE);
	    			map.addOverlay(new BMap.Marker(point));
		
					var sub = firm.SUB;	
					alert("length:"+sub.length);
					//有子公司就进入循环，并一直下去
				    while(sub.length!=0){
				    	var subFirm = sub[0];
				    	point = new BMap.Point(subFirm.LONGITUDE,subFirm.LATITUDE);
				    	alert(subFirm.LONGITUDE+","+subFirm.LATITUDE);
				    	map.addOverlay(new BMap.Marker(point));
				    	sub = subFirm.SUB;
					}				
					map.centerAndZoom(point, 15);  //116.404, 39.915
					
					$.isLoading("hide");
				} else {
					$.isLoading("hide");
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
				}
			},
			error: function() {
				$.isLoading("hide");
				errorHandler();
			}
		});
	</script>
</body>
</html>