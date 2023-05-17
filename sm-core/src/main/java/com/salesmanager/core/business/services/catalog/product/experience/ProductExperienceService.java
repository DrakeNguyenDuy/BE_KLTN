package com.salesmanager.core.business.services.catalog.product.experience;

import java.util.List;

import com.salesmanager.core.model.experience.ExperienceDescription;

public interface ProductExperienceService {
	ExperienceDescription getExperienceByCode(String code);
	
	List<ExperienceDescription> findALL();
}
