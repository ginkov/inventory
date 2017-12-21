package com.jiayun.inventory.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiayun.inventory.entity.Flow;
import com.jiayun.inventory.entity.Warehouse;
import com.jiayun.inventory.service.FlowService;
import com.jiayun.inventory.service.WarehouseService;

@Controller
@RequestMapping("/flow")
public class FlowController {
	
	@Autowired
	private FlowService flowService;
	
	@Autowired
	private WarehouseService warehouseService;
	
	@RequestMapping("/detail/{id}")
	public String detail(Model model, HttpServletRequest hsr, @PathVariable Integer id) {
		Flow flow = flowService.getById(id);
		model.addAttribute("obj", flow);
		
		Warehouse warehouse = warehouseService.getByName(flow.getWarehouseName());
		model.addAttribute("warehouse", warehouse);

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "库存详情");
		model.addAttribute("pageContent", "warehouse/FlowDetail"+mobileSuffix);
		return "mainpage"+mobileSuffix;	
	}

}
