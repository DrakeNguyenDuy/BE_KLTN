package com.salesmanager.core.business.services.catalog.product.paycycle;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.repositories.catalog.product.paycycle.PayCycleReposistory;
import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;

@Service
public class PayCycleServiceImpl  implements PayCycleService {

	@Autowired
	private PayCycleReposistory cycleReposistory;
	@Override
	public List<PayCycleDescription> getAll() {
		return cycleReposistory.findAll();
	}

	@Override
	public PayCycleDescription getPayCycleByCode(String code) {
		return cycleReposistory.findByCode(code);
	}

	@Override
	@Transactional
	public void saveOrUpdate(PayCycleDescription payCycleDescription) throws ServiceException {
		cycleReposistory.saveAndFlush(payCycleDescription);
	}

	@Override
	@Transactional
	public void delete(Long id) {
		Optional<PayCycleDescription> payCycleDescription = cycleReposistory.findById(id);
		if(payCycleDescription.isPresent()) {
			cycleReposistory.delete(payCycleDescription.get());	
		}
	}

}
