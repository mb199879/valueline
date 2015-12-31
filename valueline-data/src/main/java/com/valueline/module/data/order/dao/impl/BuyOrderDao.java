package com.valueline.module.data.order.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.valueline.module.data.order.dao.IBuyOrderDao;
import com.valueline.module.data.order.entity.BuyOrderEntity;

public class BuyOrderDao implements IBuyOrderDao{

	private static Logger logger = LoggerFactory.getLogger(BuyOrderDao.class);
	
	private SqlSessionTemplate sqlSession;
	 
	private  final static String NAMESPAC = "com.valueline.module.data.order.entity.BuyOrderEntity";

	@Override
	public BuyOrderEntity queryOrderById(int id){
		BuyOrderEntity buyOrderEntity=null;
		try{
			buyOrderEntity = (BuyOrderEntity)sqlSession.selectOne(NAMESPAC+".queryBuyOrderById",id);
		}catch(Exception e){
			logger.error("query buyOrder fail!");
		}
		return buyOrderEntity;
	}
	
	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

}
