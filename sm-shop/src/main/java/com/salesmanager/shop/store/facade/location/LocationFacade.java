package com.salesmanager.shop.store.facade.location;

import com.salesmanager.shop.model.entity.ReadableEntityList;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

public interface LocationFacade {
	public ReadableEntityList<ReadableSkillDescription> getSkills();
}
