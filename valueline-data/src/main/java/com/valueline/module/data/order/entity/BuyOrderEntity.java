package com.valueline.module.data.order.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class BuyOrderEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String note_type;    //票据类型（DOMAIN）type=25
	private String pay_type;     //支付类型（DOMAIN）type=26
	private Date create_time;  //创建时间
	private Date end_time;  //要求完成时间
	private String code;      //单据编号
	private String name;      //单据名称
	private String owner_conn;      //卖方联系人
	private String consignee_conn;      //买方联系人
	private String creator;      //创建人	
    private List<ConsigneeEntity> consignees;   //收货人
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOwner_conn() {
		return owner_conn;
	}
	public void setOwner_conn(String owner_conn) {
		this.owner_conn = owner_conn;
	}
	public String getConsignee_conn() {
		return consignee_conn;
	}
	public void setConsignee_conn(String consignee_conn) {
		this.consignee_conn = consignee_conn;
	}
	
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getNote_type() {
		return note_type;
	}
	public void setNote_type(String note_type) {
		this.note_type = note_type;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	
	public List<ConsigneeEntity> getConsignees() {
		return consignees;
	}
	public void setConsignees(List<ConsigneeEntity> consignees) {
		this.consignees = consignees;
	}
}
