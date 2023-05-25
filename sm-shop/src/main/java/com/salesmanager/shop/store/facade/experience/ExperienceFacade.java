package com.salesmanager.shop.store.facade.experience;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.experience.PersistableExperience;
import com.salesmanager.shop.model.experience.ReadableExperience;

public interface ExperienceFacade {
	ReadableEntityListV2<ReadableExperience> findAll();
	
	ReadableExperience crearte(PersistableExperience persistableExperience);
	
	ReadableExperience update(Long id, PersistableExperience persistableExperience);
	
	void delete(Long id);
}
