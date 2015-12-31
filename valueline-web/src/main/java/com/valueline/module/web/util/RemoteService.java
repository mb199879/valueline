package com.valueline.module.web.util;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.struts2.json.JSONUtil;

public class RemoteService {
	
	private static final CloseableHttpClient httpClient = HttpClients.createDefault();
	
	public static Object execute(String url, Map<String, Object> params) {
		params.put("app", 12);
		CloseableHttpResponse response = null;
		try {
			HttpPost httpPost = new HttpPost("http://182.92.110.217:7880/SCS" + url);
			httpPost.setEntity(new StringEntity(JSONUtil.serialize(params), ContentType.create("application/json", "UTF-8")));
			response = httpClient.execute(httpPost);
			return JSONUtil.deserialize(EntityUtils.toString(response.getEntity(), "UTF-8"));
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			if (response != null)
				try {
					response.close();
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
		}
	}
	
	public static void main(String[] args) {//Concurrent
		Map<String, Object> params =new HashMap<String,Object>();
		params.put("id", 38);
		CloseableHttpResponse response = null;
		try {
			HttpPost httpPost = new HttpPost("http://localhost:8080/valueline-web/orderAction_queryOrderById");
			httpPost.setEntity(new StringEntity(JSONUtil.serialize(params), ContentType.create("application/json", "UTF-8")));
			response = httpClient.execute(httpPost);
			String result = EntityUtils.toString(response.getEntity(), "UTF-8");
			JSONUtil.deserialize(result);
			System.out.println("jieguo:"+result);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			if (response != null)
				try {
					response.close();
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
		}
		
	}

}
