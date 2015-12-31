package com.valueline.module.server.order.service.impl;

import com.valueline.module.data.order.dao.ISaleOrderDao;
import com.valueline.module.data.order.entity.SaleOrderEntity;
import com.valueline.module.server.order.service.ISaleOrderService;

public class SaleOrderService implements ISaleOrderService{
	
	private ISaleOrderDao saleOrderDao;

	@Override
	public SaleOrderEntity queryOrderById(int id) {
		return saleOrderDao.queryOrderById(id);
	}

	public void setSaleOrderDao(ISaleOrderDao saleOrderDao) {
		this.saleOrderDao = saleOrderDao;
	}

}
