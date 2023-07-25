package com.salesmanager.shop.store.facade.customer.profile;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.salesmanager.core.business.services.customer.profile.ProfileService;
import com.salesmanager.core.business.services.customer.profile.ProfileSkillService;
import com.salesmanager.core.model.customer.profile.Profile;
import com.salesmanager.core.model.customer.profile.ProfileSkillEntry;
import com.salesmanager.shop.mapper.customer.profile.PersistableProfileMapper;
import com.salesmanager.shop.mapper.customer.profile.ReadableProfileMapper;
import com.salesmanager.shop.model.customer.profile.PersistableProfile;
import com.salesmanager.shop.model.customer.profile.ReadableProfile;

@Component
public class ProfileFacadeImpl implements ProfileFacade {

	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private ProfileSkillService profileSkillService;

	@Autowired
	private ReadableProfileMapper readableProfileMapper;

	@Autowired
	private PersistableProfileMapper persistableProfileMapper;

	//customer name is nick name
	@Override
	public ReadableProfile findProfile(String customerName) {
		Profile profile = profileService.findProfileByCustomerName(customerName);
		if (profile == null)
			return null;
		return readableProfileMapper.convert(profile, null, null);
	}

	@Override
	public ReadableProfile saveOrUpdate(String customerName, PersistableProfile profile) {
		Profile p = persistableProfileMapper.convertToEntity(customerName, profile);
		List<ProfileSkillEntry> profileSkillEntries = p.getSkills();
		profileSkillService.deleteByProfile(p);
		profileSkillEntries = profileSkillService.saveAll(profileSkillEntries);
		p = profileService.saveOrUpdate(p);
		p.setSkills(profileSkillEntries);
		return readableProfileMapper.convert(p, null, null);
	}

	@Override
	public void uploadAvatar(String username, MultipartFile avatar) {
		try {
			byte[] byteAvt = avatar.getBytes();
			profileService.uploadAvatar(username, byteAvt);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public byte[] getAvatar(String username) {
		return profileService.getAvatar(username);
	}

}
