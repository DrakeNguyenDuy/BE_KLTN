package com.salesmanager.shop.store.facade.customer.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.services.customer.profile.ProfileService;
import com.salesmanager.core.model.customer.profile.Profile;
import com.salesmanager.shop.mapper.customer.profile.PersistableProfileMapper;
import com.salesmanager.shop.mapper.customer.profile.ReadableProfileMapper;
import com.salesmanager.shop.model.customer.profile.PersistableProfile;
import com.salesmanager.shop.model.customer.profile.ReadableProfile;

@Component
public class ProfileFacadeImpl implements ProfileFacade {

	@Autowired
	private ProfileService profileService;

	@Autowired
	private ReadableProfileMapper readableProfileMapper;

	@Autowired
	private PersistableProfileMapper persistableProfileMapper;

	@Override
	public ReadableProfile findProfile(Long customerId) {
		return readableProfileMapper.convert(profileService.findProfile(customerId), null, null);
	}

	@Override
	public ReadableProfile saveOrUpdate(Long id, PersistableProfile profile) {
		Profile p = persistableProfileMapper.convertToEntity(id, profile);
		return readableProfileMapper.convert(profileService.saveOrUpdate(p), null, null);
	}

}
