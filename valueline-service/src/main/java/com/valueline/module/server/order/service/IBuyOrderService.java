package com.valueline.module.server.order.service;

import com.valueline.module.data.order.entity.BuyOrderEntity;

public interface IBuyOrderService {
	BuyOrderEntity queryOrderById(int id);
}
