package com.salesmanager.shop.store.facade.location;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.location.ReadableDistrict;
import com.salesmanager.shop.model.location.ReadableProvince;
import com.salesmanager.shop.model.location.ReadableWard;

public interface LocationFacade {
	public ReadableEntityListV2<ReadableProvince> getProvinces();
	
	public ReadableEntityListV2<ReadableDistrict> getDistrict(Long idProvince);
	
	public ReadableEntityListV2<ReadableWard> getWard(Long idDistrict);
}
