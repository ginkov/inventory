package com.jiayun.inventory.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jiayun.inventory.entity.Flow;
import com.jiayun.inventory.entity.Item;
import com.jiayun.inventory.enums.FlowDir;
import com.jiayun.inventory.service.FlowService;
import com.jiayun.inventory.service.ItemService;
import com.jiayun.inventory.service.WarehouseService;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	private static final Logger log = LogManager.getLogger();
	
	@Autowired
	private FlowService flowService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private WarehouseService warehouseService;
	
	@RequestMapping("/detail/{id}")
	public String detail(Model model, @PathVariable Integer id, HttpServletRequest hsr) {
		model.addAttribute("obj", itemService.getById(id));

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "库存详情");
		model.addAttribute("pageContent", "warehouse/ItemDetail"+mobileSuffix);
		return "mainpage"+mobileSuffix;	
	}
	
	@RequestMapping("/edit/{id}")
	public String edit(Model model, @PathVariable Integer id, HttpServletRequest hsr) {
		model.addAttribute("obj", itemService.getById(id));

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "库存详情");
		model.addAttribute("pageContent", "warehouse/ItemDetail"+mobileSuffix);
		return "mainpage"+mobileSuffix;			
	}
	
	@RequestMapping({"/save", "/update"})
	public String save(@ModelAttribute Item obj, HttpServletRequest hsr) {
		obj.setLastChange(new Date());
		obj.setWarehouse(warehouseService.getById(obj.getWarehouse().getId()));
		itemService.save(obj);
		log.info("管理员{} 保存库存信息 {}", hsr.getUserPrincipal().getName(), obj.toString());

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "?mobile";
		}
		
		return "redirect:/warehouse/inventory/"+obj.getWarehouse().getId()+mobileSuffix;
	}
	
	@RequestMapping("/del/{id}")
	public String del(@PathVariable Integer id, 
			HttpServletRequest hsr, RedirectAttributes ra) {

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "?mobile";
		}

		Item item = itemService.getById(id);
		if(item == null) {
			ra.addFlashAttribute("err", "找不到记录");
			return "redirect:/warehouse/list"+mobileSuffix;
		}

		Flow flowDel = genDelFlowFromItem(item, hsr.getUserPrincipal().getName());
		Integer wid = item.getWarehouse().getId();
		itemService.delById(id);
		flowService.save(flowDel);
		log.info("管理员 {} 删除库存信息 {}", hsr.getUserPrincipal().getName(), item);

		return "redirect:/warehouse/inventory/"+wid+mobileSuffix;
	}

	private Flow genDelFlowFromItem(Item item, String operatorName) {
		Flow flow = new Flow();
		flow.setItemName(item.getName());
		flow.setIo(FlowDir.O);
		flow.setOtherPlace("删除");
		flow.setOperator(operatorName);
		flow.setPurpose("管理员删除");
		flow.setWarehouseName(item.getWarehouse().getName());
		flow.setQty(item.getQty());
		flow.setTimestamp(new Date());
		flow.setUnit(item.getUnit());
		return flow;
	}

}
