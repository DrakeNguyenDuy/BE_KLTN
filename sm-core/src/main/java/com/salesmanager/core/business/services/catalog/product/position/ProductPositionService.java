package com.salesmanager.core.business.services.catalog.product.position;

import java.util.List;

import com.salesmanager.core.model.catalog.product.position.PositionDescription;
import com.salesmanager.core.model.skill.SkillDescription;

public interface ProductPositionService {
	List<PositionDescription> getAll();

	PositionDescription getPositionBycode(String code);
	
	PositionDescription saveOrUpdate(PositionDescription positionDescription);
	
	void delete(Long id);
}
