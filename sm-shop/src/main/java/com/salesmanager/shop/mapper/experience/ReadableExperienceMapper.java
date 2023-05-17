package com.salesmanager.shop.mapper.experience;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.experience.ReadableExperience;

@Component
public class ReadableExperienceMapper implements Mapper<ExperienceDescription, ReadableExperience> {

	@Override
	public ReadableExperience convert(ExperienceDescription source, MerchantStore store, Language language) {
		ReadableExperience experience = new ReadableExperience();
		return this.merge(source, experience, store, language);
	}

	@Override
	public ReadableExperience merge(ExperienceDescription source, ReadableExperience destination, MerchantStore store,
			Language language) {
		Validate.notNull(source,"Experience can be not null");
		destination.setCode(source.getCODE());
		destination.setName(source.getNAME());
		return destination;
	}

}
