<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:include value="head.jsp" />
<body>
	<s:include value="top.jsp">
		<s:param name="anchor">register</s:param>
	</s:include>
	<div id="register" class="uk-margin-large uk-container-center">
		<div id="register-banner">
			<div class="uk-grid uk-grid-collapse">
				<div class="uk-width-1-2">
					<div class="vl-item vl-active">
						<div>1</div>
						填写注册信息
					</div>
				</div>
				<div class="uk-width-1-2">
					<div class="vl-item">
						<div>2</div>
						完成
					</div>
				</div>
			</div>
		</div>
		<form id="register-form" class="uk-form uk-form-horizontal">
			<div class="uk-form-row">
				<label class="uk-form-label vl-form-legend">【基本信息】</label>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"><span class="vl-form-label-required">*</span>姓名</label>
				<div class="uk-form-controls">
					<input type="text" name="name" placeholder="请输入姓名" class="uk-width-1-1" />
				</div>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"><span class="vl-form-label-required">*</span>手机号码</label>
				<div class="uk-form-controls">
					<input type="text" name="mobile" placeholder="请输入手机号码" class="uk-width-1-1" />
				</div>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"><span class="vl-form-label-required">*</span>设置密码</label>
				<div class="uk-form-controls">
					<input type="password" name="pwd" placeholder="请输入密码，密码至少6位字符" class="uk-width-1-1" />
				</div>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"><span class="vl-form-label-required">*</span>确认密码</label>
				<div class="uk-form-controls">
					<input type="password" name="pwdAgain" placeholder="请重复输入密码" class="uk-width-1-1" />
				</div>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"><span class="vl-form-label-required">*</span>邮箱</label>
				<div class="uk-form-controls">
					<input type="text" name="email" placeholder="请输入邮箱" class="uk-width-1-1" />
				</div>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"><span class="vl-form-label-required">*</span>验证码</label>
				<div class="uk-form-controls">
					<input type="text" name="verificationCode" placeholder="请输入验证码" class="uk-width-1-1" />
				</div>
			</div>
			<div class="uk-form-row">
				<div class="uk-form-controls">
					<a><img id="register-verification-image" src="<s:url value='/image/jcaptcha.jpg' />" class="uk-border-rounded" /></a>
				</div>
			</div>
			<div class="uk-form-row">
				<div class="uk-form-controls">
					<input type="checkbox" id="register-form_role" name="role" value="10" />
					<label for="register-form_role">我是司机</label>
				</div>
			</div>
			<div class="uk-form-row driver-info-row vl-hidden">
				<label class="uk-form-label vl-form-legend">【司机信息】</label>
			</div>
			<div class="uk-form-row driver-info-row vl-hidden">
				<label class="uk-form-label"><span class="vl-form-label-required">*</span>车牌号</label>
				<div class="uk-form-controls">
					<input type="text" name="car.plate" placeholder="请输入车牌号" class="uk-width-1-1" />
				</div>
			</div>
			<div class="uk-form-row driver-info-row vl-hidden">
				<label class="uk-form-label">送货起点</label>
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
			<div class="uk-form-row driver-info-row vl-hidden">
				<label class="uk-form-label">送货终点</label>
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
				<label class="uk-form-label vl-form-legend">【公司信息】</label>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label">公司名称</label>
				<div class="uk-form-controls">
					<input type="text" name="firm.name" placeholder="请输入公司名称" class="uk-width-1-1" />
				</div>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label">所属行业</label>
				<div class="uk-form-controls">
					<select name="firm.industry" class="uk-width-1-1">
						<option value="">请选择</option>
					</select>
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
							<input type="text" name="firm.address.detail" placeholder="请输入详细地址，如xx路xx号" class="uk-width-1-1" />
						</div>
					</div>
				</div>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label">邮编</label>
				<div class="uk-form-controls">
					<input type="text" name="firm.address.code" placeholder="请输入邮编" class="uk-width-1-1" />
				</div>
			</div>
			<div class="uk-form-row">
				<div class="uk-form-controls">
					<input type="checkbox" id="register-form_agreement" />
					<label for="register-form_agreement">同意并接受<a href="#terms-of-use" data-uk-modal="{bgclose: false}">《注册服务条款》</a></label>
				</div>
			</div>
			<div class="uk-form-row uk-text-center">
				<button type="submit" class="uk-button uk-button-primary uk-width-1-2" disabled>立即注册</button>
			</div>
		</form>
	</div>
	<s:include value="bottom.jsp" />
	<div id="terms-of-use" class="uk-modal">
		<div class="uk-modal-dialog uk-modal-dialog-large">
			<a class="uk-modal-close uk-close"></a>
			<h2 class="uk-text-center">注册服务条款</h2>
			<div class="uk-overflow-container uk-text-justify">
				<p>欢迎使用价值线软件及服务！</p>
				<p>为使用价值线软件（以下简称“本软件”）及服务，用户应当阅读并遵守《价值线软件许可及服务协议》（以下简称“本协议”）。本《软件许可及服务协议》是用户与上海心砚科技有限公司（以下简称“本公司”）之间关于用户下载、安装、使用“价值线”软件；注册、使用价值线帐号；以及使用本公司提供的相关服务所订立的协议。请你务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款，以及开通或使用某项服务的单独协议，并选择接受或不接受。限制、免责条款可能以加粗形式提示你注意。</p>
				<p>除非你已阅读并接受本协议所有条款，否则你无权下载、安装或使用本软件及相关服务。你的下载、安装、使用、获取帐号、登录等行为即视为你已阅读并同意上述协议的约束。</p>
				<h3>一、协议的范围</h3>
				<h4>1.1 协议适用主体范围</h4>
				<p>本协议是你与价值线之间关于下载、安装、使用等服务所订立的协议。</p>
				<h3>二、关于服务</h3>
				<h4>2.1 本服务的内容</h4>
				<p>本服务内容是指上海心砚科技有限公司向用户提供的跨平台的通讯工具，支持运单管理、物流跟踪，同时为用户提供包括但不限于库存查询和信用查询等功能或内容的软件许可及服务（以下简称“本服务”）。</p>
				<h4>2.2 本服务的形式</h4>
				<p>2.2.1 用户通过手机号注册平台账号。用户完成申请注册手续后，获得帐号的使用权。帐号使用权仅属于初始申请注册人，禁止赠与、借用、租用、转让或售卖。用户承担帐号与密码的保管责任，并就其帐号及密码项下之一切活动负全部责任。</p>
				<p>2.2.2 用户可以为非商业目的在单一台终端设备上安装、使用、显示、运行“价值线”软件。用户不得为商业运营目的安装、使用、运行“价值线”软件，不可以对本软件或者本软件运行过程中释放到任何计算机终端内存中的数据及本软件运行过程中客户端与服务器端的交互数据进行复制、更改、修改、挂接运行或创作任何衍生作品，形式包括但不限于使用插件、外挂或非经授权的第三方工具/服务接入本软件和相关系统。未明示授权的其他一切权利仍归本公司所有，用户使用其他权利时须另外取得本公司的书面同意。</p>
				<h4>2.3 本服务许可的范围</h4>
				<p>2.3.1 本公司有权针对以下情况中断或终止向用户提供本协议项下的网络服务，而无需对用户或任何第三方承担任何责任：</p>
				<ul class="uk-list uk-margin-left">
					<li>（1）用户提供的个人资料不真实；</li>
					<li>（2）用户违反本协议中规定的使用规则；</li>
				</ul>
				<p>2.3.2 本条及本协议其他条款未明示授权的其他一切权利仍由上海心砚科技有限公司保留，用户在行使这些权利时须另外取得本公司的书面许可。本公司如果未行使前述任何权利，并不构成对该权利的放弃。</p>
				<h3>三、软件的获取</h3>
				<p>3.1 用户可以直接从价值线官方网站上获取本软件，也可以从得到本公司授权的第三方获取。</p>
				<p>3.2 如果从未经本公司授权的第三方获取本软件或与本软件名称相同的安装程序，本公司无法保证该软件能够正常使用，并对因此给你造成的损失不予负责。</p>
				<h3>四、软件的安装与卸载</h3>
				<p>4.1 请根据实际情况选择合适的下载版本进行安装。</p>
				<p>4.2 下载安装程序后，用户需要按照该程序提示的步骤正确安装。</p>
				<p>4.3 如果用户不再需要使用本软件或者需要安装新版软件，可以自行卸载。</p>
				<h3>五、软件的更新</h3>
				<p>5.1 为了改善用户体验、完善服务内容，本公司将不断努力开发新的服务，并且需要定期或不定期地对提供网络服务的平台（如互联网网站、移动网络等）或相关的设备进行检修或者维护，并为用户不时提供软件更新（这些更新可能会采取软件替换、修改、功能强化、版本升级等形式）。如因此类情况而造成收费网络服务在合理时间内的中断，本公司无需为此承担任何责任，且除特殊情况外应当事先进行通告。</p>
				<p>5.2 为了保证本软件及服务的安全性和功能的一致性，本公司有权不经向用户特别通知而对软件进行更新，或者对软件的部分功能效果进行改变或限制。</p>
				<p>5.3 本软件新版本发布后，旧版本的软件可能无法使用。本公司不保证旧版本软件继续可用及相应的客户服务，请随时核对并下载最新版本。</p>
				<h3>六、用户个人信息保护</h3>
				<p>6.1 保护用户个人信息是基本原则，本公司将会采取合理的措施保护用户的个人信息。除法律法规规定的情形外，未经用户许可本公司不会向第三方公开、透露用户个人信息。</p>
				<p>6.2 用户在注册帐号或使用本服务的过程中，需要提供一些必要的信息，例如：帐号注册服务或进行用户身份识别，需要你填写手机号码；需要用户同意使用你所在的地理位置信息等。若国家法律法规或政策有特殊规定的，用户需要提供真实的身份信息。若用户提供的信息不完整，则无法使用本服务或在使用过程中受到限制。</p>
				<p>6.3 一般情况下，用户可随时浏览、修改自己提交的信息，但出于安全性和身份识别（如号码申诉服务）的考虑，用户可能无法修改注册时提供的初始注册信息及其他验证信息。</p>
				<p>6.4 本公司将运用各种安全技术和程序建立完善的管理制度来保护用户的个人信息，以免遭受未经授权的访问、使用或披露。</p>
				<p>6.5 未经用户同意，本公司不会向任何公司、组织和个人披露你的个人信息，但法律法规另有规定的除外。</p>
				<h3>七、主权利义务条款</h3>
				<h4>7.1 帐号使用规范</h4>
				<p>7.1.1 用户在使用本服务前需要注册一个帐号。帐号可通过手机号码进行注册。用户应当向本网站提供真实准确完整的注册信息。同时，也应当在相关资料实际变更时及时更新有关注册资料。请进一步同意其一旦将信息或资料在使用服务时提供，则表示同意放弃对此信息或资料所享有的隐私权、版权和相关财产权利。</p>
				<p>7.1.2 不得以任何形式擅自转让或授权他人使用自己在本网站的会员帐号。用户承诺自己在使用本网站实施的所有行为遵守法律、法规、行政规章和本网站的相关规定以及各种社会公共利益或公共道德。如有违反导致任何法律后果的发生，用户将以自己的名义独立承担相应的法律责任。</p>
				<p>7.1.3 用户有责任妥善保管注册帐户信息及帐户密码的安全，用户需要对注册帐户以及密码下的行为承担法律责任。用户同意在任何情况下不向他人透露帐户及密码信息。当怀疑他人在使用你的帐号时，你应立即通知本公司。</p>
				<h4>7.2 用户注意事项</h4>
				<p>7.2.1 用户理解并同意本公司将会尽其商业上的合理努力保障你在本软件及服务中的数据存储安全，但是，不能就此提供完全保证，包括但不限于以下情形：</p>
				<ul class="uk-list uk-margin-left">
					<li>7.2.1.1 本公司不对用户在本软件及服务中相关数据的删除或储存失败负责；</li>
					<li>7.2.1.2 如果用户停止使用本软件及服务或服务被终止或取消，本公司可以从服务器上永久地删除你的数据。服务停止、终止或取消后，本公司没有义务向用户返还任何数据。</li>
				</ul>
				<p>7.2.2 用户在使用本软件及服务时，须自行承担如下来自本公司不可掌控的风险内容，包括但不限于：</p>
				<ul class="uk-list uk-margin-left">
					<li>7.2.2.1 由于不可抗拒因素可能引起的个人信息丢失、泄漏等风险；</li>
					<li>7.2.2.2 由于无线网络信号不稳定、无线网络带宽小等原因，所引起的登录失败、资料同步不完整、页面打开速度慢等风险。</li>
				</ul>
				<h3>八、用户行为规范</h3>
				<p>8.1 用户不得破坏网站所提供的服务，通过任何方式对本公司内部结构造成或可能造成不合理或不合比例的重大负荷的行为；通过任何方式干扰或试图干扰网站的正常工作或网站上进行的任何活动。</p>
				<p>8.2 用户违反本协议规定的内容，给本网站造成损失的，应当承担违约责任，赔偿本网站因此所受一切损失，包括但不限于本金损失、利息损失、因追索或诉讼而支出的诉讼费律师费等。</p>
				<h3>九、知识产权声明</h3>
				<p>9.1 价值线所提供的一切服务的所有权、运营权和解释权归上海心砚科技有限公司所有。</p>
				<p>9.2 未经本公司或相关权利人书面同意，用户不得为任何商业或非商业目的自行或许可任何第三方实施、利用、转让上述知识产权。</p>
				<h3>十、终端安全责任</h3>
				<p>10.1 用户理解并同意，本软件同大多数互联网软件一样，可能会受多种因素影响，包括但不限于用户原因、网络服务质量、社会环境等；也可能会受各种安全问题的侵扰，包括但不限于他人非法利用用户资料，进行现实中的骚扰；用户下载安装的其他软件或访问的其他网站中可能含有病毒、木马程序或其他恶意程序，威胁用户的终端设备信息和数据安全，继而影响本软件的正常使用等。因此，用户应加强信息安全及个人信息的保护意识，注意密码保护，以免遭受损失。</p>
				<p>10.2 用户不得制作、发布、使用、传播用于窃取帐号及他人个人信息、财产的恶意程序。</p>
				<h3>十一、其他</h3>
				<p>11.1 你使用本软件即视为你已阅读并同意受本协议的约束。本公司有权在必要时修改本协议条款。你可以在本软件的最新版本中查阅相关协议条款。本协议条款变更后，如果你继续使用本软件，即视为你已接受修改后的协议。如果你不接受修改后的协议，应当停止使用本软件。</p>
				<p>11.2 本协议的成立、生效、履行、解释及纠纷解决，适用中华人民共和国大陆地区法律（不包括冲突法）。</p>
				<p>11.3 若你和本公司之间发生任何纠纷或争议，首先应友好协商解决；协商不成的，你同意将纠纷或争议提交本协议签订地有管辖权的人民法院管辖。</p>
				<p>11.4 上海心砚科技有限公司对本服务协议包括基于本服务协议制定的各项规则拥有最终解释权。</p>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function resetRegisterVerification() {
			$("#register-verification-image").click();
			$("#register-form [name='verificationCode']").val("");
		}
		
		$("#register-verification-image").click(function() {
			$(this).attr("src", "<s:url value='/image/jcaptcha.jpg' />?random={0}".format(Math.random()));
		});
		$("#register-form_role").change(function() {
			$(".driver-info-row").toggle();
		});
		scsAjax({
			url: "/UtiDomain/SelectProvince",
			params: {
				PID: 0
			},
			success: function(data) {
				var select = $("#register-form [name='line.address1.province']");
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
		$("#register-form [name='line.address1.province']").change([$("#register-form [name='line.address1.city']"), $("#register-form [name='line.address1.county']")], addressHandler);
		$("#register-form [name='line.address1.city']").change([$("#register-form [name='line.address1.county']")], addressHandler);
		scsAjax({
			url: "/UtiDomain/SelectProvince",
			params: {
				PID: 0
			},
			success: function(data) {
				var select = $("#register-form [name='line.address2.province']");
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
		$("#register-form [name='line.address2.province']").change([$("#register-form [name='line.address2.city']"), $("#register-form [name='line.address2.county']")], addressHandler);
		$("#register-form [name='line.address2.city']").change([$("#register-form [name='line.address2.county']")], addressHandler);
		scsAjax({
			url: "/UtiDomain/SelectIndustry",
			params: {
				PID: 0
			},
			success: function(data) {
				var select = $("#register-form [name='firm.industry']");
				if (data.resultCode >= 0)
					$.each(data.resultValue, function() {
						select.append("<option value='{0}'>{1}</option>".format(this.VALUE, this.NAME));
					});
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
		scsAjax({
			url: "/UtiDomain/SelectProvince",
			params: {
				PID: 0
			},
			success: function(data) {
				var select = $("#register-form [name='firm.address.province']");
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
		$("#register-form [name='firm.address.province']").change([$("#register-form [name='firm.address.city']"), $("#register-form [name='firm.address.county']")], addressHandler);
		$("#register-form [name='firm.address.city']").change([$("#register-form [name='firm.address.county']")], addressHandler);
		$("#register-form_agreement").change(function() {
			var button = $("#register-form :submit");
			if ($(this).prop("checked"))
				button.prop("disabled", false);
			else
				button.prop("disabled", true);
		});
		$("#register-form").validate({
			rules: {
				"name": "required",
				"mobile": {
					required: true,
					rangelength: [11, 11]
				},
				"pwd": {
					required: true,
					minlength: 6
				},
				"pwdAgain": {
					equalTo: "#register-form [name='pwd']"
				},
				"email": {
					required: true,
					email: true
				},
				"verificationCode": "required",
				"car.plate": {
					required: {
						depends: function() {
							return $("#register-form_role").prop("checked");
						}
					}
				}
			},
			messages: {
				"name": "姓名不能为空",
				"mobile": {
					required: "手机号码不能为空",
					rangelength: "请输入11位手机号码"
				},
				"pwd": {
					required: "密码不能为空",
					minlength: "请输入至少6位字符"
				},
				"pwdAgain": {
					equalTo: "请输入与上面一致的密码"
				},
				"email": {
					required: "邮箱不能为空",
					email: "邮箱格式不正确"
				},
				"verificationCode": "验证码不能为空",
				"car.plate": {
					required: "车牌号不能为空"
				}
			},
			errorElement: "em",
			submitHandler: function(form) {
				var params = {};
				$.each($(form).serializeArray(), function() {
					params[this.name] = this.value;
				});
				ajax({
					url: "<s:url action='validate-response' namespace='/' />",
					params: {
						verificationCode: params.verificationCode
					},
					success: function(data) {
						if (data.passed) {
							scsAjax({
								url: "/Person/Register",
								params: $.extend(params, {
									car: {
										plate: params["car.plate"]
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
										industry: params["firm.industry"],
										address: {
											province: params["firm.address.province"],
											city: params["firm.address.city"],
											county: params["firm.address.county"],
											detail: params["firm.address.detail"],
											code: params["firm.address.code"]
										}
									}
								}),
								success: function(data) {
									if (data.resultCode >= 0) {
										location.assign("<s:url action='register2' namespace='/' />");
									} else {
										resetRegisterVerification();
										UIkit.notify(data.resultHint, {
											status: "danger"
										});
									}
								},
								error: function() {
									resetRegisterVerification();
									errorHandler();
								}
							});
						} else {
							resetRegisterVerification();
							UIkit.notify("验证码不正确，请重新输入", {
								status: "danger"
							});
						}
					},
					error: function() {
						resetRegisterVerification();
						errorHandler();
					}
				});
			}
		});
	</script>
</body>
</html>