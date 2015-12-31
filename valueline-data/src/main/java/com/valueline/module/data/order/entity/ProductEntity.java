package com.valueline.module.data.order.entity;

import java.io.Serializable;
import java.util.Date;

public class ProductEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id;        //产品ID
	private String product_name;    //货物名称   对应domain中type为20
    private double quantity;        //数量
    private String batch;           //批号
    private Date mfd;               //生产日期
    private Date exp;               //失效日期
    private double no_tax_price;    //不含税价
    private double tax_price;       //含税价
    private double tax;             //税率
    private double total;           //总价=QUANTITY * TAX_PRICE
	
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	public Date getMfd() {
		return mfd;
	}
	public void setMfd(Date mfd) {
		this.mfd = mfd;
	}
	public Date getExp() {
		return exp;
	}
	public void setExp(Date exp) {
		this.exp = exp;
	}
	public double getNo_tax_price() {
		return no_tax_price;
	}
	public void setNo_tax_price(double no_tax_price) {
		this.no_tax_price = no_tax_price;
	}
	public double getTax_price() {
		return tax_price;
	}
	public void setTax_price(double tax_price) {
		this.tax_price = tax_price;
	}
	public double getTax() {
		return tax;
	}
	public void setTax(double tax) {
		this.tax = tax;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
