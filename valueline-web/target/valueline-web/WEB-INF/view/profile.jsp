<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<div id="profile">
		<h2>我的资料</h2>
		<ul class="uk-tab" data-uk-tab="{connect: '#profile-switcher'}">
			<li class="<s:property value='anchor == "profile-password" ? "uk-active" : ""' />"><a>修改密码</a></li>
			<li class="<s:property value='anchor == "profile-identity" ? "uk-active" : ""' />"><a>修改姓名和手机号码</a></li>
			<li class="<s:property value='anchor == "profile-certificate" ? "uk-active" : ""' />"><a>修改证件</a></li>
			<li class="<s:property value='anchor == "profile-other" ? "uk-active" : ""' />"><a>修改其他属性</a></li>
		</ul>
		<ul id="profile-switcher" class="uk-switcher uk-margin">
			<li class="<s:property value='anchor == "profile-password" ? "uk-active" : ""' />">
				<form id="profile-password-form" class="uk-form uk-form-horizontal">
					<s:hidden name="token" value="%{session.currentUserId}" />
					<div class="uk-form-row">
						<label class="uk-form-label"><span class="vl-form-label-required">*</span>旧密码</label>
						<div class="uk-form-controls">
							<input type="password" name="oldKey" class="uk-width-1-1" />
						</div>
					</div>
					<div class="uk-form-row">
						<label class="uk-form-label"><span class="vl-form-label-required">*</span>新密码</label>
						<div class="uk-form-controls">
							<input type="password" name="key" class="uk-width-1-1" />
						</div>
					</div>
					<div class="uk-form-row">
						<label class="uk-form-label"><span class="vl-form-label-required">*</span>确认新密码</label>
						<div class="uk-form-controls">
							<input type="password" name="keyAgain" class="uk-width-1-1" />
						</div>
					</div>
					<div class="uk-form-row uk-text-center">
						<button type="submit" class="uk-button uk-button-primary">保存</button>
					</div>
				</form>
			</li>
			<li class="<s:property value='anchor == "profile-identity" ? "uk-active" : ""' />">
				<form id="profile-identity-form" class="uk-form uk-form-horizontal">
					<s:hidden name="token" value="%{session.currentUserId}" />
					<div class="uk-form-row">
						<label class="uk-form-label"><span class="vl-form-label-required">*</span>姓名</label>
						<div class="uk-form-controls">
							<s:textfield name="name" value="%{info.NAME}" class="uk-width-1-1" />
						</div>
					</div>
					<div class="uk-form-row">
						<label class="uk-form-label"><span class="vl-form-label-required">*</span>手机号码</label>
						<div class="uk-form-controls">
							<s:textfield name="mobile" value="%{info.MOBILE}" class="uk-width-1-1" />
						</div>
					</div>
					<div class="uk-form-row uk-text-center">
						<button type="submit" class="uk-button uk-button-primary">保存</button>
					</div>
				</form>
			</li>
			<li class="<s:property value='anchor == "profile-certificate" ? "uk-active" : ""' />">
				<form id="profile-certificate-form" class="uk-form uk-form-horizontal">
					<s:hidden name="identityCardPhoto" value="%{info.IDENTITY_CARD_PHOTO}" />
					<s:hidden name="identityCardPhotoO" value="%{info.IDENTITY_CARD_PHOTO_O}" />
					<s:if test="info.ROLE == 10">
					<s:hidden name="derLPhoto" value="%{info.DRI_L_PHOTO}" />
					<s:hidden name="derLPhotoO" value="%{info.DRI_L_PHOTO_O}" />
					<s:hidden name="dlPhoto" value="%{info.DL_PHOTO}" />
					<s:hidden name="dlPhotoO" value="%{info.DL_PHOTO_O}" />
					</s:if>
					<s:hidden name="token" value="%{session.currentUserId}" />
					<div class="uk-form-row">
						<label class="uk-form-label">身份证号码</label>
						<div class="uk-form-controls">
							<s:textfield name="identityCard" value="%{info.IDENTITY_CARD}" class="uk-width-1-1" />
						</div>
					</div>
					<div class="uk-form-row">
						<label class="uk-form-label">身份证照片</label>
						<div class="uk-form-controls">
							<div class="uk-form-file">
								<button type="button" class="uk-button">选择身份证照片（正面）</button>
								<input type="file" id="identity-card-photo-upload" />
							</div>
							<div class="uk-form-file">
								<button type="button" class="uk-button">选择身份证照片（反面）</button>
								<input type="file" id="identity-card-photo-o-upload" />
							</div>
							<div class="uk-progress uk-progress-success uk-progress-striped uk-active uk-hidden">
								<div class="uk-progress-bar" style="width: 0%;"></div>
							</div>
						</div>
					</div>
					<div class="uk-form-row">
						<div class="uk-form-controls">
							<div id="identity-card-photo">
								<s:if test="info.IDENTITY_CARD_PHOTO != ''">
									<img src="<s:property value='info.IDENTITY_CARD_PHOTO' />" class="uk-border-rounded" />
								</s:if>
							</div>
						</div>
					</div>
					<div class="uk-form-row">
						<div class="uk-form-controls">
							<div id="identity-card-photo-o">
								<s:if test="info.IDENTITY_CARD_PHOTO_O != ''">
									<img src="<s:property value='info.IDENTITY_CARD_PHOTO_O' />" class="uk-border-rounded" />
								</s:if>
							</div>
						</div>
					</div>
					<s:if test="info.ROLE == 10">
					<div class="uk-form-row">
						<label class="uk-form-label">驾照号码</label>
						<div class="uk-form-controls">
							<s:textfield name="driverLicense" value="%{info.DRIVER_LICENSE}" class="uk-width-1-1" />
						</div>
					</div>
					<div class="uk-form-row">
						<label class="uk-form-label">驾照照片</label>
						<div class="uk-form-controls">
							<div class="uk-form-file">
								<button type="button" class="uk-button">选择驾照照片（正面）</button>
								<input type="file" id="dri-l-photo-upload" />
							</div>
							<div class="uk-form-file">
								<button type="button" class="uk-button">选择驾照照片（反面）</button>
								<input type="file" id="dri-l-photo-o-upload" />
							</div>
							<div class="uk-progress uk-progress-success uk-progress-striped uk-active uk-hidden">
								<div class="uk-progress-bar" style="width: 0%;"></div>
							</div>
						</div>
					</div>
					<div class="uk-form-row">
						<div class="uk-form-controls">
							<div id="dri-l-photo">
								<s:if test="info.DRI_L_PHOTO != ''">
									<img src="<s:property value='info.DRI_L_PHOTO' />" class="uk-border-rounded" />
								</s:if>
							</div>
						</div>
					</div>
					<div class="uk-form-row">
						<div class="uk-form-controls">
							<div id="dri-l-photo-o">
								<s:if test="info.DRI_L_PHOTO_O != ''">
									<img src="<s:property value='info.DRI_L_PHOTO_O' />" class="uk-border-rounded" />
								</s:if>
							</div>
						</div>
					</div>
					<div class="uk-form-row">
						<label class="uk-form-label">行驶证号码</label>
						<div class="uk-form-controls">
							<s:textfield name="drivingLicense" value="%{info.DRIVING_LICENSE}" class="uk-width-1-1" />
						</div>
					</div>
					<div class="uk-form-row">
						<label class="uk-form-label">行驶证照片</label>
						<div class="uk-form-controls">
							<div class="uk-form-file">
								<button type="button" class="uk-button">选择行驶证照片（正面）</button>
								<input type="file" id="dl-photo-upload" />
							</div>
							<div class="uk-form-file">
								<button type="button" class="uk-button">选择行驶证照片（反面）</button>
								<input type="file" id="dl-photo-o-upload" />
							</div>
							<div class="uk-progress uk-progress-success uk-progress-striped uk-active uk-hidden">
								<div class="uk-progress-bar" style="width: 0%;"></div>
							</div>
						</div>
					</div>
					<div class="uk-form-row">
						<div class="uk-form-controls">
							<div id="dl-photo">
								<s:if test="info.DL_PHOTO != ''">
									<img src="<s:property value='info.DL_PHOTO' />" class="uk-border-rounded" />
								</s:if>
							</div>
						</div>
					</div>
					<div class="uk-form-row">
						<div class="uk-form-controls">
							<div id="dl-photo-o">
								<s:if test="info.DL_PHOTO_O != ''">
									<img src="<s:property value='info.DL_PHOTO_O' />" class="uk-border-rounded" />
								</s:if>
							</div>
						</div>
					</div>
					</s:if>
					<div class="uk-form-row uk-text-center">
						<button type="submit" class="uk-button uk-button-primary">保存</button>
					</div>
				</form>
			</li>
			<li class="<s:property value='anchor == "profile-other" ? "uk-active" : ""' />">
				<form id="profile-other-form" class="uk-form uk-form-horizontal">
					<s:hidden name="token" value="%{session.currentUserId}" />
					<div class="uk-form-row">
						<label class="uk-form-label">固定电话</label>
						<div class="uk-form-controls">
							<div class="uk-grid uk-grid-small">
								<div class="uk-width-1-5">
									<s:textfield name="areaCode" value="%{info.AREA_CODE}" placeholder="固话区号" class="uk-width-1-1" />
								</div>
								<div class="uk-width-4-5">
									<s:textfield name="telephone" value="%{info.TELEPHONE}" placeholder="固话号码" class="uk-width-1-1" />
								</div>
							</div>
						</div>
					</div>
					<div class="uk-form-row uk-text-center">
						<button type="submit" class="uk-button uk-button-primary">保存</button>
					</div>
				</form>
			</li>
		</ul>
	</div>
	<script type="text/javascript">
		$("#profile-password-form").validate({
			rules: {
				oldKey: "required",
				key: {
					required: true,
					minlength: 6
				},
				keyAgain: {
					equalTo: "#profile-password-form [name='key']"
				}
			},
			messages: {
				oldKey: "旧密码不能为空",
				key: {
					required: "新密码不能为空",
					minlength: "请输入至少6位字符"
				},
				keyAgain: {
					equalTo: "请输入与上面一致的密码"
				}
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/Person/ModifyKeySelf",
					params: params,
					success: function(data) {
						if (data.resultCode >= 0)
							location.assign("<s:url action='profile' namespace='/'><s:param name='anchor'>profile-password</s:param></s:url>");
						else
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
					}
				});
			}
		});
		$("#profile-identity-form").validate({
			rules: {
				name: "required",
				mobile: {
					required: true,
					rangelength: [11, 11]
				}
			},
			messages: {
				name: "姓名不能为空",
				mobile: {
					required: "手机号码不能为空",
					rangelength: "请输入11位手机号码"
				}
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				scsAjax({
					url: "/Person/ModifyRegSelf",
					params: params,
					success: function(data) {
						if (data.resultCode >= 0)
							location.assign("<s:url action='profile' namespace='/'><s:param name='anchor'>profile-identity</s:param></s:url>");
						else
							UIkit.notify(data.resultHint, {
								status: "danger"
							});
					}
				});
			}
		});
		var identityCardPhotoUpload = $("#identity-card-photo-upload");
		imageUploadSelect({
			trigger: identityCardPhotoUpload,
			progress: identityCardPhotoUpload.closest(".uk-form-row").find(".uk-progress"),
			complete: function(data) {
				if (data) {
					$("#profile-certificate-form [name='identityCardPhoto']").val(data.attachmentUrl);
					$("#identity-card-photo").empty();
					$("#identity-card-photo").append("<img src='{0}' class='uk-border-rounded' />".format(data.attachmentUrl));
				} else {
					UIkit.notify("上传失败", {
						status: "danger"
					});
				}
			}
		});
		var identityCardPhotoOUpload = $("#identity-card-photo-o-upload");
		imageUploadSelect({
			trigger: identityCardPhotoOUpload,
			progress: identityCardPhotoOUpload.closest(".uk-form-row").find(".uk-progress"),
			complete: function(data) {
				if (data) {
					$("#profile-certificate-form [name='identityCardPhotoO']").val(data.attachmentUrl);
					$("#identity-card-photo-o").empty();
					$("#identity-card-photo-o").append("<img src='{0}' class='uk-border-rounded' />".format(data.attachmentUrl));
				} else {
					UIkit.notify("上传失败", {
						status: "danger"
					});
				}
			}
		});
		<s:if test="info.ROLE == 10">
		var driLPhotoUpload = $("#dri-l-photo-upload");
		imageUploadSelect({
			trigger: driLPhotoUpload,
			progress: driLPhotoUpload.closest(".uk-form-row").find(".uk-progress"),
			complete: function(data) {
				if (data) {
					$("#profile-certificate-form [name='derLPhoto']").val(data.attachmentUrl);
					$("#dri-l-photo").empty();
					$("#dri-l-photo").append("<img src='{0}' class='uk-border-rounded' />".format(data.attachmentUrl));
				} else {
					UIkit.notify("上传失败", {
						status: "danger"
					});
				}
			}
		});
		var driLPhotoOUpload = $("#dri-l-photo-o-upload");
		imageUploadSelect({
			trigger: driLPhotoOUpload,
			progress: driLPhotoOUpload.closest(".uk-form-row").find(".uk-progress"),
			complete: function(data) {
				if (data) {
					$("#profile-certificate-form [name='derLPhotoO']").val(data.attachmentUrl);
					$("#dri-l-photo-o").empty();
					$("#dri-l-photo-o").append("<img src='{0}' class='uk-border-rounded' />".format(data.attachmentUrl));
				} else {
					UIkit.notify("上传失败", {
						status: "danger"
					});
				}
			}
		});
		var dlPhotoUpload = $("#dl-photo-upload");
		imageUploadSelect({
			trigger: dlPhotoUpload,
			progress: dlPhotoUpload.closest(".uk-form-row").find(".uk-progress"),
			complete: function(data) {
				if (data) {
					$("#profile-certificate-form [name='dlPhoto']").val(data.attachmentUrl);
					$("#dl-photo").empty();
					$("#dl-photo").append("<img src='{0}' class='uk-border-rounded' />".format(data.attachmentUrl));
				} else {
					UIkit.notify("上传失败", {
						status: "danger"
					});
				}
			}
		});
		var dlPhotoOUpload = $("#dl-photo-o-upload");
		imageUploadSelect({
			trigger: dlPhotoOUpload,
			progress: dlPhotoOUpload.closest(".uk-form-row").find(".uk-progress"),
			complete: function(data) {
				if (data) {
					$("#profile-certificate-form [name='dlPhotoO']").val(data.attachmentUrl);
					$("#dl-photo-o").empty();
					$("#dl-photo-o").append("<img src='{0}' class='uk-border-rounded' />".format(data.attachmentUrl));
				} else {
					UIkit.notify("上传失败", {
						status: "danger"
					});
				}
			}
		});
		</s:if>
		$("#profile-certificate-form").submit(function(event) {
			event.preventDefault();
			var params = {};
			$.each($(this).serializeArray(), function() {
				params[this.name] = this.value;
			});
			scsAjax({
				url: "/Person/ModifyIDSelf",
				params: params,
				success: function(data) {
					if (data.resultCode >= 0)
						location.assign("<s:url action='profile' namespace='/'><s:param name='anchor'>profile-certificate</s:param></s:url>");
					else
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
				}
			});
		});
		$("#profile-other-form").submit(function(event) {
			event.preventDefault();
			var params = {};
			$.each($(this).serializeArray(), function() {
				params[this.name] = this.value;
			});
			scsAjax({
				url: "/Person/ModifyPAttrS",
				params: params,
				success: function(data) {
					if (data.resultCode >= 0)
						location.assign("<s:url action='profile' namespace='/'><s:param name='anchor'>profile-other</s:param></s:url>");
					else
						UIkit.notify(data.resultHint, {
							status: "danger"
						});
				}
			});
		});
		
		<s:if test="referer == null">
		UIkit.notify("保存成功", {
			status: "success"
		});
		</s:if>
	</script>
</body>
</html>