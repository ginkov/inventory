package com.jiayun.inventory.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.jiayun.inventory.enums.FlowDir;

@Entity
@Table(name="flow")
public class Flow {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="flow_date", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date timestamp;
	
	@Column(name="item_name")
	private String itemName;
	
	@Column
	private Double qty;
	
	@Column
	private String unit;
	
	@Column
	@Enumerated(EnumType.STRING)
	private FlowDir io;
	
	@Column(name="warehouse_name")
	private String warehouseName;
	
	@Column(name="other_place")
	private String otherPlace;
	
	@Column
	private String operator;

	@Column
	private String purpose;
	
	public Flow() {
		
	}
	public Flow(FlowDir d) {
		this.io = d;
	}

	@Override
	public String toString() {
		if(FlowDir.I.equals(io)) {
			return String.format("%tF %s: %s %.2f(%s) 从 %s 到 %s, 库管: %s", 
					timestamp, io.getDescription(),
					itemName, qty, unit,
					otherPlace, warehouseName, operator);
		}
		else {
			return String.format("%tF %s: %s %.2f(%s) 从 %s 到 %s, 库管: %s", 
					timestamp, io.getDescription(),
					itemName, qty, unit,
					warehouseName, otherPlace, operator);
		}
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Double getQty() {
		return qty;
	}

	public void setQty(Double qty) {
		this.qty = qty;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getWarehouseName() {
		return warehouseName;
	}

	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
	}

	public String getOtherPlace() {
		return otherPlace;
	}

	public void setOtherPlace(String otherPlace) {
		this.otherPlace = otherPlace;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public FlowDir getIo() {
		return io;
	}

	public void setIo(FlowDir io) {
		this.io = io;
	}

}
