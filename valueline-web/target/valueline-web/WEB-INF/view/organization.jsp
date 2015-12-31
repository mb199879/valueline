<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<div id="organization">
		<h2>组织架构</h2>
		<div class="uk-grid">
			<div class="uk-width-1-3">
				<div id="organization-tree"></div>
			</div>
			<div class="uk-width-2-3">
				<div id="firm-person" class="vl-hidden">
					<h3></h3>
					<div class="uk-clearfix">
						<div class="uk-float-left">
							<button type="button" class="uk-button uk-button-primary" data-uk-modal="{target: '#firm-person-addnew', bgclose: false}">新增人员</button>
							<button type="button" class="uk-button uk-button-primary" data-uk-modal="{target: '#firm-person-add', bgclose: false}">导入人员</button>
						</div>
						<form id="firm-person-form" class="uk-form uk-float-right">
							<input type="text" name="searchText" placeholder="按姓名或者手机号码查询" class="uk-form-width-medium" />
							<button type="submit" class="uk-button">查询</button>
						</form>
					</div>
					<table id="firm-person-table" class="uk-table uk-table-hover">
						<thead>
							<tr>
								<th>姓名</th>
								<th>手机</th>
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
				<div id="depart-person" class="vl-hidden">
					<h3></h3>
					<button type="button" class="uk-button uk-button-primary" data-uk-modal="{target: '#depart-person-add', bgclose: false}">导入人员</button>
					<table id="depart-person-table" class="uk-table uk-table-hover">
						<thead>
							<tr>
								<th>姓名</th>
								<th>手机</th>
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
				<div id="post-person" class="vl-hidden">
					<h3></h3>
					<button type="button" class="uk-button uk-button-primary" data-uk-modal="{target: '#post-person-addnew', bgclose: false}">新增人员</button>
					<button type="button" class="uk-button uk-button-primary" data-uk-modal="{target: '#post-person-add', bgclose: false}">导入人员</button>
					<table id="post-person-table" class="uk-table uk-table-hover">
						<thead>
							<tr>
								<th>姓名</th>
								<th>手机</th>
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
			</div>
		</div>
	</div>
	<button type="button" id="firm-add-button" class="uk-button uk-hidden" data-uk-modal="{target: '#firm-add', bgclose: false}">新增企业</button>
	<button type="button" id="depart-add-button" class="uk-button uk-hidden" data-uk-modal="{target: '#depart-add', bgclose: false}">新增部门</button>
	<button type="button" id="post-add-button" class="uk-button uk-hidden" data-uk-modal="{target: '#post-add', bgclose: false}">新增岗位</button>
	<button type="button" id="firm-modify-button" class="uk-button uk-hidden" data-uk-modal="{target: '#firm-modify', bgclose: false}">编辑企业</button>
	<button type="button" id="depart-modify-button" class="uk-button uk-hidden" data-uk-modal="{target: '#depart-modify', bgclose: false}">编辑部门</button>
	<button type="button" id="post-modify-button" class="uk-button uk-hidden" data-uk-modal="{target: '#post-modify', bgclose: false}">编辑岗位</button>
	<button type="button" id="depart-role-modify-button" class="uk-button uk-hidden" data-uk-modal="{target: '#depart-role-modify', bgclose: false}">角色设置</button>
	<button type="button" id="post-role-modify-button" class="uk-button uk-hidden" data-uk-modal="{target: '#post-role-modify', bgclose: false}">角色设置</button>
	<button type="button" id="firm-map-view-button" class="uk-button uk-hidden" data-uk-modal="{target: '#firm-map-view', bgclose: false}">查看地图</button>
	<button type="button" id="dummy-button" class="uk-button uk-hidden">DUMMY</button>
	<div id="firm-add" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="firm-add-close-button" class="uk-modal-close uk-close"></a>
			<div id="firm-add-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="firm-add-form" class="uk-form uk-form-horizontal">
				<input type="hidden" name="PID" />
				<input type="hidden" name="BLPhoto" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>企业名称</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">企业简称</label>
					<div class="uk-form-controls">
						<input type="text" name="shortName" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">统一社会信用代码</label>
					<div class="uk-form-controls">
						<input type="text" name="orgCode" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">地址</label>
					<div class="uk-form-controls">
						<div class="uk-grid uk-grid-small">
							<div class="uk-width-1-3">
								<select name="address.province" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="uk-width-1-3">
								<select name="address.city" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="uk-width-1-3">
								<select name="address.county" class="uk-width-1-1">
									<option value="">请选择</option>
								</select>
							</div>
						</div>
						<div class="uk-grid uk-grid-small">
							<div class="uk-width-1-1">
								<input type="text" name="address.detail" class="uk-width-1-1" />
							</div>
						</div>
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">邮编</label>
					<div class="uk-form-controls">
						<input type="text" name="address.code" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">营业执照照片</label>
					<div class="uk-form-controls">
						<div class="uk-form-file">
							<button type="button" class="uk-button">选择营业执照照片</button>
							<input type="file" id="firm-photo-upload" />
						</div>
						<div class="uk-progress uk-progress-success uk-progress-striped uk-active uk-hidden">
							<div class="uk-progress-bar" style="width: 0%;"></div>
						</div>
					</div>
				</div>
				<div class="uk-form-row">
					<div class="uk-form-controls">
						<div id="firm-photo"></div>
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="firm-add-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="depart-add" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="depart-add-close-button" class="uk-modal-close uk-close"></a>
			<div id="depart-add-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="depart-add-form" class="uk-form uk-form-horizontal">
				<input type="hidden" name="pid" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>部门名称</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="depart-add-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="post-add" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="post-add-close-button" class="uk-modal-close uk-close"></a>
			<div id="post-add-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="post-add-form" class="uk-form uk-form-horizontal">
				<input type="hidden" name="firmDep" />
				<input type="hidden" name="postPID" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>岗位名称</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">上级岗位</label>
					<div class="uk-form-controls">
						<input type="text" name="pname" class="vl-form-readonly uk-width-1-1" readonly />
					</div>
				</div>
				<div class="uk-form-row">
					<div class="uk-form-controls">
						<div id="organization-tree-1"></div>
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="post-add-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="firm-modify" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="firm-modify-close-button" class="uk-modal-close uk-close"></a>
			<div id="firm-modify-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="firm-modify-form" class="uk-form uk-form-horizontal">
				<input type="hidden" name="firmID" />
				<input type="hidden" name="BLPhoto" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>企业名称</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">企业简称</label>
					<div class="uk-form-controls">
						<input type="text" name="shortName" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">统一社会信用代码</label>
					<div class="uk-form-controls">
						<input type="text" name="orgCode" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">地址</label>
					<div class="uk-form-controls">
						<div class="uk-grid uk-grid-small">
							<div class="uk-width-1-3">
								<select name="address.province" class="uk-width-1-1"></select>
							</div>
							<div class="uk-width-1-3">
								<select name="address.city" class="uk-width-1-1"></select>
							</div>
							<div class="uk-width-1-3">
								<select name="address.county" class="uk-width-1-1"></select>
							</div>
						</div>
						<div class="uk-grid uk-grid-small">
							<div class="uk-width-1-1">
								<input type="text" name="address.detail" class="uk-width-1-1" />
							</div>
						</div>
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">邮编</label>
					<div class="uk-form-controls">
						<input type="text" name="address.code" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">营业执照照片</label>
					<div class="uk-form-controls">
						<div class="uk-form-file">
							<button type="button" class="uk-button">选择营业执照照片</button>
							<input type="file" id="firm-photo-x-upload" />
						</div>
						<div class="uk-progress uk-progress-success uk-progress-striped uk-active uk-hidden">
							<div class="uk-progress-bar" style="width: 0%;"></div>
						</div>
					</div>
				</div>
				<div class="uk-form-row">
					<div class="uk-form-controls">
						<div id="firm-photo-x"></div>
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="firm-modify-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="depart-modify" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="depart-modify-close-button" class="uk-modal-close uk-close"></a>
			<div id="depart-modify-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="depart-modify-form" class="uk-form uk-form-horizontal">
				<input type="hidden" name="depart" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>部门名称</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="depart-modify-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="post-modify" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="post-modify-close-button" class="uk-modal-close uk-close"></a>
			<div id="post-modify-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="post-modify-form" class="uk-form uk-form-horizontal">
				<input type="hidden" name="post" />
				<input type="hidden" name="postPID" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>岗位名称</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label">上级岗位</label>
					<div class="uk-form-controls">
						<input type="text" name="pname" class="vl-form-readonly uk-width-1-1" readonly />
					</div>
				</div>
				<div class="uk-form-row">
					<div class="uk-form-controls">
						<div id="organization-tree-2"></div>
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="post-modify-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="depart-role-modify" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="depart-role-modify-close-button" class="uk-modal-close uk-close"></a>
			<div id="depart-role-modify-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="depart-role-modify-form" class="uk-form uk-form-horizontal">
				<input type="hidden" name="firmDep" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label">角色</label>
					<div class="uk-form-controls">
						<select name="roleID" class="uk-width-1-1"></select>
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="depart-role-modify-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="post-role-modify" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="post-role-modify-close-button" class="uk-modal-close uk-close"></a>
			<div id="post-role-modify-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="post-role-modify-form" class="uk-form uk-form-horizontal">
				<input type="hidden" name="post" />
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label">角色</label>
					<div class="uk-form-controls">
						<select name="roleID" class="uk-width-1-1"></select>
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="post-role-modify-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="firm-map-view" class="uk-modal">
		<div class="uk-modal-dialog uk-modal-dialog-lightbox uk-modal-dialog-large">
			<a class="uk-modal-close uk-close uk-close-alt"></a>
			<div id="firm-map">
				<iframe src="<s:url action='blank' namespace='/' />" class="uk-height-1-1 uk-width-1-1"></iframe>
			</div>
		</div>
	</div>
	<div id="firm-person-addnew" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="firm-person-addnew-close-button" class="uk-modal-close uk-close"></a>
			<div id="firm-person-addnew-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="firm-person-addnew-form" class="uk-form uk-form-horizontal">
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>姓名</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>手机号码</label>
					<div class="uk-form-controls">
						<input type="text" name="mobile" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>邮箱</label>
					<div class="uk-form-controls">
						<input type="text" name="email" class="uk-width-1-1" />
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="firm-person-addnew-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="firm-person-add" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="firm-person-add-close-button" class="uk-modal-close uk-close"></a>
			<div id="firm-person-add-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="firm-person-add-form" class="uk-form uk-text-center">
				<input type="text" name="searchText" placeholder="按姓名或者手机号码查询" class="uk-width-1-2" />
				<button type="submit" class="uk-button">查询</button>
			</form>
			<table id="firm-person-add-table" class="uk-table uk-table-hover">
				<thead>
					<tr>
						<th class="uk-text-center" style="width: 16px;"><input type="checkbox" class="row-select-all" /></th>
						<th>姓名</th>
						<th>手机</th>
						<th>邮箱</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="firm-person-add-save-button" class="uk-button uk-button-primary">导入</button>
			</div>
		</div>
	</div>
	<div id="depart-person-add" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="depart-person-add-close-button" class="uk-modal-close uk-close"></a>
			<div id="depart-person-add-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="depart-person-add-form" class="uk-form uk-text-center">
				<input type="text" name="searchText" placeholder="按姓名或者手机号码查询" class="uk-width-1-2" />
				<button type="submit" class="uk-button">查询</button>
			</form>
			<table id="depart-person-add-table" class="uk-table uk-table-hover">
				<thead>
					<tr>
						<th class="uk-text-center" style="width: 16px;"><input type="checkbox" class="row-select-all" /></th>
						<th>姓名</th>
						<th>手机</th>
						<th>邮箱</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="depart-person-add-save-button" class="uk-button uk-button-primary">导入</button>
			</div>
		</div>
	</div>
	<div id="post-person-addnew" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="post-person-addnew-close-button" class="uk-modal-close uk-close"></a>
			<div id="post-person-addnew-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="post-person-addnew-form" class="uk-form uk-form-horizontal">
				<s:hidden name="token" value="%{session.currentUserId}" />
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>姓名</label>
					<div class="uk-form-controls">
						<input type="text" name="name" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>手机号码</label>
					<div class="uk-form-controls">
						<input type="text" name="mobile" class="uk-width-1-1" />
					</div>
				</div>
				<div class="uk-form-row">
					<label class="uk-form-label"><span class="vl-form-label-required">*</span>邮箱</label>
					<div class="uk-form-controls">
						<input type="text" name="email" class="uk-width-1-1" />
					</div>
				</div>
			</form>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="post-person-addnew-save-button" class="uk-button uk-button-primary">保存</button>
			</div>
		</div>
	</div>
	<div id="post-person-add" class="uk-modal">
		<div class="uk-modal-dialog">
			<a id="post-person-add-close-button" class="uk-modal-close uk-close"></a>
			<div id="post-person-add-header" class="uk-modal-header uk-h3 uk-text-bold"></div>
			<form id="post-person-add-form" class="uk-form uk-text-center">
				<input type="text" name="searchText" placeholder="按姓名或者手机号码查询" class="uk-width-1-2" />
				<button type="submit" class="uk-button">查询</button>
			</form>
			<table id="post-person-add-table" class="uk-table uk-table-hover">
				<thead>
					<tr>
						<th class="uk-text-center" style="width: 16px;"><input type="checkbox" class="row-select-all" /></th>
						<th>姓名</th>
						<th>手机</th>
						<th>邮箱</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="uk-modal-footer uk-text-right">
				<button type="button" class="uk-modal-close uk-button">取消</button>
				<button type="button" id="post-person-add-save-button" class="uk-button uk-button-primary">导入</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function treeElData(key) {
			var tree = $("#organization-tree");
			var node = tree.tree("getNodeById", tree.data("current-node-id-for-view"));
			var treeEl = $(node.element).children(".jqtree-element");
			return treeEl.data(key);
		}
		
		function cleanup() {
			$("#firm-person").hide();
			$("#firm-person h3").html("");
			$("#firm-person-form").get(0).reset();
			$("#firm-person-table tbody").empty();
			$("#firm-person .uk-pagination").remove();
			$("#firm-person-addnew-header").html("");
			$("#firm-person-add-header").html("");
			$("#depart-person").hide();
			$("#depart-person h3").html("");
			$("#depart-person-table tbody").empty();
			$("#depart-person .uk-pagination").remove();
			$("#depart-person-add-header").html("");
			$("#post-person").hide();
			$("#post-person h3").html("");
			$("#post-person-table tbody").empty();
			$("#post-person .uk-pagination").remove();
			$("#post-person-addnew-header").html("");
			$("#post-person-add-header").html("");
		}
		
		function buildFirmPerson(queryParams) {
			var _queryParams = $.extend({
				searchText: ""
			}, queryParams);
			var searchText = $.trim(_queryParams.searchText);
			
			cleanup();
			scsAjax({
				url: "/FFirm/SelectFirmPerson",
				params: {
					firmID: treeElData("entity-id"),
					param: searchText == "" ? [] : searchText.split(/\s+/),
					token: "<s:property value='session.currentUserId' />",
					page: 1,
					pageSize: global_page_size
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						var target = $("#firm-person");
						target.children("h3").html("{0}&nbsp;&nbsp;人员列表".format(treeElData("name")));
						$("#firm-person-form [name='searchText']").val(_queryParams.searchText);
						var pagination = $("<ul class='uk-pagination'></ul>");
						var paginationComponet = UIkit.pagination(pagination, {
							items: data.rowSize,
							itemsOnPage: global_page_size
						});
						pagination.on("select.uk.pagination", function(event, pageIndex) {
							$.isLoading();
							var tableBody = $("#firm-person-table tbody");
							tableBody.empty();
							scsAjax({
								url: "/FFirm/SelectFirmPerson",
								params: {
									firmID: treeElData("entity-id"),
									param: searchText == "" ? [] : searchText.split(/\s+/),
									token: "<s:property value='session.currentUserId' />",
									page: pageIndex + 1,
									pageSize: global_page_size
								},
								success: function(data) {
									if (data.resultCode >= 0) {
										$.each(data.resultValue, function() {
											tableBody.append(
												("<tr data-person='{0}' data-post='{1}' data-name='{2}'>" + 
													"<td>{2}</td>" + 
													"<td>{3}</td>" + 
													"<td>{4}</td>" + 
													"<td>{5}</td>" + 
													"<td>{6}</td>" + 
													"<td class='uk-text-center'><a class='delete'>删除</a></td>" + 
												"</tr>").format(this.PERSON, this.POST, this.NAME, this.MOBILE, this.POST_PID_NAME, this.FIRM_DEP_NAME, this.FIRM_NAME)
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
						target.append(pagination);
						$("#firm-person-addnew-header").html("{0}&nbsp;&nbsp;新增人员".format(treeElData("name")));
						$("#firm-person-add-header").html("{0}&nbsp;&nbsp;导入人员".format(treeElData("name")));
						target.show();
						paginationComponet.selectPage(0);
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		}
		
		function buildDepartPerson() {
			cleanup();
			scsAjax({
				url: "/FDepart/SelectDepartPerson",
				params: {
					depart: [treeElData("entity-id")],
					token: "<s:property value='session.currentUserId' />",
					page: 1,
					pageSize: global_page_size
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						var target = $("#depart-person");
						target.children("h3").html("{0}&nbsp;&nbsp;人员列表".format(treeElData("name")));
						var pagination = $("<ul class='uk-pagination'></ul>");
						var paginationComponet = UIkit.pagination(pagination, {
							items: data.rowSize,
							itemsOnPage: global_page_size
						});
						pagination.on("select.uk.pagination", function(event, pageIndex) {
							$.isLoading();
							var tableBody = $("#depart-person-table tbody");
							tableBody.empty();
							scsAjax({
								url: "/FDepart/SelectDepartPerson",
								params: {
									depart: [treeElData("entity-id")],
									token: "<s:property value='session.currentUserId' />",
									page: pageIndex + 1,
									pageSize: global_page_size
								},
								success: function(data) {
									if (data.resultCode >= 0) {
										$.each(data.resultValue, function() {
											tableBody.append(
												("<tr data-post='{0}' data-name='{1}'>" + 
													"<td>{1}</td>" + 
													"<td>{2}</td>" + 
													"<td>{3}</td>" + 
													"<td>{4}</td>" + 
													"<td>{5}</td>" + 
													"<td class='uk-text-center'><a class='delete'>删除</a></td>" + 
												"</tr>").format(this.POST, this.NAME, this.MOBILE, this.POST_PID_NAME, this.FIRM_DEP_NAME, this.FIRM_NAME)
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
						target.append(pagination);
						$("#depart-person-add-header").html("{0}&nbsp;&nbsp;导入人员".format(treeElData("name")));
						target.show();
						paginationComponet.selectPage(0);
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		}
		
		function buildPostPerson() {
			cleanup();
			scsAjax({
				url: "/FDepart/SelectPersonFromDepPost",
				params: {
					departPost: [treeElData("entity-id")],
					token: "<s:property value='session.currentUserId' />",
					page: 1,
					pageSize: global_page_size
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						var target = $("#post-person");
						target.children("h3").html("{0}&nbsp;&nbsp;人员列表".format(treeElData("name")));
						var pagination = $("<ul class='uk-pagination'></ul>");
						var paginationComponet = UIkit.pagination(pagination, {
							items: data.rowSize,
							itemsOnPage: global_page_size
						});
						pagination.on("select.uk.pagination", function(event, pageIndex) {
							$.isLoading();
							var tableBody = $("#post-person-table tbody");
							tableBody.empty();
							scsAjax({
								url: "/FDepart/SelectPersonFromDepPost",
								params: {
									departPost: [treeElData("entity-id")],
									token: "<s:property value='session.currentUserId' />",
									page: pageIndex + 1,
									pageSize: global_page_size
								},
								success: function(data) {
									if (data.resultCode >= 0) {
										$.each(data.resultValue, function() {
											tableBody.append(
												("<tr data-post='{0}' data-name='{1}'>" + 
													"<td>{1}</td>" + 
													"<td>{2}</td>" + 
													"<td>{3}</td>" + 
													"<td>{4}</td>" + 
													"<td>{5}</td>" + 
													"<td class='uk-text-center'><a class='delete'>删除</a></td>" + 
												"</tr>").format(this.POST, this.NAME, this.MOBILE, this.POST_PID_NAME, this.FIRM_DEP_NAME, this.FIRM_NAME)
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
						target.append(pagination);
						$("#post-person-addnew-header").html("{0}&nbsp;&nbsp;新增人员".format(treeElData("name")));
						$("#post-person-add-header").html("{0}&nbsp;&nbsp;导入人员".format(treeElData("name")));
						target.show();
						paginationComponet.selectPage(0);
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		}
		
		$("#organization-tree").tree({
			dataUrl: "<s:url action='organization!listChildNodes' namespace='/'><s:param name='firmRootID' value='cookies.firmRootID' /></s:url>",
			autoOpen: 0,
			onCreateLi: function(node, li) {
				var treeEl = li.find(".jqtree-element");
				treeEl.data({
					"entity-id": node.entity_id,
					"id": node.id,
					"name": node.name,
					"post-pid": node.post_pid,
					"post-pname": node.post_pname,
					"role-id": node.role_id,
					"firm-root-id": node.getLevel() == 1 || node.parent.entity_id == -1 ? node.entity_id : $(node.parent.element).children(".jqtree-element").data("firm-root-id"),
					"firm-id": node.entity_type == "firm" ? node.entity_id : $(node.parent.element).children(".jqtree-element").data("firm-id")
				});
				treeEl.append(
					("<div class='uk-button-dropdown' data-uk-dropdown='{delay: 500}'>" + 
						"<button type='button' class='uk-button uk-button-link'>操作<i class='uk-icon-caret-down uk-margin-small-left'></i></button>" + 
						"<div class='uk-dropdown uk-dropdown-small'>" + 
							"<ul class='uk-nav uk-nav-dropdown'>" + 
								"<li class='uk-nav-header'>{0}</li>" + 
								"<li class='{1}'><a class='firm-add'>新增企业</a></li>" + 
								"<li class='{2}'><a class='depart-add'>新增部门</a></li>" + 
								"<li class='{3}'><a class='post-add'>新增岗位</a></li>" + 
								"<li class='{4}'><a class='firm-modify'>编辑</a></li>" + 
								"<li class='{5}'><a class='depart-modify'>编辑</a></li>" + 
								"<li class='{6}'><a class='post-modify'>编辑</a></li>" + 
								"<li class='{7}'><a class='firm-delete'>删除</a></li>" + 
								"<li class='{8}'><a class='depart-delete'>删除</a></li>" + 
								"<li class='{9}'><a class='post-delete'>删除</a></li>" + 
								"<li class='{10}'><a class='depart-role-modify'>角色设置</a></li>" + 
								"<li class='{11}'><a class='post-role-modify'>角色设置</a></li>" + 
								"<li class='{12}'><a class='firm-map-view'>查看地图</a></li>" + 
							"</ul>" + 
						"</div>" + 
					"</div>").format(
						node.name,
						node.entity_type == "firm" ? "" : "uk-hidden",
						node.entity_type == "firm" && node.entity_id != -1 || node.entity_type == "depart" ? "" : "uk-hidden",
						node.entity_type == "depart" ? "" : "uk-hidden",
						node.entity_type == "firm" && node.entity_id != -1 ? "" : "uk-hidden",
						node.entity_type == "depart" ? "" : "uk-hidden",
						node.entity_type == "post" ? "" : "uk-hidden",
						node.entity_type == "firm" && node.getLevel() != 1 ? "" : "uk-hidden",
						node.entity_type == "depart" ? "" : "uk-hidden",
						node.entity_type == "post" ? "" : "uk-hidden",
						node.entity_type == "depart" ? "" : "uk-hidden",
						node.entity_type == "post" ? "" : "uk-hidden",
						node.entity_type == "firm" && node.entity_id != -1 ? "" : "uk-hidden"
					)
				);
			},
			onLoadFailed: function() {
				UIkit.notify("展开节点时发生错误", {
					status: "danger"
				});
			}
		});
		$("#organization-tree").on("tree.init", function() {
			var tree = $(this);
			tree.tree("selectNode", tree.tree("getTree").children[0]);
		});
		$("#organization-tree").on("tree.select", function(event) {
			var node = event.node;
			if (node)
				switch (node.entity_type) {
					case "firm":
						if (node.entity_id == -1) {
							cleanup();
						} else {
							$(this).data("current-node-id-for-view", node.id);
							buildFirmPerson();
						}
						break;
					case "depart":
						$(this).data("current-node-id-for-view", node.id);
						buildDepartPerson();
						break;
					case "post":
						$(this).data("current-node-id-for-view", node.id);
						buildPostPerson();
						break;
				}
			else
				cleanup();
		});
		$("#organization-tree").on("click", ".uk-dropdown", function(event) {
			event.stopPropagation();
		});
		$("#organization-tree").on("click", ".firm-add", function() {
			var treeEl = $(this).closest(".jqtree-element");
			$("#organization-tree").data("current-node-id", treeEl.data("id"));
			$("#firm-add-header").html("{0}&nbsp;&nbsp;新增企业".format(treeEl.data("name")));
			$("#firm-add-form [name='PID']").val(treeEl.data("entity-id"));
			$("#firm-add-button").click();
		});
		$("#organization-tree").on("click", ".depart-add", function() {
			var treeEl = $(this).closest(".jqtree-element");
			$("#organization-tree").data("current-node-id", treeEl.data("id"));
			$("#depart-add-header").html("{0}&nbsp;&nbsp;新增部门".format(treeEl.data("name")));
			$("#depart-add-form [name='pid']").val(treeEl.data("entity-id"));
			$("#depart-add-button").click();
		});
		$("#organization-tree").on("click", ".post-add", function() {
			var treeEl = $(this).closest(".jqtree-element");
			$("#organization-tree").data("current-node-id", treeEl.data("id"));
			$("#post-add-header").html("{0}&nbsp;&nbsp;新增岗位".format(treeEl.data("name")));
			$("#post-add-form [name='firmDep']").val(treeEl.data("entity-id"));
			var tree = $("<div class='uk-border-rounded'></div>");
			tree.tree({
				dataUrl: "<s:url action='organization!listChildNodes' namespace='/' />?firmRootID={0}".format(treeEl.data("firm-root-id")),
				autoOpen: 0,
				onCreateLi: function(node, li) {
					if (node.entity_type == "post")
						li.find(".jqtree-title").html("<input type='checkbox' class='jqtree-checkbox' />&nbsp;{0}".format(node.name));
				},
				onLoadFailed: function() {
					UIkit.notify("展开节点时发生错误", {
						status: "danger"
					});
				}
			});
			tree.on("tree.click", function(event) {
				var node = event.node;
				var source = event.click_event.target;
				var $source = $(source);
				if ($source.hasClass("jqtree-checkbox")) {
					event.preventDefault();
					$(this).find(".jqtree-checkbox").each(function() {
						if (this != source)
							$(this).prop("checked", false);
					});
					$("#post-add-form [name='postPID']").val($source.prop("checked") ? node.entity_id : "");
					$("#post-add-form [name='pname']").val($source.prop("checked") ? node.name : "");
				}
			});
			$("#organization-tree-1").append(tree);
			$("#post-add-button").click();
		});
		$("#organization-tree").on("click", ".firm-modify", function() {
			$("#dummy-button").click();
			var treeEl = $(this).closest(".jqtree-element");
			scsAjax({
				url: "/FFirm/SelectFirm",
				params: {
					firmID: treeEl.data("entity-id"),
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						var photo = data.resultValue[0].BL_PHOTO;
						$("#organization-tree").data("current-node-id", treeEl.data("id"));
						$("#firm-modify-header").html("{0}&nbsp;&nbsp;编辑企业".format(treeEl.data("name")));
						$("#firm-modify-form [name='firmID']").val(treeEl.data("entity-id"));
						$("#firm-modify-form [name='BLPhoto']").val(photo);
						$("#firm-modify-form [name='name']").val(treeEl.data("name"));
						$("#firm-modify-form [name='shortName']").val(data.resultValue[0].SHORT_NAME);
						$("#firm-modify-form [name='orgCode']").val(data.resultValue[0].ORG_CODE);
						var select1 = $("#firm-modify-form [name='address.province']");
						var select2 = $("#firm-modify-form [name='address.city']");
						var select3 = $("#firm-modify-form [name='address.county']");
						scsAjax({
							url: "/UtiDomain/SelectProvince",
							params: {
								PID: 0
							},
							success: function(data1) {
								if (data1.resultCode >= 0) {
									select1.append("<option value='' {0}>请选择</option>".format(0 == data.resultValue[0].PROVINCE ? "selected" : ""));
									$.each(data1.resultValue, function() {
										select1.append("<option value='{1}' {3} data-id='{0}'>{2}</option>".format(this.ID, this.VALUE, this.NAME, this.VALUE == data.resultValue[0].PROVINCE ? "selected" : ""));
									});
									var id = select1.children(":selected").data("id");
									if (id == undefined) {
										select2.append("<option value='' selected>请选择</option>");
										select3.append("<option value='' selected>请选择</option>");
									} else {
										scsAjax({
											url: "/UtiDomain/SelectProvince",
											params: {
												PID: id
											},
											success: function(data2) {
												if (data2.resultCode >= 0) {
													select2.append("<option value='' {0}>请选择</option>".format(0 == data.resultValue[0].CITY ? "selected" : ""));
													$.each(data2.resultValue, function() {
														select2.append("<option value='{1}' {3} data-id='{0}'>{2}</option>".format(this.ID, this.VALUE, this.NAME, this.VALUE == data.resultValue[0].CITY ? "selected" : ""));
													});
													var id = select2.children(":selected").data("id");
													if (id == undefined)
														select3.append("<option value='' selected>请选择</option>");
													else
														scsAjax({
															url: "/UtiDomain/SelectProvince",
															params: {
																PID: id
															},
															success: function(data3) {
																if (data3.resultCode >= 0) {
																	select3.append("<option value='' {0}>请选择</option>".format(0 == data.resultValue[0].COUNTY ? "selected" : ""));
																	$.each(data3.resultValue, function() {
																		select3.append("<option value='{1}' {3} data-id='{0}'>{2}</option>".format(this.ID, this.VALUE, this.NAME, this.VALUE == data.resultValue[0].COUNTY ? "selected" : ""));
																	});
																} else {
																	UIkit.notify(data3.resultHint, {
																		status: "danger"
																	});
																}
															}
														});
												} else {
													UIkit.notify(data2.resultHint, {
														status: "danger"
													});
												}
											}
										});
									}
								} else {
									UIkit.notify(data1.resultHint, {
										status: "danger"
									});
								}
							}
						});
						$("#firm-modify-form [name='address.detail']").val(data.resultValue[0].DETAIL);
						$("#firm-modify-form [name='address.code']").val(data.resultValue[0].CODE);
						if (photo != "")
							$("#firm-photo-x").append("<img src='{0}' class='uk-border-rounded' />".format(photo));
						$("#firm-modify-button").click();
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		});
		$("#organization-tree").on("click", ".depart-modify", function() {
			var treeEl = $(this).closest(".jqtree-element");
			$("#organization-tree").data("current-node-id", treeEl.data("id"));
			$("#depart-modify-header").html("{0}&nbsp;&nbsp;编辑部门".format(treeEl.data("name")));
			$("#depart-modify-form [name='depart']").val(treeEl.data("entity-id"));
			$("#depart-modify-form [name='name']").val(treeEl.data("name"));
			$("#depart-modify-button").click();
		});
		$("#organization-tree").on("click", ".post-modify", function() {
			var treeEl = $(this).closest(".jqtree-element");
			$("#organization-tree").data("current-node-id", treeEl.data("id"));
			$("#post-modify-header").html("{0}&nbsp;&nbsp;编辑岗位".format(treeEl.data("name")));
			$("#post-modify-form [name='post']").val(treeEl.data("entity-id"));
			$("#post-modify-form [name='postPID']").val(treeEl.data("post-pid"));
			$("#post-modify-form [name='name']").val(treeEl.data("name"));
			$("#post-modify-form [name='pname']").val(treeEl.data("post-pname"));
			var tree = $("<div class='uk-border-rounded'></div>");
			tree.tree({
				dataUrl: "<s:url action='organization!listChildNodes' namespace='/' />?firmRootID={0}".format(treeEl.data("firm-root-id")),
				autoOpen: 0,
				onCreateLi: function(node, li) {
					if (node.entity_type == "post")
						li.find(".jqtree-title").html("<input type='checkbox' class='jqtree-checkbox' />&nbsp;{0}".format(node.name));
				},
				onLoadFailed: function() {
					UIkit.notify("展开节点时发生错误", {
						status: "danger"
					});
				}
			});
			tree.on("tree.click", function(event) {
				var node = event.node;
				var source = event.click_event.target;
				var $source = $(source);
				if ($source.hasClass("jqtree-checkbox")) {
					event.preventDefault();
					$(this).find(".jqtree-checkbox").each(function() {
						if (this != source)
							$(this).prop("checked", false);
					});
					$("#post-modify-form [name='postPID']").val($source.prop("checked") ? node.entity_id : "");
					$("#post-modify-form [name='pname']").val($source.prop("checked") ? node.name : "");
				}
			});
			$("#organization-tree-2").append(tree);
			$("#post-modify-button").click();
		});
		$("#organization-tree").on("click", ".firm-delete", function() {
			$("#dummy-button").click();
			var treeEl = $(this).closest(".jqtree-element");
			UIkit.modal.confirm("确定要删除{0}吗?".format(treeEl.data("name")), function() {
				scsAjax({
					url: "/FFirm/DeleteFirm",
					params: {
						firmID: treeEl.data("entity-id"),
						token: "<s:property value='session.currentUserId' />"
					},
					success: function(data) {
						var tree = $("#organization-tree");
						if (data.resultCode >= 0)
							tree.tree("loadDataFromUrl", tree.tree("getNodeById", treeEl.data("id")).parent);
						else
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
					}
				});
			});
		});
		$("#organization-tree").on("click", ".depart-delete", function() {
			$("#dummy-button").click();
			var treeEl = $(this).closest(".jqtree-element");
			UIkit.modal.confirm("确定要删除{0}吗?".format(treeEl.data("name")), function() {
				scsAjax({
					url: "/FDepart/DeleteFirmDepart",
					params: {
						depart: treeEl.data("entity-id"),
						token: "<s:property value='session.currentUserId' />"
					},
					success: function(data) {
						var tree = $("#organization-tree");
						if (data.resultCode >= 0)
							tree.tree("loadDataFromUrl", tree.tree("getNodeById", treeEl.data("id")).parent);
						else
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
					}
				});
			});
		});
		$("#organization-tree").on("click", ".post-delete", function() {
			$("#dummy-button").click();
			var treeEl = $(this).closest(".jqtree-element");
			UIkit.modal.confirm("确定要删除{0}吗?".format(treeEl.data("name")), function() {
				scsAjax({
					url: "/FDepart/DeletePostFromFirmDepart",
					params: {
						departPost: treeEl.data("entity-id"),
						token: "<s:property value='session.currentUserId' />"
					},
					success: function(data) {
						var tree = $("#organization-tree");
						if (data.resultCode >= 0)
							tree.tree("loadDataFromUrl", tree.tree("getNodeById", treeEl.data("id")).parent);
						else
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
					}
				});
			});
		});
		$("#organization-tree").on("click", ".depart-role-modify", function() {
			$("#dummy-button").click();
			var treeEl = $(this).closest(".jqtree-element");
			var roleId = treeEl.data("role-id");
			scsAjax({
				url: "/FPrivilege/SelectAllRole",
				params: {
					firm: treeEl.data("firm-id"),
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						$("#organization-tree").data("current-node-id", treeEl.data("id"));
						$("#depart-role-modify-header").html("{0}&nbsp;&nbsp;角色设置".format(treeEl.data("name")));
						$("#depart-role-modify-form [name='firmDep']").val(treeEl.data("entity-id"));
						var select = $("#depart-role-modify-form [name='roleID']");
						select.append("<option value='0' {0}>无</option>".format(0 == roleId ? "selected" : ""));
						$.each(data.resultValue, function() {
							select.append("<option value='{0}' {2}>{1}</option>".format(this.ID, this.NAME, this.ID == roleId ? "selected" : ""));
						});
						$("#depart-role-modify-button").click();
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		});
		$("#organization-tree").on("click", ".post-role-modify", function() {
			$("#dummy-button").click();
			var treeEl = $(this).closest(".jqtree-element");
			var roleId = treeEl.data("role-id");
			scsAjax({
				url: "/FPrivilege/SelectAllRole",
				params: {
					firm: treeEl.data("firm-id"),
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						$("#organization-tree").data("current-node-id", treeEl.data("id"));
						$("#post-role-modify-header").html("{0}&nbsp;&nbsp;角色设置".format(treeEl.data("name")));
						$("#post-role-modify-form [name='post']").val(treeEl.data("entity-id"));
						var select = $("#post-role-modify-form [name='roleID']");
						select.append("<option value='0' {0}>无</option>".format(0 == roleId ? "selected" : ""));
						$.each(data.resultValue, function() {
							select.append("<option value='{0}' {2}>{1}</option>".format(this.ID, this.NAME, this.ID == roleId ? "selected" : ""));
						});
						$("#post-role-modify-button").click();
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		});
		$("#organization-tree").on("click", ".firm-map-view", function() {
			$("#firm-map iframe").attr("src", "<s:url action='map' namespace='/' />?firmID={0}".format($(this).closest(".jqtree-element").data("entity-id")));
			$("#firm-map-view-button").click();
		});
		
		$("#firm-add").on("hide.uk.modal", function() {
			$("#firm-add-header").html("");
			$("#firm-add-form [name='PID']").val("");
			$("#firm-add-form [name='BLPhoto']").val("");
			$("#firm-add-form [name='address.city']").children().slice(1).remove();
			$("#firm-add-form [name='address.county']").children().slice(1).remove();
			$("#firm-add-form").validate().resetForm();
			$("#firm-photo").empty();
		});
		$("#firm-add-save-button").click(function() {
			$("#firm-add-form").submit();
		});
		scsAjax({
			url: "/UtiDomain/SelectProvince",
			params: {
				PID: 0
			},
			success: function(data) {
				var select = $("#firm-add-form [name='address.province']");
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
		$("#firm-add-form [name='address.province']").change([$("#firm-add-form [name='address.city']"), $("#firm-add-form [name='address.county']")], addressHandler);
		$("#firm-add-form [name='address.city']").change([$("#firm-add-form [name='address.county']")], addressHandler);
		var firmPhotoUpload = $("#firm-photo-upload");
		imageUploadSelect({
			trigger: firmPhotoUpload,
			progress: firmPhotoUpload.closest(".uk-form-row").find(".uk-progress"),
			complete: function(data) {
				if (data) {
					$("#firm-add-form [name='BLPhoto']").val(data.attachmentUrl);
					$("#firm-photo").empty();
					$("#firm-photo").append("<img src='{0}' class='uk-border-rounded' />".format(data.attachmentUrl));
				} else {
					UIkit.notify("上传失败", {
						status: "danger"
					});
				}
			}
		});
		$("#firm-add-form").validate({
			rules: {
				name: "required"
			},
			messages: {
				name: "企业名称不能为空"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/FFirm/CreateFirm",
					params: $.extend(params, {
						address: {
							province: params["address.province"],
							city: params["address.city"],
							county: params["address.county"],
							detail: params["address.detail"],
							code: params["address.code"]
						}
					}),
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#firm-add-close-button").click();
							var tree = $("#organization-tree");
							tree.tree("loadDataFromUrl", tree.tree("getNodeById", tree.data("current-node-id")));
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
		
		$("#depart-add").on("hide.uk.modal", function() {
			$("#depart-add-header").html("");
			$("#depart-add-form [name='pid']").val("");
			$("#depart-add-form").validate().resetForm();
		});
		$("#depart-add-save-button").click(function() {
			$("#depart-add-form").submit();
		});
		$("#depart-add-form").validate({
			rules: {
				name: "required"
			},
			messages: {
				name: "部门名称不能为空"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/FDepart/CreateFirmDepart",
					params: params,
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#depart-add-close-button").click();
							var tree = $("#organization-tree");
							tree.tree("loadDataFromUrl", tree.tree("getNodeById", tree.data("current-node-id")));
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
		
		$("#post-add").on("hide.uk.modal", function() {
			$("#post-add-header").html("");
			$("#post-add-form [name='firmDep']").val("");
			$("#post-add-form [name='postPID']").val("");
			$("#organization-tree-1").empty();
			$("#post-add-form").validate().resetForm();
		});
		$("#post-add-save-button").click(function() {
			$("#post-add-form").submit();
		});
		$("#post-add-form").validate({
			rules: {
				name: "required"
			},
			messages: {
				name: "岗位名称不能为空"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/FDepart/CreatePostToFirmDepart",
					params: params,
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#post-add-close-button").click();
							var tree = $("#organization-tree");
							tree.tree("loadDataFromUrl", tree.tree("getNodeById", tree.data("current-node-id")));
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
		
		$("#firm-modify").on("hide.uk.modal", function() {
			$("#firm-modify-header").html("");
			$("#firm-modify-form [name='firmID']").val("");
			$("#firm-modify-form [name='BLPhoto']").val("");
			$("#firm-modify-form [name='address.province']").empty();
			$("#firm-modify-form [name='address.city']").empty();
			$("#firm-modify-form [name='address.county']").empty();
			$("#firm-modify-form").validate().resetForm();
			$("#firm-photo-x").empty();
		});
		$("#firm-modify-save-button").click(function() {
			$("#firm-modify-form").submit();
		});
		$("#firm-modify-form [name='address.province']").change([$("#firm-modify-form [name='address.city']"), $("#firm-modify-form [name='address.county']")], addressHandler);
		$("#firm-modify-form [name='address.city']").change([$("#firm-modify-form [name='address.county']")], addressHandler);
		var firmPhotoXUpload = $("#firm-photo-x-upload");
		imageUploadSelect({
			trigger: firmPhotoXUpload,
			progress: firmPhotoXUpload.closest(".uk-form-row").find(".uk-progress"),
			complete: function(data) {
				if (data) {
					$("#firm-modify-form [name='BLPhoto']").val(data.attachmentUrl);
					$("#firm-photo-x").empty();
					$("#firm-photo-x").append("<img src='{0}' class='uk-border-rounded' />".format(data.attachmentUrl));
				} else {
					UIkit.notify("上传失败", {
						status: "danger"
					});
				}
			}
		});
		$("#firm-modify-form").validate({
			rules: {
				name: "required"
			},
			messages: {
				name: "企业名称不能为空"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/FFirm/ModifyFirm",
					params: $.extend(params, {
						address: {
							province: params["address.province"],
							city: params["address.city"],
							county: params["address.county"],
							detail: params["address.detail"],
							code: params["address.code"]
						}
					}),
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#firm-modify-close-button").click();
							var tree = $("#organization-tree");
							tree.tree("loadDataFromUrl", tree.tree("getNodeById", tree.data("current-node-id")).parent);
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
		
		$("#depart-modify").on("hide.uk.modal", function() {
			$("#depart-modify-header").html("");
			$("#depart-modify-form [name='depart']").val("");
			$("#depart-modify-form").validate().resetForm();
		});
		$("#depart-modify-save-button").click(function() {
			$("#depart-modify-form").submit();
		});
		$("#depart-modify-form").validate({
			rules: {
				name: "required"
			},
			messages: {
				name: "部门名称不能为空"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/FDepart/ModifyFirmDepart",
					params: params,
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#depart-modify-close-button").click();
							var tree = $("#organization-tree");
							tree.tree("loadDataFromUrl", tree.tree("getNodeById", tree.data("current-node-id")).parent);
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
		
		$("#post-modify").on("hide.uk.modal", function() {
			$("#post-modify-header").html("");
			$("#post-modify-form [name='post']").val("");
			$("#post-modify-form [name='postPID']").val("");
			$("#organization-tree-2").empty();
			$("#post-modify-form").validate().resetForm();
		});
		$("#post-modify-save-button").click(function() {
			$("#post-modify-form").submit();
		});
		$("#post-modify-form").validate({
			rules: {
				name: "required"
			},
			messages: {
				name: "岗位名称不能为空"
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/FDepart/ModifyPost",
					params: params,
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#post-modify-close-button").click();
							var tree = $("#organization-tree");
							tree.tree("loadDataFromUrl", tree.tree("getNodeById", tree.data("current-node-id")).parent);
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
		
		$("#depart-role-modify").on("hide.uk.modal", function() {
			$("#depart-role-modify-header").html("");
			$("#depart-role-modify-form [name='firmDep']").val("");
			$("#depart-role-modify-form [name='roleID']").empty();
		});
		$("#depart-role-modify-save-button").click(function() {
			$("#depart-role-modify-form").submit();
		});
		$("#depart-role-modify-form").submit(function(event) {
			event.preventDefault();
			var params = {};
			$.each($(this).serializeArray(), function() {
				params[this.name] = this.value;
			});
			scsAjax({
				url: "/FPrivilege/SetRoleToPost",
				params: params,
				success: function(data) {
					if (data.resultCode >= 0) {
						$("#depart-role-modify-close-button").click();
						var tree = $("#organization-tree");
						tree.tree("loadDataFromUrl", tree.tree("getNodeById", tree.data("current-node-id")).parent);
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		});
		
		$("#post-role-modify").on("hide.uk.modal", function() {
			$("#post-role-modify-header").html("");
			$("#post-role-modify-form [name='post']").val("");
			$("#post-role-modify-form [name='roleID']").empty();
		});
		$("#post-role-modify-save-button").click(function() {
			$("#post-role-modify-form").submit();
		});
		$("#post-role-modify-form").submit(function(event) {
			event.preventDefault();
			var params = {};
			$.each($(this).serializeArray(), function() {
				params[this.name] = this.value;
			});
			scsAjax({
				url: "/FPrivilege/SetRoleToPost",
				params: params,
				success: function(data) {
					if (data.resultCode >= 0) {
						$("#post-role-modify-close-button").click();
						var tree = $("#organization-tree");
						tree.tree("loadDataFromUrl", tree.tree("getNodeById", tree.data("current-node-id")).parent);
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		});
		
		$("#firm-map-view").on("hide.uk.modal", function() {
			$("#firm-map iframe").attr("src", "<s:url action='blank' namespace='/' />");
		});
		
		$("#firm-person-form").submit(function(event) {
			event.preventDefault();
			var params = {};
			$.each($(this).serializeArray(), function() {
				params[this.name] = this.value;
			});
			buildFirmPerson(params);
		});
		$("#firm-person-table tbody").on("click", ".delete", function() {
			var tableRow = $(this).closest("tr");
			UIkit.modal.confirm("确定要删除{0}吗?".format(tableRow.data("name")), function() {
				scsAjax({
					url: "/UtiPerson/SetPost",
					params: {
						person: tableRow.data("person"),
						post: tableRow.data("post"),
						detach: 1,
						token: "<s:property value='session.currentUserId' />"
					},
					success: function(data) {
						if (data.resultCode >= 0)
							buildFirmPerson();
						else
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
					}
				});
			});
		});
		
		$("#firm-person-addnew").on("hide.uk.modal", function() {
			$("#firm-person-addnew-form").validate().resetForm();
		});
		$("#firm-person-addnew-save-button").click(function() {
			$("#firm-person-addnew-form").submit();
		});
		$("#firm-person-addnew-form").validate({
			rules: {
				name: "required",
				mobile: {
					required: true,
					rangelength: [11, 11]
				},
				email: {
					required: true,
					email: true
				}
			},
			messages: {
				name: "姓名不能为空",
				mobile: {
					required: "手机号码不能为空",
					rangelength: "请输入11位手机号码"
				},
				email: {
					required: "邮箱不能为空",
					email: "邮箱格式不正确"
				}
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/Person/Create",
					params: $.extend(params, {
						pwd: params.mobile,
						firm: {
							ID: treeElData("entity-id")
						}
					}),
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#firm-person-addnew-close-button").click();
							buildFirmPerson();
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
		
		$("#firm-person-add").on("hide.uk.modal", function() {
			$("#firm-person-add-form").get(0).reset();
			$("#firm-person-add-table .row-select-all").prop("checked", false);
			$("#firm-person-add-table tbody").empty();
		});
		$("#firm-person-add-form").submit(function(event) {
			event.preventDefault();
			$("#firm-person-add-table").trigger("load.uk.table");
		});
		$("#firm-person-add-table").on("load.uk.table", function() {
			var searchText = $.trim($("#firm-person-add-form [name='searchText']").val());
			if (searchText == "")
				return;
			
			$(this).find(".row-select-all").prop("checked", false);
			var tableBody = $(this).children("tbody");
			tableBody.empty();
			scsAjax({
				url: "/UtiPerson/SelectByNameMobile",
				params: {
					param: searchText.split(/\s+/),
					firmID: -2,
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0)
						$.each(data.resultValue, function() {
							tableBody.append(
								("<tr data-post='{0}'>" + 
									"<td class='uk-text-center'><input type='checkbox' class='row-select' /></td>" + 
									"<td>{1}</td>" + 
									"<td>{2}</td>" + 
									"<td>{3}</td>" + 
								"</tr>").format(this.POST, this.NAME, this.MOBILE, this.EMAIL)
							);
						});
					else
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
				}
			});
		});
		$("#firm-person-add-table .row-select-all").change(function() {
			$("#firm-person-add-table .row-select").prop("checked", $(this).prop("checked"));
		});
		$("#firm-person-add-table tbody").on("change", ".row-select", function() {
			var checked = true;
			$("#firm-person-add-table .row-select").each(function() {
				checked = checked && $(this).prop("checked");
			});
			$("#firm-person-add-table .row-select-all").prop("checked", checked);
		});
		$("#firm-person-add-save-button").click(function() {
			var ids = $("#firm-person-add-table .row-select:checked").map(function() {
				return $(this).closest("tr").data("post");
			}).get();
			if (ids.length == 0) {
				UIkit.notify("请选择要导入的人员", {
					status: "warning"
				});
				return;
			}
			
			scsAjax({
				url: "/FFirm/AddPersonToFirm",
				params: {
					post: ids,
					firmID: treeElData("entity-id"),
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						$("#firm-person-add-close-button").click();
						buildFirmPerson();
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		});
		
		$("#depart-person-table tbody").on("click", ".delete", function() {
			var tableRow = $(this).closest("tr");
			UIkit.modal.confirm("确定要删除{0}吗?".format(tableRow.data("name")), function() {
				scsAjax({
					url: "/FDepart/DeletePersonFromFirmDepart",
					params: {
						personPost: [tableRow.data("post")],
						depart: treeElData("entity-id"),
						token: "<s:property value='session.currentUserId' />"
					},
					success: function(data) {
						if (data.resultCode >= 0)
							buildDepartPerson();
						else
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
					}
				});
			});
		});
		
		$("#depart-person-add").on("hide.uk.modal", function() {
			$("#depart-person-add-form").get(0).reset();
			$("#depart-person-add-table .row-select-all").prop("checked", false);
			$("#depart-person-add-table tbody").empty();
		});
		$("#depart-person-add-form").submit(function(event) {
			event.preventDefault();
			$("#depart-person-add-table").trigger("load.uk.table");
		});
		$("#depart-person-add-table").on("load.uk.table", function() {
			var searchText = $.trim($("#depart-person-add-form [name='searchText']").val());
			if (searchText == "")
				return;
			
			$(this).find(".row-select-all").prop("checked", false);
			var tableBody = $(this).children("tbody");
			tableBody.empty();
			scsAjax({
				url: "/UtiPerson/SelectByNameMobile",
				params: {
					param: searchText.split(/\s+/),
					firmID: treeElData("firm-id"),
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0)
						$.each(data.resultValue, function() {
							tableBody.append(
								("<tr data-post='{0}'>" + 
									"<td class='uk-text-center'><input type='checkbox' class='row-select' /></td>" + 
									"<td>{1}</td>" + 
									"<td>{2}</td>" + 
									"<td>{3}</td>" + 
								"</tr>").format(this.POST, this.NAME, this.MOBILE, this.EMAIL)
							);
						});
					else
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
				}
			});
		});
		$("#depart-person-add-table .row-select-all").change(function() {
			$("#depart-person-add-table .row-select").prop("checked", $(this).prop("checked"));
		});
		$("#depart-person-add-table tbody").on("change", ".row-select", function() {
			var checked = true;
			$("#depart-person-add-table .row-select").each(function() {
				checked = checked && $(this).prop("checked");
			});
			$("#depart-person-add-table .row-select-all").prop("checked", checked);
		});
		$("#depart-person-add-save-button").click(function() {
			var ids = $("#depart-person-add-table .row-select:checked").map(function() {
				return $(this).closest("tr").data("post");
			}).get();
			if (ids.length == 0) {
				UIkit.notify("请选择要导入的人员", {
					status: "warning"
				});
				return;
			}
			
			scsAjax({
				url: "/FDepart/AddPersonToFirmDepart",
				params: {
					personPost: ids,
					depart: treeElData("entity-id"),
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						$("#depart-person-add-close-button").click();
						buildDepartPerson();
					} else {
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
					}
				}
			});
		});
		
		$("#post-person-table tbody").on("click", ".delete", function() {
			var tableRow = $(this).closest("tr");
			UIkit.modal.confirm("确定要删除{0}吗?".format(tableRow.data("name")), function() {
				scsAjax({
					url: "/FDepart/DeletePersonFromDepPost",
					params: {
						personPost: [tableRow.data("post")],
						departPost: treeElData("entity-id"),
						token: "<s:property value='session.currentUserId' />"
					},
					success: function(data) {
						if (data.resultCode >= 0)
							buildPostPerson();
						else
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
					}
				});
			});
		});
		
		$("#post-person-addnew").on("hide.uk.modal", function() {
			$("#post-person-addnew-form").validate().resetForm();
		});
		$("#post-person-addnew-save-button").click(function() {
			$("#post-person-addnew-form").submit();
		});
		$("#post-person-addnew-form").validate({
			rules: {
				name: "required",
				mobile: {
					required: true,
					rangelength: [11, 11]
				},
				email: {
					required: true,
					email: true
				}
			},
			messages: {
				name: "姓名不能为空",
				mobile: {
					required: "手机号码不能为空",
					rangelength: "请输入11位手机号码"
				},
				email: {
					required: "邮箱不能为空",
					email: "邮箱格式不正确"
				}
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/FDepart/CreatePersonToDepPost",
					params: $.extend(params, {
						departPost: treeElData("entity-id")
					}),
					success: function(data) {
						if (data.resultCode >= 0) {
							$("#post-person-addnew-close-button").click();
							buildPostPerson();
						} else {
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
						}
					}
				});
			}
		});
		
		$("#post-person-add").on("hide.uk.modal", function() {
			$("#post-person-add-form").get(0).reset();
			$("#post-person-add-table .row-select-all").prop("checked", false);
			$("#post-person-add-table tbody").empty();
		});
		$("#post-person-add-form").submit(function(event) {
			event.preventDefault();
			$("#post-person-add-table").trigger("load.uk.table");
		});
		$("#post-person-add-table").on("load.uk.table", function() {
			var searchText = $.trim($("#post-person-add-form [name='searchText']").val());
			if (searchText == "")
				return;
			
			$(this).find(".row-select-all").prop("checked", false);
			var tableBody = $(this).children("tbody");
			tableBody.empty();
			scsAjax({
				url: "/UtiPerson/SelectByNameMobile",
				params: {
					param: searchText.split(/\s+/),
					firmID: treeElData("firm-id"),
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0)
						$.each(data.resultValue, function() {
							tableBody.append(
								("<tr data-post='{0}'>" + 
									"<td class='uk-text-center'><input type='checkbox' class='row-select' /></td>" + 
									"<td>{1}</td>" + 
									"<td>{2}</td>" + 
									"<td>{3}</td>" + 
								"</tr>").format(this.POST, this.NAME, this.MOBILE, this.EMAIL)
							);
						});
					else
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
				}
			});
		});
		$("#post-person-add-table .row-select-all").change(function() {
			$("#post-person-add-table .row-select").prop("checked", $(this).prop("checked"));
		});
		$("#post-person-add-table tbody").on("change", ".row-select", function() {
			var checked = true;
			$("#post-person-add-table .row-select").each(function() {
				checked = checked && $(this).prop("checked");
			});
			$("#post-person-add-table .row-select-all").prop("checked", checked);
		});
		$("#post-person-add-save-button").click(function() {
			var ids = $("#post-person-add-table .row-select:checked").map(function() {
				return $(this).closest("tr").data("post");
			}).get();
			if (ids.length == 0) {
				UIkit.notify("请选择要导入的人员", {
					status: "warning"
				});
				return;
			}
			
			scsAjax({
				url: "/FDepart/AddPersonToDepPost",
				params: {
					personPost: ids,
					departPost: treeElData("entity-id"),
					token: "<s:property value='session.currentUserId' />"
				},
				success: function(data) {
					if (data.resultCode >= 0) {
						$("#post-person-add-close-button").click();
						buildPostPerson();
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