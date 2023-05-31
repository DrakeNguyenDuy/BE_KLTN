package com.salesmanager.shop.mapper.location;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.address.District;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.location.PersistableDistrict;
import com.salesmanager.shop.model.location.ReadableDistrict;

@Component
public class PersistableDistrictMapper implements Mapper<PersistableDistrict, District> {

	@Override
	public District convert(PersistableDistrict source, MerchantStore store, Language language) {
		District district = new District();
		return merge(source, district, store, language);
	}

	@Override
	public District merge(PersistableDistrict source, District destination, MerchantStore store,
			Language language) {
		Validate.notNull(source, "District can not be null");
		Validate.notNull(destination,"Readable District can not be null");
		destination.setName(source.getName());
		return destination;
	}

}
