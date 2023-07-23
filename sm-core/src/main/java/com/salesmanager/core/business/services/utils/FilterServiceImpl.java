package com.salesmanager.core.business.services.utils;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.utils.FilterReposistory;
import com.salesmanager.core.model.system.Filter;

@Service
public class FilterServiceImpl implements FilterService {
	@Autowired
	private FilterReposistory filterReposistory;

	@Override
	public List<Filter> findAll() {
		return filterReposistory.findAll();
	}

}
