package com.salesmanager.shop.mapper.skill;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.skill.SkillDescription;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.skill.PersistableSkillDescription;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

@Component
public class ReadableSkillMapper implements Mapper<SkillDescription, ReadableSkillDescription> {

	@Override
	public ReadableSkillDescription convert(SkillDescription source, MerchantStore store, Language language) {
		ReadableSkillDescription skillDescription = new ReadableSkillDescription();
		return merge(source, skillDescription, store, language);
	}

	@Override
	public ReadableSkillDescription merge(SkillDescription source, ReadableSkillDescription destination,
			MerchantStore store, Language language) {
		Validate.notNull(source.getCode(), "Code can be not null");
		Validate.notNull(source.getName(), "Name can be not null");
		if (source.getCode() != null)
			destination.setCode(source.getCode());
		if (source.getName() != null)
			destination.setName(source.getName());
		return destination;
	}	

}
