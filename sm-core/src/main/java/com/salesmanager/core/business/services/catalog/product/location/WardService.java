package com.salesmanager.core.business.services.catalog.product.location;

import java.util.List;

import com.salesmanager.core.model.address.Ward;

public interface WardService  {

	Ward findByIdWard(Long idWard);
	
	//find all wards belong a district
	List<Ward> findAll(Long idDistrict);
}
