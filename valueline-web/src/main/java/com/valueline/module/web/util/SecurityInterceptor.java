package com.valueline.module.web.util;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.RequestUtils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class SecurityInterceptor extends AbstractInterceptor {

	private List<String> protectedActionList;
	
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		ActionSupport action = (ActionSupport) actionInvocation.getAction();
		if (protectedActionList.contains(RequestUtils.getUri(action.getServletRequest())) 
			&& !action.getSession().containsKey("currentUserId"))
			throw new RuntimeException();
		return actionInvocation.invoke();
	}
	
	public void setProtectedActions(String protectedActions) {
		protectedActionList = new ArrayList<String>();
		for (String protectedAction : protectedActions.split(",")) {
			protectedActionList.add(protectedAction);
			protectedActionList.add(protectedAction + ".action");
		}
	}

}
