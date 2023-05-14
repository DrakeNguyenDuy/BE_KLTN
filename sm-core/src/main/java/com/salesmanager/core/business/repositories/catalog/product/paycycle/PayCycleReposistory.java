package com.salesmanager.core.business.repositories.catalog.product.paycycle;

import java.util.List;

import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;

public interface PayCycleReposistory {
	List<PayCycleDescription> getAll();
	PayCycleDescription getPayCycleByCode(String code);
}
