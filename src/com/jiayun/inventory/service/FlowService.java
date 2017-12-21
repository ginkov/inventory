package com.jiayun.inventory.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiayun.inventory.dao.Dao;
import com.jiayun.inventory.entity.Flow;

@Service("flowService")
public class FlowService {
	
	@Autowired
	private Dao<Flow> dao;
	
	@Autowired
	private SessionFactory sf;
	
	@Transactional
	public List<Flow> getAll() {
		return dao.getAll(Flow.class);
	}
	
	@Transactional
	public Flow getById(Integer id) {
		return dao.getById(Flow.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Flow> getByWarehouseName(String name) {
		Session s = sf.getCurrentSession();
		return s.createCriteria(Flow.class).add(Restrictions.eq("warehouseName", name)).list();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Flow> getByOtherPlace(String name) {
		Session s = sf.getCurrentSession();
		return s.createCriteria(Flow.class).add(Restrictions.eq("otherPlace", name)).list();
	}
	
	@Transactional
	public Flow save(Flow obj) {
		return dao.save(obj);
	}
}
