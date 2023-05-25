package com.salesmanager.shop.mapper.paycircle;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.paycircle.PersistablePaycycle;

@Component
public class PersistablePaycycleMapper implements Mapper<PersistablePaycycle, PayCycleDescription> {

	@Override
	public PayCycleDescription convert(PersistablePaycycle source, MerchantStore store, Language language) {
		PayCycleDescription payCycleDescription = new PayCycleDescription();
		return merge(source, payCycleDescription, store, language);
	}

	@Override
	public PayCycleDescription merge(PersistablePaycycle source, PayCycleDescription destination, MerchantStore store,
			Language language) {
		Validate.notNull(source, "Paycycle can be not null");
		if(source.getCode()!=null) {
			destination.setCode(source.getCode());
		}
		if(source.getName()!=null)
			destination.setName(source.getName());
		return destination;
	}

}
