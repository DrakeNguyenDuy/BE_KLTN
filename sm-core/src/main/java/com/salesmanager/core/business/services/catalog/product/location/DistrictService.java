package com.salesmanager.core.business.services.catalog.product.location;

import java.util.List;

import com.salesmanager.core.model.address.District;

public interface DistrictService {
	District findByIdDistrict(Long id);
	
	//find all districts belong a province
	List<District> findAll(Long idProvince);
}
