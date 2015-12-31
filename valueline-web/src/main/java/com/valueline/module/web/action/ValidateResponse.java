package com.valueline.module.web.action;

import com.valueline.module.web.util.ActionSupport;
import com.valueline.module.web.util.MyImageCaptchaServlet;

public class ValidateResponse extends ActionSupport {

	private String verificationCode;
	
	private boolean passed;
	
	public String execute() {
		passed = MyImageCaptchaServlet.validateResponse(servletRequest, verificationCode.toUpperCase());
		return SUCCESS;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	public boolean isPassed() {
		return passed;
	}

	public void setPassed(boolean passed) {
		this.passed = passed;
	}
	
}
