<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<div id="role">
		<h2>角色管理</h2>
		<button type="button" class="uk-button uk-button-primary" data-uk-modal="{target: '#role-add', bgclose: false}">新增角色</button>
		<table id="role-table" class="uk-table uk-table-hover">
			<thead>
				<tr>
					<th>角色名称</th>
					<th>已选权限</th>
					<th class="uk-text-center">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<button type="button" id="role-modify-button" class="uk-button uk-hidden" data-uk-modal="{target: '#role-modify', bgclose: false}">编辑角色</button>
	<div id="role-add" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="role-add-close-button" class="uk-modal-close uk-close"></a>
			<div class="uk-modal-header uk-h3 uk-text-bold">新增角色</div>
			<form id="role-add-form" class="uk-form uk-form-horizontal">
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>角色名称</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">可选权限</label>
					<div class="uk-form-controls">
						<div id="privilege-tree-1" class="uk-border-rounded"></div>
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="role-add-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="role-modify" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="role-modify-close-button" class="uk-modal-close uk-close"></a>
			<div class="uk-modal-header uk-h3 uk-text-bold">编辑角色</div>
			<form id="role-modify-form" class="uk-form uk-form-horizontal">
				<input type="hidden" name="roleID" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>角色名称</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">可选权限</label>
					<div class="uk-form-controls">
						<div id="privilege-tree-2" class="uk-border-rounded"></div>
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="role-modify-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#role-table").on("load.uk.table", function() {
			$.isLoading();
			var tableBody = $(this).children("tbody");
			tableBody.empty();
			scsAjax({
				url: "/FPrivilege/SelectAllRole",
				params: {
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						$.each(data.resultValue, function() {
							var tableRow = $(
								("<tr>" + 
									"<td>{0}</td>" + 
									"<td>{1}</td>" + 
									"<td class='uk-text-center'>" + 
										"<a class='modify'>编辑</a>" + 
										"&nbsp;&nbsp;" + 
										"<a class='delete'>删除</a>" + 
									"</td>" + 
								"</tr>").format(this.NAME, $.map(this.PRIVILEGE_ROOT, function(item) {
									return item.NAME + ": " + $.map(item.PRIVILEGE, function(item) {
										return item.NAME;
									}).join(", ");
								}).join("<br>"))
							);
							tableRow.data({
								"id": this.ID,
								"name": this.NAME,
								"privilege-root": this.PRIVILEGE_ROOT
							});
							tableBody.append(tableRow);
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
		$("#role-table").trigger("load.uk.table");
		$("#role-table tbody").on("click", ".modify", function() {
			var tableRow = $(this).closest("tr");
			$("#role-modify-form [name='roleID']").val(tableRow.data("id"));
			$("#role-modify-form [name='name']").val(tableRow.data("name"));
			$("#role-modify-form [name='privilegePID']").val($.map(tableRow.data("privilege-root"), function(item) {
				return $.map(item.PRIVILEGE, function(item) {
					return item.ID;
				});
			}));
			$.each($("#privilege-tree-2").tree("getTree").children, function() {
				var checked = true;
				$.each(this.children, function() {
					checked = checked && $(this.element).children(".jqtree-element").find(".jqtree-checkbox").prop("checked");
				});
				$(this.element).children(".jqtree-element").find(".jqtree-checkbox").prop("checked", checked);
			});
			$("#role-modify-button").click();
		});
		$("#role-table tbody").on("click", ".delete", function() {
			var tableRow = $(this).closest("tr");
			UIkit.modal.confirm("确定要删除{0}吗?".format(tableRow.data("name")), function() {
				scsAjax({
					url: "/FPrivilege/DeleteRole",
					params: {
						roleID: tableRow.data("id"),
						token: "<s:property value='session.currentUserId' />"
					},
					success: function(data) {
						if (data.resultCode >= 0)
							$("#role-table").trigger("load.uk.table");
						else
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
					}
				});
			});
		});
		
		$("#role-add").on("hide.uk.modal", function() {
			var tree = $("#privilege-tree-1");
			$.each(tree.tree("getTree").children, function() {
				tree.tree("openNode", this);
			});
			tree.tree("selectNode", null);
			$("#role-add-form").validate().resetForm();
		});
		$("#role-add-save-button").click(function() {
			$("#role-add-form").submit();
		});
		scsAjax({
			url: "/FPrivilege/SelectPrivilegeListPID",
			params: {
				token: "<s:property value='session.currentUserId' />"
			},
			success: function(data) {
				if (data.resultCode >= 0)
					$("#privilege-tree-1").tree({
						data: $.map(data.resultValue.shift().SUB, function(item) {
							return {
								id: item.ID,
								name: item.PRIVILEGE,
								children: $.map(item.SUB, function(item) {
									return {
										id: item.ID,
										name: item.PRIVILEGE
									};
								})
							};
						}),
						autoOpen: true,
						onCreateLi: function(node, li) {
							li.find(".jqtree-title").html("<input type='checkbox' name='privilegePID' value='{0}' class='jqtree-checkbox' />&nbsp;{1}".format(node.id, node.name));
						}
					});
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
		$("#privilege-tree-1").on("tree.click", function(event) {
			var node = event.node;
			var source = $(event.click_event.target);
			if (source.hasClass("jqtree-checkbox")) {
				event.preventDefault();
				if (node.getLevel() == 1) {
					$.each(node.children, function() {
						$(this.element).children(".jqtree-element").find(".jqtree-checkbox").prop("checked", source.prop("checked"));
					});
				} else {
					var checked = true;
					$.each(node.parent.children, function() {
						checked = checked && $(this.element).children(".jqtree-element").find(".jqtree-checkbox").prop("checked");
					});
					$(node.parent.element).children(".jqtree-element").find(".jqtree-checkbox").prop("checked", checked);
				}
			}
		});
		$("#role-add-form").validate({
			rules: {
				name: "required"
			},
			messages: {
				name: "角色名称不能为空"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/FPrivilege/CreateRoleAndSetPrivilege",
					params: $.extend(params, {
						privilegePID: $("#role-add-form [name='privilegePID']").fieldValue()
					}),
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#role-add-close-button").click();
							$("#role-table").trigger("load.uk.table");
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
		
		$("#role-modify").on("hide.uk.modal", function() {
			var tree = $("#privilege-tree-2");
			$.each(tree.tree("getTree").children, function() {
				tree.tree("openNode", this);
			});
			tree.tree("selectNode", null);
			$("#role-modify-form [name='roleID']").val("");
			$("#role-modify-form").validate().resetForm();
		});
		$("#role-modify-save-button").click(function() {
			$("#role-modify-form").submit();
		});
		scsAjax({
			url: "/FPrivilege/SelectPrivilegeListPID",
			params: {
				token: "<s:property value='session.currentUserId' />"
			},
			success: function(data) {
				if (data.resultCode >= 0)
					$("#privilege-tree-2").tree({
						data: $.map(data.resultValue.shift().SUB, function(item) {
							return {
								id: item.ID,
								name: item.PRIVILEGE,
								children: $.map(item.SUB, function(item) {
									return {
										id: item.ID,
										name: item.PRIVILEGE
									};
								})
							};
						}),
						autoOpen: true,
						onCreateLi: function(node, li) {
							li.find(".jqtree-title").html("<input type='checkbox' name='privilegePID' value='{0}' class='jqtree-checkbox' />&nbsp;{1}".format(node.id, node.name));
						}
					});
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
		$("#privilege-tree-2").on("tree.click", function(event) {
			var node = event.node;
			var source = $(event.click_event.target);
			if (source.hasClass("jqtree-checkbox")) {
				event.preventDefault();
				if (node.getLevel() == 1) {
					$.each(node.children, function() {
						$(this.element).children(".jqtree-element").find(".jqtree-checkbox").prop("checked", source.prop("checked"));
					});
				} else {
					var checked = true;
					$.each(node.parent.children, function() {
						checked = checked && $(this.element).children(".jqtree-element").find(".jqtree-checkbox").prop("checked");
					});
					$(node.parent.element).children(".jqtree-element").find(".jqtree-checkbox").prop("checked", checked);
				}
			}
		});
		$("#role-modify-form").validate({
			rules: {
				name: "required"
			},
			messages: {
				name: "角色名称不能为空"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/FPrivilege/SetPrivilegeToRole",
					params: $.extend(params, {
						privilegePID: $("#role-modify-form [name='privilegePID']").fieldValue()
					}),
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#role-modify-close-button").click();
							$("#role-table").trigger("load.uk.table");
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