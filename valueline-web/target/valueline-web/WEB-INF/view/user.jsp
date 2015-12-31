<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<div id="user">
		<h2>用户管理</h2>
		<form id="user-form" class="uk-form uk-form-horizontal">
			<table class="uk-table">
				<thead>
					<tr>
						<th colspan="2"><span id="user-collapse-expand"><i class="uk-icon-minus-square-o"></i><i class="uk-icon-plus-square-o vl-hidden"></i></span>&nbsp;&nbsp;查询条件</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="uk-width-1-2">
							<div class="uk-form-row">
								<label class="uk-form-label">企业名称</label>
								<div class="uk-form-controls">
									<input type="text" name="firmName" class="uk-width-1-1" />
								</div>
							</div>
						</td>
						<td class="uk-width-1-2">
							<div class="uk-form-row">
								<label class="uk-form-label">部门名称</label>
								<div class="uk-form-controls">
									<input type="text" name="departName" class="uk-width-1-1" />
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="uk-form-row">
								<label class="uk-form-label">姓名或者手机号码</label>
								<div class="uk-form-controls">
									<input type="text" name="searchText" class="uk-width-1-1" />
								</div>
							</div>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2" class="uk-text-center"><button type="submit" class="uk-button uk-width-1-6">查询</button></td>
					</tr>
				</tbody>
			</table>
		</form>
		<table id="user-table" class="uk-table uk-table-hover">
			<thead>
				<tr>
					<th>姓名</th>
					<th>手机</th>
					<th>邮箱</th>
					<th>岗位</th>
					<th>所属部门</th>
					<th>所属企业</th>
					<th class="uk-text-center">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		$("#user-collapse-expand").click(function() {
			$("#user-form tbody").toggle();
			$("#user-collapse-expand i").toggle();
		});
		$("#user-form").submit(function(event) {
			event.preventDefault();
			var params = {};
			$.each($(this).serializeArray(), function() {
				params[this.name] = this.value;
			});
			var firmName = params.firmName;
			var departName = params.departName;
			var searchText = $.trim(params.searchText);
			if (searchText == "" && (firmName == "" || departName == "")) {
				UIkit.notify("如果姓名或者手机号码空缺，企业名称和部门名称就不能空缺", {
					status: "warning"
				});
				return;
			}
			
			$("#user-table tbody").empty();
			$("#user .uk-pagination").remove();
			scsAjax({
				url: "/UtiPerson/SelectByNameMobile2",
				params: {
					firmName: firmName,
					departName: departName,
					param: searchText == "" ? [] : searchText.split(/\s+/),
					token: "<s:property value='session.currentUserId' />",
					page: 1,
					pageSize: global_page_size
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						var pagination = $("<ul class='uk-pagination'></ul>");
						var paginationComponet = UIkit.pagination(pagination, {
							items: data.rowSize,
							itemsOnPage: global_page_size
						});
						pagination.on("select.uk.pagination", function(event, pageIndex) {
							$.isLoading();
							var tableBody = $("#user-table tbody");
							tableBody.empty();
							scsAjax({
								url: "/UtiPerson/SelectByNameMobile2",
								params: {
									firmName: firmName,
									departName: departName,
									param: searchText == "" ? [] : searchText.split(/\s+/),
									token: "<s:property value='session.currentUserId' />",
									page: pageIndex + 1,
									pageSize: global_page_size
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
													"<td>{5}</td>" + 
													"<td class='uk-text-center'></td>" + 
												"</tr>").format(this.NAME, this.MOBILE, this.EMAIL, this.POST_PID_NAME, this.FIRM_DEP_NAME, this.FIRM_NAME)
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
						$("#user").append(pagination);
						paginationComponet.selectPage(0);
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		});
	</script>
</body>
</html>