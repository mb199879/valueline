<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<div id="partner-type">
		<h2>伙伴类别</h2>
		<button type="button" class="uk-button uk-button-primary" data-uk-modal="{target: '#partner-type-add', bgclose: false}">新增类别</button>
		<table id="partner-type-table" class="uk-table uk-table-hover">
			<thead>
				<tr>
					<th>类别名称</th>
					<th class="uk-text-center">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<button type="button" id="partner-type-modify-button" class="uk-button uk-hidden" data-uk-modal="{target: '#partner-type-modify', bgclose: false}">编辑类别</button>
	<div id="partner-type-add" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="partner-type-add-close-button" class="uk-modal-close uk-close"></a>
			<div class="uk-modal-header uk-h3 uk-text-bold">新增类别</div>
			<form id="partner-type-add-form" class="uk-form uk-form-horizontal">
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>类别名称</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="partner-type-add-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="partner-type-modify" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="partner-type-modify-close-button" class="uk-modal-close uk-close"></a>
			<div class="uk-modal-header uk-h3 uk-text-bold">编辑类别</div>
			<form id="partner-type-modify-form" class="uk-form uk-form-horizontal">
				<input type="hidden" name="value" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>类别名称</label>
					<div class="uk-form-controls">
						<input type="text" name="groupNameNew" class="uk-width-1-1" />
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="partner-type-modify-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#partner-type-table").on("load.uk.table", function() {
			$.isLoading();
			var tableBody = $(this).children("tbody");
			tableBody.empty();
			scsAjax({
				url: "/UtiDomain/SelectGroup",
				params: {
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						$.each(data.resultValue, function() {
							if (this.NAME != "司机")
								tableBody.append(
									("<tr data-id='{0}' data-name='{1}'>" + 
										"<td>{1}</td>" + 
										"<td class='uk-text-center'>" + 
											"<a class='modify'>编辑</a>" + 
											"&nbsp;&nbsp;" + 
											"<a class='delete'>删除</a>" + 
										"</td>" + 
									"</tr>").format(this.VALUE, this.NAME)
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
		$("#partner-type-table").trigger("load.uk.table");
		$("#partner-type-table tbody").on("click", ".modify", function() {
			var tableRow = $(this).closest("tr");
			$("#partner-type-modify-form [name='value']").val(tableRow.data("id"));
			$("#partner-type-modify-form [name='groupNameNew']").val(tableRow.data("name"));
			$("#partner-type-modify-button").click();
		});
		$("#partner-type-table tbody").on("click", ".delete", function() {
			var tableRow = $(this).closest("tr");
			UIkit.modal.confirm("确定要删除{0}吗?".format(tableRow.data("name")), function() {
				scsAjax({
					url: "/UtiDomain/DeleteGroup",
					params: {
						value: [tableRow.data("id")],
						token: "<s:property value='session.currentUserId' />"
					},
					success: function(data) {
						if (data.resultCode >= 0)
							$("#partner-type-table").trigger("load.uk.table");
						else
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
					}
				});
			});
		});
		
		$("#partner-type-add").on("hide.uk.modal", function() {
			$("#partner-type-add-form").validate().resetForm();
		});
		$("#partner-type-add-save-button").click(function() {
			$("#partner-type-add-form").submit();
		});
		$("#partner-type-add-form").validate({
			rules: {
				name: "required"
			},
			messages: {
				name: "类别名称不能为空"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/UtiDomain/CreateGroup",
					params: $.extend(params, {
						groupName: [params.name]
					}),
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#partner-type-add-close-button").click();
							$("#partner-type-table").trigger("load.uk.table");
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
		
		$("#partner-type-modify").on("hide.uk.modal", function() {
			$("#partner-type-modify-form [name='value']").val("");
			$("#partner-type-modify-form").validate().resetForm();
		});
		$("#partner-type-modify-save-button").click(function() {
			$("#partner-type-modify-form").submit();
		});
		$("#partner-type-modify-form").validate({
			rules: {
				groupNameNew: "required"
			},
			messages: {
				groupNameNew: "类别名称不能为空"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/UtiDomain/ModifyGroup",
					params: params,
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#partner-type-modify-close-button").click();
							$("#partner-type-table").trigger("load.uk.table");
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
	</script>
</body>
</html>