package com.salesmanager.shop.store.facade.location;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

public interface LocationFacade {
	public ReadableEntityListV2<ReadableSkillDescription> getLocations();
}
