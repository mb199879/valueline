package com.valueline.module.data.order.entity;

import java.io.Serializable;
import java.util.List;

public class ConsigneeEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;              //收货人ID
	private String consignee_name;   //收货人
	private String driver;   //交接司机
    private String province;  //省
    private String city;      //市
    private String county;    //区
    private String detail;     //详细地址
    private List<ProductEntity> productes;   //产品
    
	public String getConsignee() {
		return consignee_name;
	}
	public void setConsignee(String consignee_name) {
		this.consignee_name = consignee_name;
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public List<ProductEntity> getProductes() {
		return productes;
	}
	public void setProductes(List<ProductEntity> productes) {
		this.productes = productes;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
