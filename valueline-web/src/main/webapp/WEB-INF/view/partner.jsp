<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<div id="partner">
		<h2>伙伴管理</h2>
		<div class="uk-clearfix">
			<div class="uk-float-left">
				<button type="button" class="uk-button uk-button-primary" data-uk-modal="{target: '#partner-add', bgclose: false}">新增合作伙伴</button>
			</div>
			<form id="partner-form" class="uk-form uk-float-right">
				<input type="hidden" name="groupID" value="-1" />
				<div class='uk-button-dropdown' data-uk-dropdown>
					<button type='button' class='uk-button'>所有合作伙伴<i class='uk-icon-caret-down uk-margin-small-left'></i></button>
					<div class='uk-dropdown uk-dropdown-small'>
						<ul class='uk-nav uk-nav-dropdown'>
							<li><a>所有合作伙伴</a></li>
						</ul>
					</div>
				</div>
				<input type="text" name="searchText" placeholder="按姓名或者手机号码查询" class="uk-form-width-medium" />
				<button type="submit" class="uk-button">查询</button>
			</form>
		</div>
		<table id="partner-table" class="uk-table uk-table-hover">
			<thead>
				<tr>
					<th>姓名</th>
					<th>手机</th>
					<th>邮箱</th>
					<th>公司名称</th>
					<th>公司地址</th>
					<th class="uk-text-center">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		scsAjax({
			url: "/UtiDomain/SelectGroup",
			params: {
				token: "<s:property value='session.currentUserId' />"
			},
			success: function(data) {
				var ul = $("#partner-form .uk-nav");
				if (data.resultCode >= 0)
					$.each(data.resultValue, function() {
						if (this.NAME != "司机")
							ul.append("<li><a>{1}</a></li>".format(this.VALUE, this.NAME));
					});
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
		$("#partner-form").submit(function(event) {
			event.preventDefault();
			var params = {};
			$.each($(this).serializeArray(), function() {
				params[this.name] = this.value;
			});
			var searchText = $.trim(params.searchText);
			
			$("#partner-table tbody").empty();
			$("#partner .uk-pagination").remove();
			scsAjax({
				url: "/UtiPerson/SelectPersonInPList",
				params: {
					param: searchText == "" ? [] : searchText.split(/\s+/),
					groupID: params.groupID,
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
							var tableBody = $("#partner-table tbody");
							tableBody.empty();
							scsAjax({
								url: "/UtiPerson/SelectPersonInPList",
								params: {
									param: searchText == "" ? [] : searchText.split(/\s+/),
									groupID: params.groupID,
									token: "<s:property value='session.currentUserId' />",
									page: pageIndex + 1,
									pageSize: global_page_size
								},
								success: function(data) {
									if (data.resultCode >= 0) {
										$.each(data.resultValue, function() {
											tableBody.append(
												("<tr data-id='{0}' data-name='{1}'>" + 
													"<td>{1}</td>" + 
													"<td>{2}</td>" + 
													"<td>{3}</td>" + 
													"<td>{4}</td>" + 
													"<td>{5}</td>" + 
													"<td class='uk-text-center'>" + 
														"<a class='modify'>编辑</a>" + 
														"&nbsp;&nbsp;" + 
														"<a class='delete'>删除</a>" + 
													"</td>" + 
												"</tr>").format(this.POST, this.NAME, this.MOBILE, this.EMAIL, this.FIRM_NAME, this.FIRM_ADDRESS)
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
						$("#partner").append(pagination);
						paginationComponet.selectPage(0);
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		});
		$("#partner-form").submit();
		$("#partner-table tbody").on("click", ".delete", function() {
			var tableRow = $(this).closest("tr");
			UIkit.modal.confirm("确定要删除{0}吗?".format(tableRow.data("name")), function() {
				scsAjax({
					url: "/UtiPerson/DeleteFromPList",
					params: {
						delPersonPost: [tableRow.data("id")],
						token: "<s:property value='session.currentUserId' />"
					},
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#partner-form").get(0).reset();
							$("#partner-form").submit();
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			});
		});
	</script>
</body>
</html>