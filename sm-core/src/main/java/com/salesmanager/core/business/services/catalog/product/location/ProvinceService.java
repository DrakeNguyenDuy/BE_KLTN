package com.salesmanager.core.business.services.catalog.product.location;

import java.util.List;

import com.salesmanager.core.model.address.Province;

public interface ProvinceService{
	Province findByIdProvince(Long id);
	List<Province> findAll();
}
