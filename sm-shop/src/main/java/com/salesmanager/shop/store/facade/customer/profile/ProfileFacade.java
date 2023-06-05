package com.salesmanager.shop.store.facade.customer.profile;

import com.salesmanager.shop.model.customer.profile.PersistableProfile;
import com.salesmanager.shop.model.customer.profile.ReadableProfile;

public interface ProfileFacade {
	
	ReadableProfile findProfile(Long customerId);

	ReadableProfile saveOrUpdate(Long id ,PersistableProfile profile);
}
