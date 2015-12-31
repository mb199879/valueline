package com.valueline.module.data.order.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.valueline.module.data.order.dao.ISaleOrderDao;
import com.valueline.module.data.order.entity.SaleOrderEntity;

public class SaleOrderDao implements ISaleOrderDao{

	private static Logger logger = LoggerFactory.getLogger(SaleOrderDao.class);
	
	private SqlSessionTemplate sqlSession;
	 
	private  final static String NAMESPAC = "com.valueline.module.data.order.entity.SaleOrderEntity";

	@Override
	public SaleOrderEntity queryOrderById(int id){
		SaleOrderEntity saleOrderEntity = null;
		try{
			saleOrderEntity = (SaleOrderEntity)sqlSession.selectOne(NAMESPAC+".querySaleOrderById",id);
		}catch(Exception e){
			logger.error("query saleOrder fail!");
		}
		return saleOrderEntity;
	}
	
	public SqlSessionTemplate getSqlSession() {
		return sqlSession;
	}
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

}
