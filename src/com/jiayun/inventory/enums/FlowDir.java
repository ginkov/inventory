package com.jiayun.inventory.enums;

public enum FlowDir {
	
	I("出库"), O("入库");

	private String description;
	
	FlowDir(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

}
