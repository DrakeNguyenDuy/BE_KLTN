package com.salesmanager.shop.mapper.experience;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.experience.PersistableExperience;

@Component
public class PersistableExperienceMapper implements Mapper<PersistableExperience, ExperienceDescription> {

	@Override
	public ExperienceDescription convert(PersistableExperience source, MerchantStore store, Language language) {
		ExperienceDescription experienceDescription = new ExperienceDescription();
		return merge(source, experienceDescription, null, null);
	}

	@Override
	public ExperienceDescription merge(PersistableExperience source, ExperienceDescription destination,
			MerchantStore store, Language language) {
		Validate.notNull(source.getCode(), "Code experience can be not null");
		Validate.notNull(source.getName(), "Name experience can be not null");
		if (source.getCode() != null)
			destination.setCODE(source.getCode());
		if (source.getName() != null)
			destination.setNAME(source.getName());
		return destination;
	}

}
