package com.salesmanager.core.business.services.catalog.product.paycycle;

import java.util.List;

import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;

public interface PayCycleService {
	List<PayCycleDescription> getAll();
	PayCycleDescription getPayCycleByCode(String code);
}
