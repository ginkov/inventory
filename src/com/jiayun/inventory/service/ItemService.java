package com.jiayun.inventory.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiayun.inventory.dao.Dao;
import com.jiayun.inventory.entity.Item;

@Service("itemService")
public class ItemService {
	
	@Autowired
	private Dao<Item> dao;
	
	@Autowired
	private SessionFactory sf;
	
	@Transactional
	public List<Item> getAll() {
		return dao.getAll(Item.class);
	}
	
	@Transactional
	public Item getById(Integer id) {
		return dao.getById(Item.class, id);
	}
	
	@Transactional
	public Item save(Item obj) {
		return dao.save(obj);
	}
	
	@Transactional
	public void delById(Integer id) {
		dao.delById(Item.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Item> getByWarehouseId(Integer wid){
		Session s = sf.getCurrentSession();
		return s.createCriteria(Item.class).add(Restrictions.eq("warehouse.id", wid)).list();
	}
	
	@Transactional
	public Item getByNameInWarehouse(Integer wid, String name) {
		Session s = sf.getCurrentSession();
		return (Item) s.createCriteria(Item.class)
				.add(Restrictions.eq("warehouse.id", wid))
				.add(Restrictions.eq("name", name))
				.uniqueResult();
	}

}
