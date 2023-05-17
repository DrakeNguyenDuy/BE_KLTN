package com.salesmanager.core.business.services.catalog.product.location;

import java.util.List;

import com.salesmanager.core.model.location.LocationDescription;

public interface ProductLocationService {

	LocationDescription getLocationDescriptionByCode(String codeLocaltion);
	
	List<LocationDescription> getLocations();
}
