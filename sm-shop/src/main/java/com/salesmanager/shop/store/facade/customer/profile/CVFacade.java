package com.salesmanager.shop.store.facade.customer.profile;

import com.salesmanager.shop.model.customer.profile.CVDto;

public interface CVFacade {
	CVDto findCVByAlumnusName(String nickName);

	CVDto saveOrUpdate(String nickName,CVDto cvDto);

	void delete(String id);
}
