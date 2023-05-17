package com.salesmanager.shop.mapper.location;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.address.Province;
import com.salesmanager.core.model.address.Ward;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.location.ReadableProvince;
import com.salesmanager.shop.model.location.ReadableWard;

@Component
public class ReadableWardMapper implements Mapper<Ward, ReadableWard> {

	@Override
	public ReadableWard convert(Ward source, MerchantStore store, Language language) {
		ReadableWard province = new ReadableWard();
		return merge(source, province, null, null);
	}

	@Override
	public ReadableWard merge(Ward source, ReadableWard destination, MerchantStore store,
			Language language) {
		Validate.notNull(source, "Ward can not be null");
		Validate.notNull("Readable ward can not be null");
		destination.setId(source.getIdWard());
		destination.setName(source.getName());
		return destination;
	}

}
