package com.valueline.module.webapi.rs.order;

import java.io.IOException;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;

import com.valueline.module.base.exception.CodeType;
import com.valueline.module.data.order.entity.BuyOrderEntity;
import com.valueline.module.server.order.service.IBuyOrderService;
import com.valueline.module.webapi.rs.util.JsonUtil;

public class RestBuyOrderService implements IRestBuyOrderService{
	
	private IBuyOrderService buyOrderService;

	@Override
	public String queryOrderById(int id) {
	
		BuyOrderResponseEntity response = new BuyOrderResponseEntity();
		BuyOrderEntity buyOrder= buyOrderService.queryOrderById(id);
		response.setResponseCode(CodeType.VALUELINE_000_000);
		response.setBuyOrderEntity(buyOrder);
		String json = null;
		try {
			json = JsonUtil.getInstance().bean2json(response);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}

	public IBuyOrderService getBuyOrderService() {
		return buyOrderService;
	}

	public void setBuyOrderService(IBuyOrderService buyOrderService) {
		this.buyOrderService = buyOrderService;
	}

}
