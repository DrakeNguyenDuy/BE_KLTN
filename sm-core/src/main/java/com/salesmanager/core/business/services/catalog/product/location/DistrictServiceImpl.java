package com.salesmanager.core.business.services.catalog.product.location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.location.DistrictReposistory;
import com.salesmanager.core.model.address.District;

@Service
public class DistrictServiceImpl implements DistrictService {

	@Autowired
	private DistrictReposistory districtReposistory;

	@Override
	public District findByIdDistrict(Long id) {
		return districtReposistory.findByIdDistrict(id);
	}

}
