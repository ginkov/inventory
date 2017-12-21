package com.jiayun.inventory.dao;

import java.util.List;

public interface DaoReadonly <T>{
	
	public List<T> getAll();
	
	public T getByUniqueName(String uniqueName);
	
}
