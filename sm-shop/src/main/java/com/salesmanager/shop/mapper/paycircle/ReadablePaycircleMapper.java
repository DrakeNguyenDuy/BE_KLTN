package com.salesmanager.shop.mapper.paycircle;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.paycircle.ReadablePaycycle;

@Component
public class ReadablePaycircleMapper implements Mapper<PayCycleDescription, ReadablePaycycle> {

	@Override
	public ReadablePaycycle convert(PayCycleDescription source, MerchantStore store, Language language) {
		ReadablePaycycle readablePaycycle = new ReadablePaycycle();
		return merge(source, readablePaycycle, store, language);
	}

	@Override
	public ReadablePaycycle merge(PayCycleDescription source, ReadablePaycycle destination, MerchantStore store,
			Language language) {
		Validate.notNull(source, "Paycycle can be not null");
		Validate.notNull(destination, "Readable paycycle can be not null");
		destination.setCode(source.getCode());
		destination.setName(source.getName());
		return destination;
	}

}
