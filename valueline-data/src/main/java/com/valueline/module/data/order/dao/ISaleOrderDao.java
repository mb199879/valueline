package com.valueline.module.data.order.dao;

import com.valueline.module.data.order.entity.SaleOrderEntity;

public interface ISaleOrderDao {
	SaleOrderEntity queryOrderById(int id);
}
