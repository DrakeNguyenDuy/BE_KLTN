package com.salesmanager.shop.store.facade.skill;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.skill.PersistableSkillDescription;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

public interface SkillFacade {
	public ReadableEntityListV2<ReadableSkillDescription> getSkills();

	ReadableSkillDescription save(PersistableSkillDescription persistableSkillDescription);

	ReadableSkillDescription update(Long id, PersistableSkillDescription persistableSkillDescription);
	
	void delete(Long id);
}
