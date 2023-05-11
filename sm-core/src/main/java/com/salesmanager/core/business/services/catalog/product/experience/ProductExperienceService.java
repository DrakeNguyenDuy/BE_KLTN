package com.salesmanager.core.business.services.catalog.product.experience;

import com.salesmanager.core.model.experience.ExperienceDescription;

public interface ProductExperienceService {
	ExperienceDescription getExperienceByCode(String code);
}
