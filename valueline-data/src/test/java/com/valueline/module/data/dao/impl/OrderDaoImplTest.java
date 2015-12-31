package com.valueline.module.data.dao.impl;

import org.junit.Before;
import org.junit.Test;

import com.valueline.data.util.SpringTestHelper;
import com.valueline.module.data.order.dao.impl.SaleOrderDao;
import com.valueline.module.data.order.entity.SaleOrderEntity;

public class OrderDaoImplTest {
	
	private  SaleOrderDao saleOrderDao = null;
	@Before
	public void setUp() throws Exception {
		saleOrderDao = SpringTestHelper.get().getBean(SaleOrderDao.class);
	}

	@Test
	public void test() {
		SaleOrderEntity entity = saleOrderDao.queryOrderById(38);
		if(entity!=null){
			System.out.println(entity.getConsignee_conn());
		}else{
			System.out.println("null");
		}
	}

}
