package com.salesmanager.shop.store.facade.customer.profile;

import org.springframework.web.multipart.MultipartFile;

import com.salesmanager.shop.model.customer.profile.PersistableProfile;
import com.salesmanager.shop.model.customer.profile.ReadableProfile;

public interface ProfileFacade {
	
	ReadableProfile findProfile(String customerName);

	ReadableProfile saveOrUpdate(String customerName ,PersistableProfile profile);
	
	void uploadAvatar(String username,MultipartFile avatar);
	
	byte[] getAvatar(String username);
}
