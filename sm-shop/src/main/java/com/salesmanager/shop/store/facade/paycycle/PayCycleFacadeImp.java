package com.salesmanager.shop.store.facade.paycycle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.services.catalog.product.paycycle.PayCycleService;
import com.salesmanager.shop.mapper.paycircle.ReadablePaycircleMapper;
import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.paycircle.ReadablePaycycle;

@Service
public class PayCycleFacadeImp implements PaycycleFacade {

	@Autowired
	private PayCycleService payCycleService;

	@Autowired
	private ReadablePaycircleMapper paycircleMapper;

	@Override
	public ReadableEntityListV2<ReadablePaycycle> findAll() {
		List<ReadablePaycycle> paycycles = payCycleService.getAll().stream().map(item -> paycircleMapper.convert(item, null, null)).toList();
		ReadableEntityListV2<ReadablePaycycle> entityList = new ReadableEntityListV2<ReadablePaycycle>();
		entityList.setData(paycycles);
		return entityList;
	}

}
