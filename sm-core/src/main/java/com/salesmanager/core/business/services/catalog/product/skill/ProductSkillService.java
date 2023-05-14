package com.salesmanager.core.business.services.catalog.product.skill;

import com.salesmanager.core.model.skill.SkillDescription;

public interface ProductSkillService {
	SkillDescription getSkillDescriptionByCode(String code);
}
