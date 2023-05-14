package com.salesmanager.core.business.services.catalog.product.paycycle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.paycycle.PayCycleReposistory;
import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;

@Service
public class PayCycleServiceImpl implements PayCycleService {

	@Autowired
	private PayCycleReposistory cycleReposistory;
	@Override
	public List<PayCycleDescription> getAll() {
		return cycleReposistory.getAll();
	}

	@Override
	public PayCycleDescription getPayCycleByCode(String code) {
		return cycleReposistory.getPayCycleByCode(code);
	}

}
