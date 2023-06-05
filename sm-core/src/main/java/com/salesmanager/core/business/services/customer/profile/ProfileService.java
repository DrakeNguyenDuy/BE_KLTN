package com.salesmanager.core.business.services.customer.profile;

import com.salesmanager.core.model.customer.profile.Profile;

public interface ProfileService {

	Profile findProfileByCustomerName(String customerName);

	Profile saveOrUpdate(Profile profile);
	
	void uploadAvatar(String username, byte[] byteAvt);
	
	byte[] getAvatar(String username);
}
