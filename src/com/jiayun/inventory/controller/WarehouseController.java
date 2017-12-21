package com.jiayun.inventory.controller;

import java.util.Date;
import java.util.List;

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
import com.jiayun.inventory.entity.Warehouse;
import com.jiayun.inventory.enums.FlowDir;
import com.jiayun.inventory.service.FlowService;
import com.jiayun.inventory.service.ItemService;
import com.jiayun.inventory.service.WarehouseService;

@Controller
@RequestMapping("/warehouse")
public class WarehouseController {
	
	private static final Logger log = LogManager.getLogger();
	
	@Autowired
	private WarehouseService warehouseService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private FlowService flowService;

	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest hsr) {
		
		model.addAttribute("list", warehouseService.getAll());

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "仓库列表");
		model.addAttribute("pageContent", "warehouse/List"+mobileSuffix);
		return "mainpage"+mobileSuffix;	
	}
	
	@RequestMapping("/inventory/{wid}")
	public String inventory(Model model, HttpServletRequest hsr, @PathVariable Integer wid) {
		
		model.addAttribute("warehouse", warehouseService.getById(wid));
		model.addAttribute("list", itemService.getByWarehouseId(wid));

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "当前库存");
		model.addAttribute("pageContent", "warehouse/InventoryItems"+mobileSuffix);
		return "mainpage"+mobileSuffix;			
	}

	@RequestMapping("/additem/{wid}")
	public String addItem(Model model, HttpServletRequest hsr, @PathVariable Integer wid) {
		
		Warehouse warehouse = warehouseService.getById(wid);
		Flow flow = new Flow(FlowDir.I);
		flow.setWarehouseName(warehouse.getName());

		model.addAttribute("obj", 		flow);
		model.addAttribute("warehouse", 	warehouse);

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "物料入库");
		model.addAttribute("pageContent", "warehouse/AddItem"+mobileSuffix);
		return "mainpage"+mobileSuffix;			
	}
	
	@RequestMapping("/popitem/{wid}")
	public String popItem(Model model, HttpServletRequest hsr, @PathVariable Integer wid) {
		
		Warehouse warehouse = warehouseService.getById(wid);
		Flow flow = new Flow(FlowDir.O);
		flow.setWarehouseName(warehouse.getName());
		
		model.addAttribute("obj", flow);
		model.addAttribute("warehouse", 	warehouse);

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "物料出库");
		model.addAttribute("pageContent", "warehouse/PopItem"+mobileSuffix);
		return "mainpage"+mobileSuffix;			
	}
	
	@RequestMapping("/saveadd/{wid}")
	public String saveAdd(HttpServletRequest hsr, @ModelAttribute Flow obj,
			@PathVariable Integer wid, RedirectAttributes ra) {
		
		String mobileSuffix;

		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "?mobile";
		}
		else {
			mobileSuffix = "";
		}
		if(obj.getQty() < 0.001) {
			ra.addFlashAttribute("err", "入库量不能 <=0");
			return "redirect:/warehouse/inventory/"+wid+mobileSuffix;	
		}
		Item item = itemService.getByNameInWarehouse(wid, obj.getItemName());
		Warehouse warehouse = warehouseService.getById(wid);
		obj.setWarehouseName(warehouse.getName());
		obj.setIo(FlowDir.I);
		obj.setOperator(hsr.getUserPrincipal().getName());
		obj.setTimestamp(new Date());
		if(obj.getPurpose() == null) {
			obj.setPurpose("");
		}
		if(item == null) {
			item = genItemFromFlow(obj, warehouse);
		}
		else {
			item.setQty(item.getQty() + obj.getQty());
		}
		item.setLastChange(obj.getTimestamp());

		itemService.save(item);
		log.info("管理员 {} 保存库存信息 {}", hsr.getUserPrincipal().getName(), item.toString());

		flowService.save(obj);
		log.info("管理员 {} 保存存取记录 {}", hsr.getUserPrincipal().getName(), obj.toString());

		return "redirect:/warehouse/inventory/"+wid+mobileSuffix;	
		
	}
	
	@RequestMapping("/savepop/{wid}")
	public String savePop(HttpServletRequest hsr, @ModelAttribute Flow obj,
			@PathVariable Integer wid, RedirectAttributes ra) {
		
		String mobileSuffix;

		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "?mobile";
		}
		else {
			mobileSuffix = "";
		}
		
		Item item = itemService.getByNameInWarehouse(wid, obj.getItemName());

		if(obj.getQty() < 0.001) {
			ra.addFlashAttribute("err", "出库量不能 <=0");
			return "redirect:/warehouse/inventory/"+wid+mobileSuffix;	
		}
		
		if(obj.getQty() > item.getQty()) {
			ra.addFlashAttribute("err", "出库量不能大于库存");
			return "redirect:/warehouse/inventory/"+wid+mobileSuffix;	
		}
		item.setQty(item.getQty() - obj.getQty());
		
		Warehouse warehouse = warehouseService.getById(wid);
		obj.setWarehouseName(warehouse.getName());
		obj.setUnit(item.getUnit());
		obj.setIo(FlowDir.O);
		obj.setOperator(hsr.getUserPrincipal().getName());
		obj.setTimestamp(new Date());
		item.setLastChange(obj.getTimestamp());

		itemService.save(item);
		log.info("管理员{} 保存库存信息 {}", hsr.getUserPrincipal().getName(), item);

		flowService.save(obj);
		log.info("管理员{} 保存存取记录 {}", hsr.getUserPrincipal().getName(), obj);
		
		Warehouse other = warehouseService.getByName(obj.getOtherPlace());
		// 如果出库到另一个仓库，相当于仓库之间的迁移，这次一把搞定
		if(other != null) {
			Item targetItem = itemService.getByNameInWarehouse(other.getId(), obj.getItemName());
			if(targetItem == null) {
				targetItem = new Item();
				targetItem.setName(obj.getItemName());
				targetItem.setDescription(item.getDescription());
				targetItem.setQty(obj.getQty());
				targetItem.setUnit(obj.getUnit());
				targetItem.setWarehouse(other);
			}
			else {
				targetItem.setQty(targetItem.getQty() + obj.getQty());
			}
			targetItem.setLastChange(obj.getTimestamp());
			itemService.save(targetItem);
			log.info("管理员{} 保存库存信息 {}", hsr.getUserPrincipal().getName(), item);
		}

		return "redirect:/warehouse/inventory/"+wid+mobileSuffix;	
		
	}
	
	@RequestMapping("/listflow/{wid}")
	public String listflow(Model model, HttpServletRequest hsr, @PathVariable Integer wid) {
		Warehouse warehouse = warehouseService.getById(wid);
		List<Flow> list = flowService.getByWarehouseName(warehouse.getName());
		list.addAll(flowService.getByOtherPlace(warehouse.getName()));
		
		model.addAttribute("list", list);
		model.addAttribute("warehouse", 	warehouse);

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "存取记录");
		model.addAttribute("pageContent", "warehouse/ListFlow"+mobileSuffix);
		return "mainpage"+mobileSuffix;		
	}
	
	@RequestMapping("/allitem")
	public String allitem(Model model, HttpServletRequest hsr) {
		List<Item> list = itemService.getAll();
		
		model.addAttribute("list", list);

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "全部库存信息");
		model.addAttribute("pageContent", "warehouse/AllItem"+mobileSuffix);
		return "mainpage"+mobileSuffix;			
	}

	@RequestMapping("/allflow")
	public String allflow(Model model, HttpServletRequest hsr) {
		List<Flow> list = flowService.getAll();
		
		model.addAttribute("list", list);

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "全部存取记录");
		model.addAttribute("pageContent", "warehouse/AllFlow"+mobileSuffix);
		return "mainpage"+mobileSuffix;			
	}
	
	private Item genItemFromFlow(Flow flow, Warehouse warehouse) {
		Item item = new Item();
		item.setName(flow.getItemName());
		item.setQty(flow.getQty());
		item.setWarehouse(warehouse);
		item.setUnit(flow.getUnit());
		item.setLastChange(flow.getTimestamp());
		return item;
	}

}
