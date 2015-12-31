<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<div id="driver">
		<h2>司机管理</h2>
		<form id="driver-form" class="uk-form uk-form-horizontal">
			<table class="uk-table">
				<thead>
					<tr>
						<th colspan="2"><span id="driver-collapse-expand"><i class="uk-icon-minus-square-o"></i><i class="uk-icon-plus-square-o vl-hidden"></i></span>&nbsp;&nbsp;查询条件</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="uk-width-1-2">
							<div class="uk-form-row">
								<label class="uk-form-label">姓名或者手机号码</label>
								<div class="uk-form-controls">
									<input type="text" name="searchText" class="uk-width-1-1" />
								</div>
							</div>
						</td>
						<td class="uk-width-1-2">
							<div class="uk-form-row">
								<label class="uk-form-label">车牌号</label>
								<div class="uk-form-controls">
									<input type="text" name="plate" class="uk-width-1-1" />
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="uk-form-row">
								<label class="uk-form-label">送货起点</label>
								<div class="uk-form-controls">
									<div class="uk-grid uk-grid-small">
										<div class="uk-width-1-3">
											<select name="address1.province" class="uk-width-1-1">
												<option value="">请选择</option>
											</select>
										</div>
										<div class="uk-width-1-3">
											<select name="address1.city" class="uk-width-1-1">
												<option value="">请选择</option>
											</select>
										</div>
										<div class="uk-width-1-3">
											<select name="address1.county" class="uk-width-1-1">
												<option value="">请选择</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="uk-form-row">
								<label class="uk-form-label">送货终点</label>
								<div class="uk-form-controls">
									<div class="uk-grid uk-grid-small">
										<div class="uk-width-1-3">
											<select name="address2.province" class="uk-width-1-1">
												<option value="">请选择</option>
											</select>
										</div>
										<div class="uk-width-1-3">
											<select name="address2.city" class="uk-width-1-1">
												<option value="">请选择</option>
											</select>
										</div>
										<div class="uk-width-1-3">
											<select name="address2.county" class="uk-width-1-1">
												<option value="">请选择</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="uk-form-row">
								<label class="uk-form-label">公司名称</label>
								<div class="uk-form-controls">
									<input type="text" name="firmName" class="uk-width-1-1" />
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
		<p>
			<button type="button" class="uk-button uk-button-primary" data-uk-modal="{target: '#driver-add', bgclose: false}">新增司机</button>
		</p>
		<table id="driver-table" class="uk-table uk-table-hover">
			<thead>
				<tr>
					<th>姓名</th>
					<th>手机</th>
					<th>邮箱</th>
					<th>车牌号</th>
					<th>公司名称</th>
					<th>公司地址</th>
					<th class="uk-text-center">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<div id="driver-add" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="driver-add-close-button" class="uk-modal-close uk-close"></a>
			<div class="uk-modal-header uk-h3 uk-text-bold">新增司机</div>
			<form id="driver-add-form" class="uk-form uk-form-horizontal">
				<s:hidden name="groupID" value="%{groupId}" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>姓名</label>
					<div class="uk-form-controls">
						<input type="text" name="personRName" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>手机号码</label>
					<div class="uk-form-controls">
						<input type="text" name="mobile" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">邮箱</label>
					<div class="uk-form-controls">
						<input type="text" name="email" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>车牌号</label>
					<div class="uk-form-controls">
						<input type="text" name="car.plate" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">卡车长（米）</label>
					<div class="uk-form-controls">
						<input type="text" name="car.depth" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">卡车宽（米）</label>
					<div class="uk-form-controls">
						<input type="text" name="car.width" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">卡车高（米）</label>
					<div class="uk-form-controls">
						<input type="text" name="car.height" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">卡车容量</label>
					<div class="uk-form-controls">
						<input type="text" name="car.capacity" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>送货起点</label>
					<div class="uk-form-controls">
						<div class="uk-grid uk-grid-small">
							<div class="uk-width-1-3">
								<select name="line.address1.province" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="uk-width-1-3">
								<select name="line.address1.city" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="uk-width-1-3">
								<select name="line.address1.county" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>送货终点</label>
					<div class="uk-form-controls">
						<div class="uk-grid uk-grid-small">
							<div class="uk-width-1-3">
								<select name="line.address2.province" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="uk-width-1-3">
								<select name="line.address2.city" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="uk-width-1-3">
								<select name="line.address2.county" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">公司名称</label>
					<div class="uk-form-controls">
						<input type="text" name="firm.name" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">公司地址</label>
					<div class="uk-form-controls">
						<div class="uk-grid uk-grid-small">
							<div class="uk-width-1-3">
								<select name="firm.address.province" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="uk-width-1-3">
								<select name="firm.address.city" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="uk-width-1-3">
								<select name="firm.address.county" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
						</div>
						<div class="uk-grid uk-grid-small">
							<div class="uk-width-1-1">
								<input type="text" name="firm.address.detail" class="uk-width-1-1" />
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="driver-add-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function cleanupDriverForm() {
			$("#driver-form [name='address1.city']").children().slice(1).remove();
			$("#driver-form [name='address1.county']").children().slice(1).remove();
			$("#driver-form [name='address2.city']").children().slice(1).remove();
			$("#driver-form [name='address2.county']").children().slice(1).remove();
			$("#driver-form").get(0).reset();
		}
		
		$("#driver-collapse-expand").click(function() {
			$("#driver-form tbody").toggle();
			$("#driver-collapse-expand i").toggle();
		});
		scsAjax({
			url: "/UtiDomain/SelectProvince",
			params: {
				PID: 0
			},
			success: function(data) {
				var select = $("#driver-form [name='address1.province']");
				if (data.resultCode >= 0)
					$.each(data.resultValue, function() {
						select.append("<option value='{1}' data-id='{0}'>{2}</option>".format(this.ID, this.VALUE, this.NAME));
					});
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
		$("#driver-form [name='address1.province']").change([$("#driver-form [name='address1.city']"), $("#driver-form [name='address1.county']")], addressHandler);
		$("#driver-form [name='address1.city']").change([$("#driver-form [name='address1.county']")], addressHandler);
		scsAjax({
			url: "/UtiDomain/SelectProvince",
			params: {
				PID: 0
			},
			success: function(data) {
				var select = $("#driver-form [name='address2.province']");
				if (data.resultCode >= 0)
					$.each(data.resultValue, function() {
						select.append("<option value='{1}' data-id='{0}'>{2}</option>".format(this.ID, this.VALUE, this.NAME));
					});
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
		$("#driver-form [name='address2.province']").change([$("#driver-form [name='address2.city']"), $("#driver-form [name='address2.county']")], addressHandler);
		$("#driver-form [name='address2.city']").change([$("#driver-form [name='address2.county']")], addressHandler);
		$("#driver-form").submit(function(event) {
			event.preventDefault();
			var params = {};
			$.each($(this).serializeArray(), function() {
				params[this.name] = this.value;
			});
			var searchText = $.trim(params.searchText);
			
			$("#driver-table tbody").empty();
			$("#driver .uk-pagination").remove();
			scsAjax({
				url: "/UtiPerson/SelectDriverInPList",
				params: {
					param: searchText == "" ? [] : searchText.split(/\s+/),
					plate: params.plate,
					address1: {
						province: params["address1.province"],
						city: params["address1.city"],
						county: params["address1.county"]
					},
					address2: {
						province: params["address2.province"],
						city: params["address2.city"],
						county: params["address2.county"]
					},
					firmName: params.firmName,
					groupID: <s:property value='groupId' />,
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
							var tableBody = $("#driver-table tbody");
							tableBody.empty();
							scsAjax({
								url: "/UtiPerson/SelectDriverInPList",
								params: {
									param: searchText == "" ? [] : searchText.split(/\s+/),
									plate: params.plate,
									address1: {
										province: params["address1.province"],
										city: params["address1.city"],
										county: params["address1.county"]
									},
									address2: {
										province: params["address2.province"],
										city: params["address2.city"],
										county: params["address2.county"]
									},
									firmName: params.firmName,
									groupID: <s:property value='groupId' />,
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
													"<td>{6}</td>" + 
													"<td class='uk-text-center'>" + 
														"<a class='modify'>编辑</a>" + 
														"&nbsp;&nbsp;" + 
														"<a class='delete'>删除</a>" + 
													"</td>" + 
												"</tr>").format(this.POST, this.NAME, this.MOBILE, this.EMAIL, this.PLATE, this.FIRM_NAME, this.FIRM_ADDRESS)
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
						$("#driver").append(pagination);
						paginationComponet.selectPage(0);
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		});
		$("#driver-form").submit();
		$("#driver-table tbody").on("click", ".delete", function() {
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
							cleanupDriverForm();
							$("#driver-form").submit();
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			});
		});
		
		$("#driver-add").on("hide.uk.modal", function() {
			$("#driver-add-form [name='line.address1.city']").children().slice(1).remove();
			$("#driver-add-form [name='line.address1.county']").children().slice(1).remove();
			$("#driver-add-form [name='line.address2.city']").children().slice(1).remove();
			$("#driver-add-form [name='line.address2.county']").children().slice(1).remove();
			$("#driver-add-form [name='firm.address.city']").children().slice(1).remove();
			$("#driver-add-form [name='firm.address.county']").children().slice(1).remove();
			$("#driver-add-form").validate().resetForm();
		});
		$("#driver-add-save-button").click(function() {
			$("#driver-add-form").submit();
		});
		scsAjax({
			url: "/UtiDomain/SelectProvince",
			params: {
				PID: 0
			},
			success: function(data) {
				var select = $("#driver-add-form [name='line.address1.province']");
				if (data.resultCode >= 0)
					$.each(data.resultValue, function() {
						select.append("<option value='{1}' data-id='{0}'>{2}</option>".format(this.ID, this.VALUE, this.NAME));
					});
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
		$("#driver-add-form [name='line.address1.province']").change([$("#driver-add-form [name='line.address1.city']"), $("#driver-add-form [name='line.address1.county']")], addressHandler);
		$("#driver-add-form [name='line.address1.city']").change([$("#driver-add-form [name='line.address1.county']")], addressHandler);
		scsAjax({
			url: "/UtiDomain/SelectProvince",
			params: {
				PID: 0
			},
			success: function(data) {
				var select = $("#driver-add-form [name='line.address2.province']");
				if (data.resultCode >= 0)
					$.each(data.resultValue, function() {
						select.append("<option value='{1}' data-id='{0}'>{2}</option>".format(this.ID, this.VALUE, this.NAME));
					});
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
		$("#driver-add-form [name='line.address2.province']").change([$("#driver-add-form [name='line.address2.city']"), $("#driver-add-form [name='line.address2.county']")], addressHandler);
		$("#driver-add-form [name='line.address2.city']").change([$("#driver-add-form [name='line.address2.county']")], addressHandler);
		scsAjax({
			url: "/UtiDomain/SelectProvince",
			params: {
				PID: 0
			},
			success: function(data) {
				var select = $("#driver-add-form [name='firm.address.province']");
				if (data.resultCode >= 0)
					$.each(data.resultValue, function() {
						select.append("<option value='{1}' data-id='{0}'>{2}</option>".format(this.ID, this.VALUE, this.NAME));
					});
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
		$("#driver-add-form [name='firm.address.province']").change([$("#driver-add-form [name='firm.address.city']"), $("#driver-add-form [name='firm.address.county']")], addressHandler);
		$("#driver-add-form [name='firm.address.city']").change([$("#driver-add-form [name='firm.address.county']")], addressHandler);
		$("#driver-add-form").validate({
			rules: {
				"personRName": "required",
				"mobile": {
					required: true,
					rangelength: [11, 11]
				},
				"email": "email",
				"car.plate": "required",
				"car.depth": "number",
				"car.width": "number",
				"car.height": "number",
				"car.capacity": "number"
			},
			messages: {
				"personRName": "姓名不能为空",
				"mobile": {
					required: "手机号码不能为空",
					rangelength: "请输入11位手机号码"
				},
				"email": "邮箱格式不正确",
				"car.plate": "车牌号不能为空",
				"car.depth": "请输入有效的数字",
				"car.width": "请输入有效的数字",
				"car.height": "请输入有效的数字",
				"car.capacity": "请输入有效的数字"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				if (params["line.address1.province"] == "" || params["line.address1.city"] == "" || params["line.address1.county"] =="") {
					UIkit.notify("请选择送货起点", {
						status: "warning"
					});
					return;
				}
				if (params["line.address2.province"] == "" || params["line.address2.city"] == "" || params["line.address2.county"] =="") {
					UIkit.notify("请选择送货终点", {
						status: "warning"
					});
					return;
				}
				
				scsAjax({
					url: "/UtiPerson/CreateDriverToPList",
					params: $.extend(params, {
						car: {
							plate: params["car.plate"],
							depth: params["car.depth"],
							width: params["car.width"],
							height: params["car.height"],
							capacity: params["car.capacity"]
						},
						line: {
							address1: {
								province: params["line.address1.province"],
								city: params["line.address1.city"],
								county: params["line.address1.county"]
							},
							address2: {
								province: params["line.address2.province"],
								city: params["line.address2.city"],
								county: params["line.address2.county"]
							}
						},
						firm: {
							name: params["firm.name"],
							address: {
								province: params["firm.address.province"],
								city: params["firm.address.city"],
								county: params["firm.address.county"],
								detail: params["firm.address.detail"]
							}
						}
					}),
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#driver-add-close-button").click();
							cleanupDriverForm();
							$("#driver-form").submit();
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