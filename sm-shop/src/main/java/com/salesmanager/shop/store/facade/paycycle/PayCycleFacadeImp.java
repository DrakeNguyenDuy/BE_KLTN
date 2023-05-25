package com.salesmanager.shop.store.facade.paycycle;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.repositories.catalog.product.paycycle.PayCycleReposistory;
import com.salesmanager.core.business.services.catalog.product.paycycle.PayCycleService;
import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;
import com.salesmanager.shop.mapper.paycircle.PersistablePaycycleMapper;
import com.salesmanager.shop.mapper.paycircle.ReadablePaycircleMapper;
import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.paycircle.PersistablePaycycle;
import com.salesmanager.shop.model.paycircle.ReadablePaycycle;

@Service
public class PayCycleFacadeImp implements PaycycleFacade {

	@Autowired
	private PayCycleService payCycleService;

	@Autowired
	private ReadablePaycircleMapper paycircleMapper;

	@Autowired
	private PersistablePaycycleMapper persistablePaycycleMapper;
	
	@Autowired
	private ReadablePaycircleMapper readablePaycircleMapper;
	
	@Autowired 
	private PayCycleReposistory payCycleReposistory;

	@Override
	public ReadableEntityListV2<ReadablePaycycle> findAll() {
		List<ReadablePaycycle> paycycles = payCycleService.getAll().stream()
				.map(item -> paycircleMapper.convert(item, null, null)).toList();
		ReadableEntityListV2<ReadablePaycycle> entityList = new ReadableEntityListV2<ReadablePaycycle>();
		entityList.setData(paycycles);
		return entityList;
	}

	@Override
	public ReadablePaycycle create(PersistablePaycycle persistablePaycycle) {
		PayCycleDescription payCycleDescription = persistablePaycycleMapper.convert(persistablePaycycle, null, null);
		try {
			payCycleService.saveOrUpdate(payCycleDescription);
			return readablePaycircleMapper.convert(payCycleService.getPayCycleByCode(payCycleDescription.getCode()), null, null);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void delete(Long id) {
		payCycleService.delete(id);
	}

	@Override
	public ReadablePaycycle update(Long id, PersistablePaycycle persistablePaycycle) {
		Optional<PayCycleDescription> payCycleDescriptionOpt = payCycleReposistory.findById(id);
		if(!payCycleDescriptionOpt.isPresent())
			throw new NullPointerException();
		
		PayCycleDescription payCycleDescription = persistablePaycycleMapper.convert(persistablePaycycle, null, null);
		try {
			payCycleDescription.setId(id);
			payCycleService.saveOrUpdate(payCycleDescription);
			return readablePaycircleMapper.convert(payCycleService.getPayCycleByCode(payCycleDescription.getCode()), null, null);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
