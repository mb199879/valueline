package com.valueline.module.web.action;

import java.util.HashMap;
import java.util.Map;

import com.valueline.module.web.util.ActionSupport;
import com.valueline.module.web.util.OgnlUtil;
import com.valueline.module.web.util.RemoteService;

public class Logout extends ActionSupport {

	public String execute() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("token", session.get("currentUserId"));
		Object result = RemoteService.execute("/Person/Logout", params);
		if ((Long) OgnlUtil.getValue(result, "resultCode") >= 0) {
			servletRequest.getSession().invalidate();
			return SUCCESS;
		} else {
			throw new RuntimeException();
		}
	}

}
