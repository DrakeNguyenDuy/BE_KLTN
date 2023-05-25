package com.salesmanager.shop.mapper.position;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.catalog.product.position.PositionDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.position.PersistablePosition;

@Component
public class PersistablePositionMapper implements Mapper<PersistablePosition, PositionDescription> {

	@Override
	public PositionDescription convert(PersistablePosition source, MerchantStore store, Language language) {
		PositionDescription positionDescription = new PositionDescription();
		return merge(source, positionDescription, store, language);
	}

	@Override
	public PositionDescription merge(PersistablePosition source, PositionDescription destination, MerchantStore store,
			Language language) {
		Validate.notNull(source.getCode(), "Code experience can be not null");
		Validate.notNull(source.getName(), "Name experience can be not null");
		if (source.getCode() != null)
			destination.setCode(source.getCode());
		if (source.getName() != null)
			destination.setName(source.getName());
		return destination;
	}

}
