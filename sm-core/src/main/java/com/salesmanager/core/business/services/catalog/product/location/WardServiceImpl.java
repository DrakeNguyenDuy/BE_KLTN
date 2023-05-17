package com.salesmanager.core.business.services.catalog.product.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.location.WardReposistory;
import com.salesmanager.core.model.address.Ward;

@Service
public class WardServiceImpl implements WardService {

	@Autowired
	private WardReposistory wardReposistory;

	@Override
	public Ward findByIdWard(Long idWa) {
		return wardReposistory.findByIdWard(idWa);
	}

	@Override
	public List<Ward> findAll(Long idDistrict) {
		return wardReposistory.findAll(idDistrict);
	}

}
