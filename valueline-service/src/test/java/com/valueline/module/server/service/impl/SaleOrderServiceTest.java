package com.valueline.module.server.service.impl;

import org.junit.Before;
import org.junit.Test;

import com.valueline.module.data.order.entity.SaleOrderEntity;
import com.valueline.module.server.order.service.ISaleOrderService;
import com.valueline.module.server.order.service.impl.SaleOrderService;
import com.valueline.module.server.util.SpringTestHelper;

public class SaleOrderServiceTest {

	private  ISaleOrderService orderService = null;
	@Before
	public void setUp() throws Exception {
		orderService = SpringTestHelper.get().getBean(SaleOrderService.class);
	}

	@Test
	public void test() {
		SaleOrderEntity entity = orderService.queryOrderById(38);
		System.out.println(entity.getConsignees().size());
	}
}
