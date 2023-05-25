package com.salesmanager.core.business.repositories.catalog.product.paycycle;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;

public interface PayCycleReposistory extends JpaRepository<PayCycleDescription, Long>, CrudRepository<PayCycleDescription, Long> {
	List<PayCycleDescription> findAll();
	PayCycleDescription findByCode(String code);
}
