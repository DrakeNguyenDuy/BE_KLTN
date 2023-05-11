package com.salesmanager.core.business.services.catalog.product.location;

import com.salesmanager.core.model.location.LocationDescription;

public interface ProductLocationService {

	LocationDescription getLocationDescriptionByCode(String codeLocaltion);
}
