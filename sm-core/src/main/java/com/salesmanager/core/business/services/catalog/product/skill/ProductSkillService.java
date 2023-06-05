package com.salesmanager.core.business.services.catalog.product.skill;

import java.util.List;

import com.salesmanager.core.model.skill.SkillDescription;

public interface ProductSkillService {
	SkillDescription getSkillDescriptionByCode(String code);

	List<SkillDescription> getSkills();

	SkillDescription saveOrUpdate(SkillDescription skillDescription);

	void delete(Long id);

	List<SkillDescription> findByCodeIn(List<String> codes);
}
