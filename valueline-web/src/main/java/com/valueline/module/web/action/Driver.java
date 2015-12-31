package com.valueline.module.web.action;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.Preparable;
import com.valueline.module.web.util.ActionSupport;
import com.valueline.module.web.util.OgnlUtil;
import com.valueline.module.web.util.RemoteService;

public class Driver extends ActionSupport implements Preparable{

	private Long groupId;
	
	public void prepare() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("token", session.get("currentUserId"));
		Object result = RemoteService.execute("/UtiDomain/SelectGroup", params);
		if ((Long) OgnlUtil.getValue(result, "resultCode") >= 0) {
			Integer size = (Integer) OgnlUtil.getValue(result, "resultValue.size");
			for (int i = 0; i < size; i++)
				if (OgnlUtil.getValue(result, "resultValue[" + i + "].NAME").equals("司机"))
					groupId = (Long) OgnlUtil.getValue(result, "resultValue[" + i + "].VALUE");
		} else {
			throw new RuntimeException();
		}
	}

	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}
	
}
