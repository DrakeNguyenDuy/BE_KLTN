package com.salesmanager.core.business.services.catalog.product.position;

import java.util.List;

import com.salesmanager.core.model.catalog.product.position.PositionDescription;

public interface ProductPositionService {
	List<PositionDescription> getAll();

	PositionDescription getPositionBycode(String code);
}
