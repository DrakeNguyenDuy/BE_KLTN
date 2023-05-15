package com.salesmanager.core.business.repositories.catalog.product.skill;

import java.util.List;

import com.salesmanager.core.model.skill.SkillDescription;

public interface ProductSkillReposistory {
	SkillDescription getSkillDescriptionByCode(String code);
	public List<SkillDescription> getSkills();
}
