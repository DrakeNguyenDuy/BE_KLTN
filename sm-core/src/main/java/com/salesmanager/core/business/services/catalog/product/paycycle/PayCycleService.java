package com.salesmanager.core.business.services.catalog.product.paycycle;

import java.util.List;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.common.generic.SalesManagerEntityService;
import com.salesmanager.core.model.catalog.product.manufacturer.Manufacturer;
import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;

public interface PayCycleService {
	List<PayCycleDescription> getAll();
	
	PayCycleDescription getPayCycleByCode(String code);
	
	
	void saveOrUpdate(PayCycleDescription payCycleDescription) throws ServiceException;
	
	void delete(Long id);
}
