package com.salesmanager.shop.store.facade.paycycle;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.paycircle.ReadablePaycycle;

public interface PaycycleFacade {
	ReadableEntityListV2<ReadablePaycycle> findAll();
}
