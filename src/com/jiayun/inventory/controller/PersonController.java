package com.jiayun.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiayun.inventory.dao.DaoReadonly;
import com.jiayun.inventory.model.Person;

@Controller
@RequestMapping("/person")
public class PersonController {
	
	@Autowired
	private DaoReadonly<Person> ldapquery;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<Person> list = ldapquery.getAll();
		
		model.addAttribute("list", list);
		
		model.addAttribute("pageTitle","人员列表");
		model.addAttribute("pageContent", "person/People");
		return "mainpage";
	}

}
