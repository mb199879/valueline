package com.valueline.module.web.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;

import com.valueline.module.web.util.ActionSupport;
import com.valueline.module.web.util.MyImageCaptchaServlet;
import com.valueline.module.web.util.OgnlUtil;
import com.valueline.module.web.util.RemoteService;

public class Login extends ActionSupport {
	
	private String loginName;
	
	private String password;
	
	private String verificationCode;
	
	public String execute() {
		loginName = getCookies().get("loginName");
		return SUCCESS;
	}
	
	public String login() {
		if (session.containsKey("loginError") && !MyImageCaptchaServlet.validateResponse(servletRequest, verificationCode.toUpperCase())) {
			success = false;
			errorMessage = "验证码不正确，请重新输入";
			return INPUT;
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", loginName);
		params.put("pwd", password);
		Object result = RemoteService.execute("/Person/Login", params);
		if ((Long) OgnlUtil.getValue(result, "resultCode") >= 0) {
			String token = (String) OgnlUtil.getValue(result, "resultValue.token");
			String lastTime = (String) OgnlUtil.getValue(result, "resultValue.lastTime");
			Long firmRootID = (Long) OgnlUtil.getValue(result, "resultValue.firmRootID");
			session.put("currentUserId", token);
			Cookie cookie1 = new Cookie("loginName", loginName);
			cookie1.setPath("/");
			cookie1.setMaxAge(60 * 60 * 24 * 7);
			servletResponse.addCookie(cookie1);
			Cookie cookie2 = new Cookie("token", token);
			cookie2.setPath("/");
			servletResponse.addCookie(cookie2);
			Cookie cookie3 = new Cookie("lastTime", lastTime);
			cookie3.setPath("/");
			servletResponse.addCookie(cookie3);
			Cookie cookie4 = new Cookie("firmRootID", firmRootID.toString());
			cookie4.setPath("/");
			servletResponse.addCookie(cookie4);
			session.remove("loginError");
			return COMPLETE;
		} else {
			success = false;
			errorMessage = "您的登录名或者密码不正确，请重新登录";
			session.put("loginError", "loginError");
			return INPUT;
		}
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}
	
}
