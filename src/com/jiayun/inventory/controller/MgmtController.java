package com.jiayun.inventory.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiayun.inventory.dao.DaoReadonly;
import com.jiayun.inventory.entity.Warehouse;
import com.jiayun.inventory.model.Person;
import com.jiayun.inventory.service.WarehouseService;

@Controller
@RequestMapping("/mgmt")
public class MgmtController {
	
	@Autowired
	private WarehouseService warehouseService;
	
	@Autowired
	private DaoReadonly<Person> ldapquery;
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest hsr) {
		model.addAttribute("list", warehouseService.getAll());

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "仓库列表");
		model.addAttribute("pageContent", "mgmt/List"+mobileSuffix);
		return "mainpage"+mobileSuffix;	
	}
	
	@RequestMapping("/input")
	public String input(Model model, HttpServletRequest hsr) {
		model.addAttribute("obj", new Warehouse());
		model.addAttribute("people", ldapquery.getAll());

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "新建仓库");
		model.addAttribute("pageContent", "mgmt/Input"+mobileSuffix);
		return "mainpage"+mobileSuffix;	
	}
	
	@RequestMapping("/detail/{id}")
	public String detail(Model model, HttpServletRequest hsr, @PathVariable Integer id) {
		model.addAttribute("obj", warehouseService.getById(id));
		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		
		model.addAttribute("pageTitle",   "仓库详情");
		model.addAttribute("pageContent", "mgmt/Detail"+mobileSuffix);
		return "mainpage"+mobileSuffix;	
	}
	
	@RequestMapping("/edit/{id}")
	public String edit(Model model, HttpServletRequest hsr, @PathVariable Integer id) {
		model.addAttribute("obj", warehouseService.getById(id));
		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "M";
		}
		model.addAttribute("people", ldapquery.getAll());
		model.addAttribute("pageTitle",   "编辑仓库");
		model.addAttribute("pageContent", "mgmt/Edit"+mobileSuffix);
		return "mainpage"+mobileSuffix;	
	}
	
	@RequestMapping({"/save", "/update"})
	public String save(@ModelAttribute Warehouse obj, HttpServletRequest hsr) {

		Person p = ldapquery.getByUniqueName(obj.getOwner());
		obj.setOwnerName(p.getName());
		warehouseService.save(obj);

		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "?mobile";
		}
		
		return "redirect:/mgmt/list"+mobileSuffix;
	}
	
	@RequestMapping("/del/{id}")
	public String del(HttpServletRequest hsr, @PathVariable Integer id) {
		
		warehouseService.delById(id);
		
		String mobileSuffix = "";
		if(hsr.getParameterMap().containsKey("mobile")) {
			mobileSuffix = "?mobile";
		}
		
		return "redirect:/mgmt/list"+mobileSuffix;
	}
}
