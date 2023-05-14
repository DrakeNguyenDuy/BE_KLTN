package com.salesmanager.core.business.repositories.catalog.product.skill;

import com.salesmanager.core.model.skill.SkillDescription;

public interface ProductSkillReposistory {
	SkillDescription getSkillDescriptionByCode(String code);
}
