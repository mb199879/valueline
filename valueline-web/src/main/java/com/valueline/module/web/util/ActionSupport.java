package com.valueline.module.web.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

public class ActionSupport extends com.opensymphony.xwork2.ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
	
	public static final String COMPLETE = "complete";
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	protected HttpServletRequest servletRequest;
	
	protected HttpServletResponse servletResponse;
	
	protected Map<String, Object> session;
	
	protected boolean success = true;
	
	protected String errorMessage;
	
	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}
	
	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
	}
	
	public Map<String, Object> getSession() {
		return session;
	}
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public Map<String, String> getCookies() {
		Map<String, String> _cookies = new HashMap<String, String>();
		Cookie[] cookies = servletRequest.getCookies();
		if (cookies != null)
			for (Cookie cookie : cookies)
				_cookies.put(cookie.getName(), cookie.getValue());
		return _cookies;
	}

	public boolean isSuccess() {
		return success;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

}
