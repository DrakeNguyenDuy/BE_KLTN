package com.salesmanager.shop.mapper.store;

import org.springframework.stereotype.Component;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.marketplace.SignupStore;
import com.salesmanager.shop.model.references.MeasureUnit;
import com.salesmanager.shop.model.references.PersistableAddress;
import com.salesmanager.shop.model.references.WeightUnit;
import com.salesmanager.shop.model.store.PersistableMerchantStore;

@Component
public class StoreMapper implements Mapper<SignupStore, PersistableMerchantStore> {

	@Override
	public PersistableMerchantStore convert(SignupStore source, MerchantStore store, Language language) {
		// TODO Auto-generated method stub
		PersistableMerchantStore merchantStore = new PersistableMerchantStore();
		merchantStore.setCode(source.getCode());
		merchantStore.setName(source.getName());
		merchantStore.setCurrencyFormatNational(true);
		merchantStore.setCurrency("VND");
		merchantStore.setDefaultLanguage("vn");
		merchantStore.setDimension(MeasureUnit.CM);
		merchantStore.setEmail(source.getEmail());
		merchantStore.setInBusinessSince("2023-05-03T08:05:10.746Z");
		merchantStore.setName(source.getName());
		merchantStore.setPhone("0378989394");
		merchantStore.setRetailer(true);
		merchantStore.setUseCache(true);
		merchantStore.setWeight(WeightUnit.JOB);
		PersistableAddress persistableAddress = new PersistableAddress();
		persistableAddress.setAddress("chưa biết");
		persistableAddress.setCity("Ho Chi Minh City");
		persistableAddress.setCountry("CA");
		persistableAddress.setPostalCode("84");
		persistableAddress.setStateProvince("QC");
		persistableAddress.setActive(true);
		merchantStore.setAddress(persistableAddress);
		return merchantStore;
	}

	@Override
	public PersistableMerchantStore merge(SignupStore source, PersistableMerchantStore destination, MerchantStore store,
			Language language) {
		// TODO Auto-generated method stub
		return null;
	}
	public MerchantStore convert(SignupStore source) {
		MerchantStore merchantStore = new MerchantStore();
		merchantStore.setCode(source.getCode());
		return merchantStore;
	}
	
}
