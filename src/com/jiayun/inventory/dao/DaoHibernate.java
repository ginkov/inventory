package com.jiayun.inventory.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DaoHibernate<T> implements Dao<T> {
	
	@Autowired
	private SessionFactory sf;

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getAll(Class<T> type) {
		return sf.getCurrentSession().createCriteria(type).list();
	}

	@Override
	public T getById(Class<T> type, Integer id) {
		return sf.getCurrentSession().get(type, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T getByName(Class<T> type, String fieldName, String nameString) {
		Session session = sf.getCurrentSession();
		return (T)session.createCriteria(type).add(Restrictions.eq(fieldName, nameString)).uniqueResult();
	}

	@Override
	public T save(T t) {
		sf.getCurrentSession().saveOrUpdate(t);
		return t;
	}

	@Override
	public T update(T t) {
		sf.getCurrentSession().saveOrUpdate(t);
		return t;
	}

	@Override
	public T delById(Class<T> type, Integer id) {
		T old = getById(type, id);
		sf.getCurrentSession().delete(old);
		return old;
	}

	@Override
	public T del(T t) {
		sf.getCurrentSession().delete(t);
		return t;
	}
	

}
