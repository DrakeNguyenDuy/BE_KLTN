package com.salesmanager.core.business.repositories.catalog.product.location;

import com.salesmanager.core.model.location.LocationDescription;

public interface ProductLocationReposistory {
	public LocationDescription getLocationDescriptionByCode(String codeLocaltion);
}
