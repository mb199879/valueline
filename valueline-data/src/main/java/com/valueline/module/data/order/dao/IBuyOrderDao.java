package com.valueline.module.data.order.dao;

import com.valueline.module.data.order.entity.BuyOrderEntity;

public interface IBuyOrderDao {
	BuyOrderEntity queryOrderById(int id);
}
