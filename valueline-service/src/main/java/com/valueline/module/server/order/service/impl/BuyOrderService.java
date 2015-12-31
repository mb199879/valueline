package com.valueline.module.server.order.service.impl;

import com.valueline.module.data.order.dao.IBuyOrderDao;
import com.valueline.module.data.order.entity.BuyOrderEntity;
import com.valueline.module.server.order.service.IBuyOrderService;

public class BuyOrderService implements IBuyOrderService{
	
	private IBuyOrderDao buyOrderDao;

	@Override
	public BuyOrderEntity queryOrderById(int id) {
		return buyOrderDao.queryOrderById(id);
	}

	public void setBuyOrderDao(IBuyOrderDao buyOrderDao) {
		this.buyOrderDao = buyOrderDao;
	}

}
