package com.valueline.module.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.valueline.module.web.util.ActionSupport;
import com.valueline.module.web.util.OgnlUtil;
import com.valueline.module.web.util.RemoteService;

public class Organization extends ActionSupport {
	
	private Integer firmRootID;
	
	private String node;
	
	private List<Map<String, Object>> childNodes;
	
	public String listChildNodes() {
		childNodes = new ArrayList<Map<String, Object>>();
		if (node == null && firmRootID == null) {
			Map<String, Object> childNode = new HashMap<String, Object>();
			childNode.put("entity_id", -1);
			childNode.put("entity_type", "firm");
			childNode.put("id", childNode.get("entity_type") + "-" + childNode.get("entity_id"));
			childNode.put("name", "所有企业");
			childNode.put("load_on_demand", true);
			childNodes.add(childNode);
		} else if (node == null && firmRootID != null) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("firmID", firmRootID);
			params.put("token", session.get("currentUserId"));
			Object result = RemoteService.execute("/FFirm/SelectFirm", params);
			if ((Long) OgnlUtil.getValue(result, "resultCode") >= 0) {
				Map<String, Object> childNode = new HashMap<String, Object>();
				childNode.put("entity_id", OgnlUtil.getValue(result, "resultValue[0].ID"));
				childNode.put("entity_type", "firm");
				childNode.put("id", childNode.get("entity_type") + "-" + childNode.get("entity_id"));
				childNode.put("name", OgnlUtil.getValue(result, "resultValue[0].NAME"));
				childNode.put("load_on_demand", true);
				childNodes.add(childNode);
			} else {
				throw new RuntimeException();
			}
		} else if (node.startsWith("firm")) {
			int firmId = extractId(node);
			if (firmId == -1) {
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("token", session.get("currentUserId"));
				Object result = RemoteService.execute("/FFirm/SelectFirmAll", params);
				if ((Long) OgnlUtil.getValue(result, "resultCode") >= 0) {
					Integer size = (Integer) OgnlUtil.getValue(result, "resultValue.size");
					for (int i = 0; i < size; i++) {
						Map<String, Object> childNode = new HashMap<String, Object>();
						childNode.put("entity_id", OgnlUtil.getValue(result, "resultValue[" + i + "].ID"));
						childNode.put("entity_type", "firm");
						childNode.put("id", childNode.get("entity_type") + "-" + childNode.get("entity_id"));
						childNode.put("name", OgnlUtil.getValue(result, "resultValue[" + i + "].NAME"));
						childNode.put("load_on_demand", true);
						childNodes.add(childNode);
					}
				} else {
					throw new RuntimeException();
				}
			} else {
				Map<String, Object> params1 = new HashMap<String, Object>();
				params1.put("firmID", firmId);
				params1.put("token", session.get("currentUserId"));
				Object result1 = RemoteService.execute("/FFirm/SelectFirm", params1);
				if ((Long) OgnlUtil.getValue(result1, "resultCode") >= 0) {
					Integer size = (Integer) OgnlUtil.getValue(result1, "resultValue[0].SUB.size");
					for (int i = 0; i < size; i++) {
						Map<String, Object> childNode = new HashMap<String, Object>();
						childNode.put("entity_id", OgnlUtil.getValue(result1, "resultValue[0].SUB[" + i + "].ID"));
						childNode.put("entity_type", "firm");
						childNode.put("id", childNode.get("entity_type") + "-" + childNode.get("entity_id"));
						childNode.put("name", OgnlUtil.getValue(result1, "resultValue[0].SUB[" + i + "].NAME"));
						childNode.put("load_on_demand", true);
						childNodes.add(childNode);
					}
				} else {
					throw new RuntimeException();
				}
				
				Map<String, Object> params2 = new HashMap<String, Object>();
				params2.put("depart", firmId);
				params2.put("token", session.get("currentUserId"));
				Object result2 = RemoteService.execute("/FDepart/SelectFirmDepart", params2);
				if ((Long) OgnlUtil.getValue(result2, "resultCode") >= 0) {
					Integer size = (Integer) OgnlUtil.getValue(result2, "resultValue[0].SUB.size");
					for (int i = 0; i < size; i++) {
						Map<String, Object> childNode = new HashMap<String, Object>();
						childNode.put("entity_id", OgnlUtil.getValue(result2, "resultValue[0].SUB[" + i + "].ID"));
						childNode.put("entity_type", "depart");
						childNode.put("id", childNode.get("entity_type") + "-" + childNode.get("entity_id"));
						childNode.put("name", OgnlUtil.getValue(result2, "resultValue[0].SUB[" + i + "].NAME"));
						childNode.put("role_id", OgnlUtil.getValue(result2, "resultValue[0].SUB[" + i + "].PRIVILEGE_ROLE"));
						childNode.put("load_on_demand", true);
						childNodes.add(childNode);
					}
				} else {
					throw new RuntimeException();
				}
			}
		} else if (node.startsWith("depart")) {
			int departId = extractId(node);
			Map<String, Object> params1 = new HashMap<String, Object>();
			params1.put("depart", departId);
			params1.put("token", session.get("currentUserId"));
			Object result1 = RemoteService.execute("/FDepart/SelectFirmDepart", params1);
			if ((Long) OgnlUtil.getValue(result1, "resultCode") >= 0) {
				Integer size = (Integer) OgnlUtil.getValue(result1, "resultValue[0].SUB.size");
				for (int i = 0; i < size; i++) {
					Map<String, Object> childNode = new HashMap<String, Object>();
					childNode.put("entity_id", OgnlUtil.getValue(result1, "resultValue[0].SUB[" + i + "].ID"));
					childNode.put("entity_type", "depart");
					childNode.put("id", childNode.get("entity_type") + "-" + childNode.get("entity_id"));
					childNode.put("name", OgnlUtil.getValue(result1, "resultValue[0].SUB[" + i + "].NAME"));
					childNode.put("role_id", OgnlUtil.getValue(result1, "resultValue[0].SUB[" + i + "].PRIVILEGE_ROLE"));
					childNode.put("load_on_demand", true);
					childNodes.add(childNode);
				}
			} else {
				throw new RuntimeException();
			}
			
			Map<String, Object> params2 = new HashMap<String, Object>();
			params2.put("depart", departId);
			params2.put("token", session.get("currentUserId"));
			Object result2 = RemoteService.execute("/FDepart/SelectFirmDepartPost", params2);
			if ((Long) OgnlUtil.getValue(result2, "resultCode") >= 0) {
				Integer size = (Integer) OgnlUtil.getValue(result2, "resultValue.size");
				for (int i = 0; i < size; i++) {
					Map<String, Object> childNode = new HashMap<String, Object>();
					childNode.put("entity_id", OgnlUtil.getValue(result2, "resultValue[" + i + "].POST"));
					childNode.put("entity_type", "post");
					childNode.put("id", childNode.get("entity_type") + "-" + childNode.get("entity_id"));
					childNode.put("name", OgnlUtil.getValue(result2, "resultValue[" + i + "].NAME"));
					childNode.put("post_pid", OgnlUtil.getValue(result2, "resultValue[" + i + "].P_POST"));
					childNode.put("post_pname", OgnlUtil.getValue(result2, "resultValue[" + i + "].P_NAME"));
					childNode.put("role_id", OgnlUtil.getValue(result2, "resultValue[" + i + "].PRIVILEGE_ROLE"));
					childNodes.add(childNode);
				}
			} else {
				throw new RuntimeException();
			}
		}
		return "list";
	}
	
	private int extractId(String node) {
		return Integer.parseInt(node.substring(node.indexOf("-") + 1));
	}
	
	public Integer getFirmRootID() {
		return firmRootID;
	}

	public void setFirmRootID(Integer firmRootID) {
		this.firmRootID = firmRootID;
	}

	public String getNode() {
		return node;
	}

	public void setNode(String node) {
		this.node = node;
	}

	public List<Map<String, Object>> getChildNodes() {
		return childNodes;
	}

	public void setChildNodes(List<Map<String, Object>> childNodes) {
		this.childNodes = childNodes;
	}
	
}
