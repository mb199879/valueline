package com.valueline.module.server.order.service;

import com.valueline.module.data.order.entity.SaleOrderEntity;

public interface ISaleOrderService {
	SaleOrderEntity queryOrderById(int id);
}
