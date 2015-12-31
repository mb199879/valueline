package com.valueline.module.web.order.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.valueline.module.data.order.entity.SaleOrderEntity;
import com.valueline.module.server.order.service.ISaleOrderService;

public class SaleOrderAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;

	private List<SaleOrderEntity> orders;
	
	private SaleOrderEntity order;
	
	private ISaleOrderService saleOrderService;
	
	private int id;

	public String queryOrderById(){
		order = saleOrderService.queryOrderById(id);
		return "json";
	}
	
	public List<SaleOrderEntity> getOrders() {
		return orders;
	}
	public void setOrders(List<SaleOrderEntity> orders) {
		this.orders = orders;
	}
	public SaleOrderEntity getOrder() {
		return order;
	}
	public void setOrder(SaleOrderEntity order) {
		this.order = order;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setSaleOrderService(ISaleOrderService saleOrderService) {
		this.saleOrderService = saleOrderService;
	}
}
