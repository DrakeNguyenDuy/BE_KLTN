package com.salesmanager.shop.mapper.position;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.catalog.product.position.PositionDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.position.ReadablePosition;

@Component
public class ReadablePositionMapper implements Mapper<PositionDescription, ReadablePosition> {

	@Override
	public ReadablePosition convert(PositionDescription source, MerchantStore store, Language language) {
		ReadablePosition readablePostion = new ReadablePosition();
		return this.merge(source, readablePostion, store, language);
	}

	@Override
	public ReadablePosition merge(PositionDescription source, ReadablePosition destination, MerchantStore store,
			Language language) {
		Validate.notNull(source, "Position can be not null");
		Validate.notNull(destination, "Readable position can be not null");
		destination.setId(source.getID_POSITION());
		destination.setCode(source.getCode());
		destination.setName(source.getName());
		return destination;
	}

}
