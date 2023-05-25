package com.salesmanager.shop.store.facade.paycycle;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.paycircle.PersistablePaycycle;
import com.salesmanager.shop.model.paycircle.ReadablePaycycle;

public interface PaycycleFacade {
	ReadableEntityListV2<ReadablePaycycle> findAll();
	
	 ReadablePaycycle create(PersistablePaycycle persistablePaycycle);
	 
	 ReadablePaycycle update(Long id,PersistablePaycycle persistablePaycycle);
	 
	 void delete(Long id);
}
