package com.jiayun.inventory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiayun.inventory.dao.Dao;
import com.jiayun.inventory.entity.Warehouse;

@Service("warehouseService")
public class WarehouseService {

	@Autowired
	private Dao<Warehouse> dao;

	@Transactional
	public List<Warehouse> getAll() {
		return dao.getAll(Warehouse.class);
	}
	
	@Transactional
	public Warehouse getById(Integer id) {
		return dao.getById(Warehouse.class, id);
	}
	
	@Transactional
	public Warehouse getByName(String name) {
		return dao.getByName(Warehouse.class, "name", name);
	}
	
	@Transactional
	public Warehouse save(Warehouse obj) {
		return dao.save(obj);
	}
	
	@Transactional
	public void del(Warehouse obj) {
		dao.del(obj);
	}
	
	@Transactional
	public Warehouse delById(Integer id) {
		return dao.delById(Warehouse.class, id);
	}
}
