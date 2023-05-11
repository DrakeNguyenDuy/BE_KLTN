package com.salesmanager.core.business.services.catalog.product.location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.location.ProductLocationReposistory;
import com.salesmanager.core.model.location.LocationDescription;

@Service
public class ProductLocationServiceImpl implements ProductLocationService {
	@Autowired
	private ProductLocationReposistory locationReposistory;

	@Override
	public LocationDescription getLocationDescriptionByCode(String codeLocaltion) {
		return locationReposistory.getLocationDescriptionByCode(codeLocaltion);
	}

}
