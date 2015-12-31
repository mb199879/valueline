package com.valueline.module.web.action;

import java.util.HashMap;
import java.util.Map;

import com.valueline.module.web.util.ActionSupport;
import com.valueline.module.web.util.OgnlUtil;
import com.valueline.module.web.util.RemoteService;
import com.opensymphony.xwork2.Preparable;

public class Profile extends ActionSupport implements Preparable {

	private String anchor;
	
	private String referer;
	
	private Object info;
	
	public void prepare() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("token", session.get("currentUserId"));
		Object result = RemoteService.execute("/Person/SelectPAttrS", params);
		if ((Long) OgnlUtil.getValue(result, "resultCode") >= 0)
			info = OgnlUtil.getValue(result, "resultValue[0]");
		else
			throw new RuntimeException();
	}
	
	public String getAnchor() {
		return anchor;
	}

	public void setAnchor(String anchor) {
		this.anchor = anchor;
	}
	
	public String getReferer() {
		return referer;
	}

	public void setReferer(String referer) {
		this.referer = referer;
	}

	public Object getInfo() {
		return info;
	}

	public void setInfo(Object info) {
		this.info = info;
	}

}
