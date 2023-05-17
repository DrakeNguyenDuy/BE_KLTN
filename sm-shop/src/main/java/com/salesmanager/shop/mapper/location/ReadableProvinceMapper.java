package com.salesmanager.shop.mapper.location;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.address.Province;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.location.ReadableProvince;

@Component
public class ReadableProvinceMapper implements Mapper<Province, ReadableProvince> {

	@Override
	public ReadableProvince convert(Province source, MerchantStore store, Language language) {
		ReadableProvince province = new ReadableProvince();
		return merge(source, province, null, null);
	}

	@Override
	public ReadableProvince merge(Province source, ReadableProvince destination, MerchantStore store,
			Language language) {
		Validate.notNull(source, "Province can not be null");
		Validate.notNull(destination,"Readable Province can not be null");
		destination.setId(source.getIdProvince());
		destination.setName(source.getName());
		return destination;
	}

}
