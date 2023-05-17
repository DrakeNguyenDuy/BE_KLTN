package com.salesmanager.shop.store.facade.position;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.position.ReadablePostion;

public interface PositionFacade {

	ReadableEntityListV2<ReadablePostion> getAll();
}
