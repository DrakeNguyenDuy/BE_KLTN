package com.salesmanager.core.business.repositories.catalog.product.experience;

import com.salesmanager.core.model.experience.ExperienceDescription;

public interface ProductExperienceReposistory {
	ExperienceDescription getExperienceByCode(String code);
}
