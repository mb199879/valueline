package com.valueline.module.data.dao.impl;


import org.junit.Before;
import org.junit.Test;

import com.valueline.data.util.SpringTestHelper;
import com.valueline.module.data.order.dao.impl.BuyOrderDao;
import com.valueline.module.data.order.entity.BuyOrderEntity;

public class BuyOrderDaoTest {

	private  BuyOrderDao buyOrderDao = null;
	@Before
	public void setUp() throws Exception {
		buyOrderDao = SpringTestHelper.get().getBean(BuyOrderDao.class);
	}

	@Test
	public void test() {
		BuyOrderEntity entity = buyOrderDao.queryOrderById(2);
		if(entity!=null){
			System.out.println(entity.getConsignee_conn());
		}else{
			System.out.println("null");
		}
	}

}
