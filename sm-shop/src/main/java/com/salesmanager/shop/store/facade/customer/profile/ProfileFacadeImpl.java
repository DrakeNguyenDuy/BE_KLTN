//package com.salesmanager.shop.store.facade.customer.profile;
//
//import org.springframework.beans.factory.annotation.Autowired;
//
//import com.salesmanager.core.business.services.customer.profile.ProfileService;
//import com.salesmanager.core.model.customer.profile.Profile;
//import com.salesmanager.shop.mapper.customer.profile.PersistableProfileMapper;
//import com.salesmanager.shop.mapper.customer.profile.ReadableProfileMapper;
//import com.salesmanager.shop.model.customer.profile.PersistableProfile;
//import com.salesmanager.shop.model.customer.profile.ReadableProfile;
//
//public class ProfileFacadeImpl implements ProfileFacade {
//
//	@Autowired
//	private ProfileService profileService;
//
//	@Autowired
//	private ReadableProfileMapper readableProfileMapper;
//
//	@Autowired
//	private PersistableProfileMapper persistableProfileMapper;
//
//	@Override
//	public ReadableProfile findProfile(Long customerId) {
//		return readableProfileMapper.convert(profileService.findProfile(customerId), null, null);
//	}
//
//	@Override
//	public ReadableProfile save(PersistableProfile profile) {
//	Profile p = persistableProfileMapper.
//		return readableProfileMapper.convert(profileService.saveOrUpdate(profile), null, null);
//	}
//
//	@Override
//	public ReadableProfile update(PersistableProfile profile) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void delete(Long id) {
//		// TODO Auto-generated method stub
//
//	}
//
//}
