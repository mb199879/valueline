<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<div id="firm">
		<h2>企业信息</h2>
		<form id="firm-form" class="uk-form uk-text-center">
			<input type="text" name="searchText" placeholder="按企业名称查询" class="uk-width-1-3" />
			<button type="submit" class="uk-button">查询</button>
		</form>
		<table id="firm-table" class="uk-table uk-table-hover">
			<thead>
				<tr>
					<th>企业名称</th>
					<th>企业简称</th>
					<th>统一社会信用代码</th>
					<th>地址</th>
					<th>邮编</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		$("#firm-form").submit(function(event) {
			event.preventDefault();
			$("#firm-table").trigger("load.uk.table");
		});
		$("#firm-table").on("load.uk.table", function() {
			var searchText = $("#firm-form [name='searchText']").val();
			if (searchText == "")
				return;
			
			$.isLoading();
			var tableBody = $(this).children("tbody");
			tableBody.empty();
			scsAjax({
				url: "/FFirm/SelectFirmByName",
				params: {
					firmName: searchText,
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						$.each(data.resultValue, function() {
							tableBody.append(
								("<tr>" + 
									"<td>{0}</td>" + 
									"<td>{1}</td>" + 
									"<td>{2}</td>" + 
									"<td>{3}</td>" + 
									"<td>{4}</td>" + 
								"</tr>").format(this.NAME, this.SHORT_NAME, this.ORG_CODE, this.DETAILALL, this.CODE)
							);
						});
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
		});
	</script>
</body>
</html>