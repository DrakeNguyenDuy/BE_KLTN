package com.salesmanager.shop.store.facade.product;

import java.util.List;

import com.salesmanager.core.model.customer.JobRate;
import com.salesmanager.shop.model.catalog.product.jobRate.JobRateDto;
import com.salesmanager.shop.util.FilterDto;

public interface FilterFacade {
	public List<FilterDto> findAll();
}
