package com.salesmanager.core.business.services.catalog.product.location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.location.ProvinceReposistory;
import com.salesmanager.core.model.address.Province;

@Service
public class ProvinceServiceImpl implements ProvinceService {
	@Autowired
	private ProvinceReposistory provinceReposistory;

	@Override
	public Province findByIdProvince(Long id) {
		return provinceReposistory.findByIdProvince(id);
	}
}
