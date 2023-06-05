package com.salesmanager.shop.mapper.englishLevel;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.englishlevel.EnglishLevel;
import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.englishLevel.PersistableEnglishLevel;
import com.salesmanager.shop.model.experience.PersistableExperience;

@Component
public class PersistableEnglishLevelMapper {

	public EnglishLevel convert(PersistableEnglishLevel source) {
		Validate.notNull(source.getCode(), "Code experience can be not null");
		Validate.notNull(source.getName(), "Name experience can be not null");
		EnglishLevel englishLevel = new EnglishLevel();
		if (source.getCode() != null)
			englishLevel.setCode(source.getCode());
		if (source.getName() != null)
			englishLevel.setName(source.getName());
		return englishLevel;
	}

}
