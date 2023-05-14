package com.salesmanager.core.business.repositories.catalog.product.position;

import java.util.List;

import com.salesmanager.core.model.catalog.product.position.PositionDescription;

public interface ProductPositionReposistory {
	List<PositionDescription> getAll();
	PositionDescription getPositionBycode(String code);
}
