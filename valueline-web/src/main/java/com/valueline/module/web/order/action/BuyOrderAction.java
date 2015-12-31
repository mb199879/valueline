package com.valueline.module.web.order.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.valueline.module.data.order.entity.BuyOrderEntity;
import com.valueline.module.server.order.service.IBuyOrderService;

public class BuyOrderAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;

	private List<BuyOrderEntity> orders;
	
	private BuyOrderEntity order;
	
	private IBuyOrderService buyOrderService;
	
	private int id;

	public String queryOrderById(){
		order = buyOrderService.queryOrderById(id);
		return "json";
	}
	
	public void setBuyOrderService(IBuyOrderService buyOrderService) {
		this.buyOrderService = buyOrderService;
	}
	public List<BuyOrderEntity> getOrders() {
		return orders;
	}
	public void setOrders(List<BuyOrderEntity> orders) {
		this.orders = orders;
	}
	public BuyOrderEntity getOrder() {
		return order;
	}
	public void setOrder(BuyOrderEntity order) {
		this.order = order;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
