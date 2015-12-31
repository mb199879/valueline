package com.valueline.module.webapi.rs.util;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;


public class JsonUtil {

	private static class SingleJsonUtil {
		private static final JsonUtil INSTANCE = new JsonUtil();
	}

	private JsonUtil() {
	}

	public static JsonUtil getInstance() {
		return SingleJsonUtil.INSTANCE;
	}

	private static volatile ObjectMapper objectMapper = new ObjectMapper();
	Logger logger = Logger.getLogger(JsonUtil.class);

	/**
	 * 校验JSON字符串是否为JSON格式
	 * */
	public boolean isValidJSON(final String json) {
		boolean valid = false;
		try {
			JSONObject.fromObject(json);
			valid = true;
		} catch (Exception e) {
			valid = false;
		}
		return valid;
	}

	/**
	 * 将JSON字符串转换为实体对象
	 * */
	public Object json2reqBean(String reqJson, Class<?> cls)
			throws IOException, JsonParseException, JsonMappingException {
		return objectMapper.readValue(reqJson, cls);
	}

	/**
	 * 将实体对象转换为JSON字符串
	 * */
	public String bean2json(Object obj) throws IOException, JsonParseException,
			JsonMappingException {  
		Writer writer = new StringWriter();
		JsonGenerator jsonGenerator = objectMapper.getJsonFactory()
				.createJsonGenerator(writer);
		objectMapper.writeValue(jsonGenerator, obj);
		jsonGenerator.close();
		String json = writer.toString();
		writer.close();
		return json;
	}

	/**
	 * 获取JSON字符串的某个节点值
	 * */
	public String getNodeValue(String json, String node) throws IOException,
			JsonProcessingException {
		JsonNode jsnode = objectMapper.readTree(json);
		jsnode = jsnode.get(node);
		return jsnode.toString();
	}

	/** 获取json节点值，并过滤掉双引号 */
	public String getNodeValue2(String json, String node) throws IOException,
			JsonProcessingException {
		JsonNode jsnode = objectMapper.readTree(json);
		jsnode = jsnode.get(node);
		return jsnode.toString().replace("\"", "");
	}

	/** 获取json树形节点值 */
	public String[] getNodeValue(String json, String[] node)
			throws IOException, JsonProcessingException {
		List<String> list = new ArrayList<String>();
		JsonNode jsnode = objectMapper.readTree(json);
		jsnode = jsnode.get(node[0]);
		if (jsnode.isArray()) {
			for (int i = 0; i < jsnode.size(); i++) {
				JsonNode childnode = jsnode.get(i);
				list.add(childnode.get(node[1]).toString());
			}
		}
		return (String[]) list.toArray();
	}
}
