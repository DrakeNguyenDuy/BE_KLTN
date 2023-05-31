package com.salesmanager.core.business.services.customer.profile;

import com.salesmanager.core.model.customer.profile.Profile;

public interface ProfileService {

	Profile findProfile(Long customerId);

	Profile saveOrUpdate(Profile profile);

	void delete(Long id);
}
