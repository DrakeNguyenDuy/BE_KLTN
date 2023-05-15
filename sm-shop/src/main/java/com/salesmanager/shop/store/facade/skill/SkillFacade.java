package com.salesmanager.shop.store.facade.skill;

import com.salesmanager.shop.model.entity.ReadableEntityList;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

public interface SkillFacade {
	public ReadableEntityList<ReadableSkillDescription> getSkills();
}
