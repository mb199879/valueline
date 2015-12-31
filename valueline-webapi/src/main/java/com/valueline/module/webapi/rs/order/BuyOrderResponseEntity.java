package com.valueline.module.webapi.rs.order;

import com.valueline.module.data.order.entity.BuyOrderEntity;

public class BuyOrderResponseEntity {
	
	private BuyOrderEntity buyOrderEntity;
	
	/**
	 *    返回编码:异常编码或成功编码  
	 */
	private String responseCode;
	
	
	public BuyOrderEntity getBuyOrderEntity() {
		return buyOrderEntity;
	}

	public void setBuyOrderEntity(BuyOrderEntity buyOrderEntity) {
		this.buyOrderEntity = buyOrderEntity;
	}

	public String getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
}
