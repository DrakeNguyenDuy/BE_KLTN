package com.salesmanager.core.business.repositories.utils;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.system.Filter;

public interface FilterReposistory extends JpaRepository<Filter, String>{

}
