package com.salesmanager.shop.mapper.skill;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.skill.SkillDescription;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.skill.PersistableSkillDescription;

@Component
public class PersistablSkillMapper implements Mapper<PersistableSkillDescription, SkillDescription> {

	@Override
	public SkillDescription convert(PersistableSkillDescription source, MerchantStore store, Language language) {
		SkillDescription skillDescription = new SkillDescription();
		return merge(source, skillDescription, store, language);
	}

	@Override
	public SkillDescription merge(PersistableSkillDescription source, SkillDescription destination, MerchantStore store,
			Language language) {
		Validate.notNull(source.getCode(), "Code can be not null");
		Validate.notNull(source.getName(), "Name can be not null");
		if (source.getCode() != null)
			destination.setCode(source.getCode());
		if (source.getName() != null)
			destination.setName(source.getName());
		return destination;
	}

}
