package com.salesmanager.shop.mapper.location;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.address.District;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.location.ReadableDistrict;

@Component
public class ReadableDistrictMapper implements Mapper<District, ReadableDistrict> {

	@Override
	public ReadableDistrict convert(District source, MerchantStore store, Language language) {
		ReadableDistrict province = new ReadableDistrict();
		return merge(source, province, null, null);
	}

	@Override
	public ReadableDistrict merge(District source, ReadableDistrict destination, MerchantStore store,
			Language language) {
		Validate.notNull(source, "District can not be null");
		Validate.notNull(destination,"Readable District can not be null");
		destination.setId(source.getIdDistrict());
		destination.setName(source.getName());
		return destination;
	}

}
