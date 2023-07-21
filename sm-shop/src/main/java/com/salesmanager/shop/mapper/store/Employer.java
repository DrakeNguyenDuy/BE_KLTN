package com.salesmanager.shop.mapper.store;

import org.springframework.stereotype.Component;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.shop.model.store.ReadableEmployer;

@Component
public class Employer {

	public ReadableEmployer convertToDto(MerchantStore source) {
		ReadableEmployer result = new ReadableEmployer();
		result.setId(source.getId());
		result.setAddress(source.getStoreaddress());
		result.setDescription(source.getDescription());
		if (source.getStoreLogo() != null) {
			result.setLogo("/api/v1/store/" + source.getCode() + "/marketing/logo");
		}
		if (source.getBackGround() != null) {
			result.setBackground("/api/v1/store/" + source.getCode() + "/background");
		}
		result.setSologan(source.getSologan());
		result.setName(source.getStorename());
		result.setPhone(source.getStorephone());
		result.setCode(source.getCode());
		return result;
	}
}